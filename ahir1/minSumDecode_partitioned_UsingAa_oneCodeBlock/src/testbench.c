#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif

//------------------------------------------------------------------------------
void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

//--------------------------------------------------------------------------------


uint16_t ncols , nrows ;

float rate = 0.5; 

uint8_t maxNitr;

float ebbyNo  ;
float ebbyNodb ;

//
// reading the input parity check matrix in structure
void sendInputs(FILE* in_file) 
{
		
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
			fprintf(stderr,"Info: write to pipe [%d]= %d\n",count,val);	
			write_uint16("matrix_in", val);			
		if (count == 0)
		nrows = val ;
		if (count == 1)
		ncols = val ;
		count++;
		} 	
			
		//rate = ((float)(ncols-nrows))/(ncols); 
		write_float32("rate_in", rate );
		fprintf(stderr, "rate_in = %f \n",rate);
		
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		write_float32("ebbyNo_in", ebbyNo );
		fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		

}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock(FILE* in_file)
{
	float code_block_in[(2*ncols)] ;
	float val;
	int I ;
	for ( I = 0 ; I < (2*ncols) ; I++)
	{
		uint16_t numread;
		numread = fscanf(in_file,"%f\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading code_block file \n");
			break;
			}			
		code_block_in[I] = val ;				
	}
	for ( I = 0 ; I < (2*ncols) ; I++ )
	{
	val = code_block_in[I] ; 
	write_float32("code_block_in", val);
	fprintf(stderr,"Info: write to code_block_in pipe [%d] = %f\n",I,val);	
	}
	
}

#ifdef SW
DEFINE_THREAD(minSumDecode)
#endif

int main(int argc,char* argv[])
{

	signal(SIGINT, Exit);
	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(minSumDecode);
	PTHREAD_CREATE(minSumDecode);	
#endif
	FILE* matrix_file ;
	
	
	matrix_file = fopen (argv[1], "r");
	maxNitr = atoi( argv[4] );
	ebbyNodb= atof( argv[5] );
	
	ebbyNo = pow(10,0.1*ebbyNodb) ;
	sendInputs(matrix_file);
	fclose(matrix_file);
	
	FILE* code_block_file ;	
	code_block_file = fopen(argv[2],"r");
	sendCodeBlock(code_block_file);
	fclose(code_block_file);

	
	uint16_t I ;

		
	for ( I = 0 ; I < (2*ncols) ; I++ )
	{
	float val_code_block  = read_float32("code_block_decoded");
	fprintf(stderr, "code_block[%d] = %f \n",I,val_code_block);
	}
	
	uint16_t nitr_req = read_uint16("Nitr_required");
	fprintf( stderr , " number of iteration required = %d \n", nitr_req) ;
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(minSumDecode);	
#endif
    return 0;
}

