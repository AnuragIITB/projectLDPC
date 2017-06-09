#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#include <time.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif


#define  PI 3.1415926

//------------------------------------------------------------------------------
void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

//--------------------------------------------------------------------------------


uint16_t ncols , nrows ;

float rate ; 

uint8_t maxNitr;

float ebbyNo  ;
float ebbyNodb ;

double mean ; 
double variance ;

float code_block[MATRIX_ORDER];

//-----------------------------------------------------------------------------------------------------------


void bpsk_demodulate()
{
	fprintf(stderr," bpsk_demodulate\n");
	int I;
	for (I =0 ; I < ncols ; I++)
		{
		if (code_block[I] < 0.0 )
			{
			code_block[I] = 0.0 ;
			//fprintf(stderr,"\n I do came here!\n");
			}
		}
}
//------------------------------------------------------------------------------------

generateCodeBlockWithAWGN ( )
{
	int    i, j;
	unsigned seed;
	double x1, x2, x, xn, y, yn;
	float code_bit ;

	seed = time(NULL);
	FILE* code_block_file ;
	code_block_file = fopen ("Code_block.txt","w");
	srand(seed);
	for (i = 0; i < ncols ; i++) 
  		{
   		// x1, x2: uniform random variables in the range [0, 1]
   		do 
   		x1 = (double)rand()/RAND_MAX;
    	while (x1 == 0);    // x1 can't be zero
    	x2 = (double)rand()/RAND_MAX;

    	// x, y: unit normal random variables, ~N(0, 1)
    	// xn, yn: normal random variables, ~N(mean, variance)
    	x = sqrt(-2*log(x1)) * cos(2*PI*x2);
    	xn = mean + sqrt(variance) * x;
    	// y = sqrt(-2*log(x1)) * sin(2*PI*x2);
    	// yn = mean + sqrt(variance) * y;
		
		code_bit = -1 + xn;   // Add noise to pixel
/*		if (code_bit > 0)
	    code_bit = 1 ;
    	else 
   		code_bit = -1 ;
*/   		
      	write_float32("code_block_in",code_bit) ;
		fprintf(code_block_file,"%f\n",code_bit);
   	 	}
   	 fclose(code_block_file);
   	 fprintf(stderr ,"One code Block written!");   
}

//-------------------------------------------------------------------------------------------------
// reading the input parity check matrix in structure
void sendInputs(FILE* in_file) 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR 
		write_float32("ebbyNo_in", ebbyNo );
		fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		//
		// write matrix entries from matrix pipe
		//

		uint16_t numread, val;
		uint64_t count = 0 ;
		while(1) 
			{
			numread = fscanf(in_file,"%d\n", &val );
			if (numread != 1)
				{
				fprintf (stderr,"ERROR : In reading matrix file \n");
				break;
				}			
//			fprintf(stderr,"Info: write to pipe = %d\n",val);	
			write_uint16("matrix_in", val);			
			if (count == 0) 
				{ 
				nrows = val ;
				//fprintf(stderr, "nrows = %d ",nrows);
				}
			if (count == 1) 
				{
				ncols = val ;
				//fprintf(stderr, "ncols = %d ",ncols);
				}
			count++ ;
			} 
		//
		// write rate
		rate = (float) (ncols-nrows)/(ncols) ;
		write_float32("rate_in", rate );
		fprintf(stderr, "rate_in = %f \n",rate);		
		

}


//
//----------------------------------------------------------------------------------------------------

#ifdef SW
DEFINE_THREAD(top_daemon)
#endif

int main(int argc,char* argv[])
{

	signal(SIGINT, Exit);
	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(top_daemon);
	PTHREAD_CREATE(top_daemon);	
#endif

	// reading arguments from command line
	FILE* matrix_file ;
	
	matrix_file = fopen (argv[1], "r");
	maxNitr = atoi( argv[4] );
	ebbyNodb= atof( argv[5] );
	
	ebbyNo = pow(10,0.1*ebbyNodb) ;
	// writing them to pipes to send inputs to core
	sendInputs( matrix_file );
	fclose(matrix_file);
	
	
	rate = (float) ((ncols)-(nrows))/(ncols); 
	fprintf(stderr,"rate = %f\n",rate);
	
	variance = (1/(2*rate*ebbyNo)) ;
	fprintf(stderr,"variance = %lf\n",variance);
	mean = 0.0 ;
	
	uint64_t block_count = 0;
	
	// start sending code blocks till we get first error
	//while(block_count<1)    //	--debug statement
	while(1)
		{
		uint32_t incorrect_bits ;
		// function to introduce error in code block and send it to the core.
		generateCodeBlockWithAWGN () ;

		// read number of iteration required to decode
		uint8_t iterations_required = read_uint8("Iterations_required");
		fprintf(stderr , "Number of iteration required for code_block number [%ld] = %ld \n",block_count,iterations_required) ;
		// read decoded block 
		uint16_t I,J ;
		for ( I = 0 ; I < ncols ; I++ )
			{
			code_block[I] = read_float32("code_block_out");
			//fprintf(stderr, "code_block1[%d] = %f \n",I,code_block1[I] );
			}
		bpsk_demodulate() ; 
		//
		// find accuracy in terms of incorrect bits after decoding
		uint16_t K ;
		for ( K = 0 ; K < ncols ; K++)
			{
			if (code_block[K] != 0)
			incorrect_bits++ ;
			}
		//
		// if decoding has errors stop!. else repeat...
		if(incorrect_bits > 0)
		break;
		else
		block_count++ ;
	}
	fprintf(stderr , "Correctly decoded blocks = %ld \n",block_count);
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon);	
#endif
    return 0;
}

