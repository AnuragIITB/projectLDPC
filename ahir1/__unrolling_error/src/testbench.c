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


uint16_t ncols , nrows,ncol_ind ;

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
			//fprintf(stderr,"Info: write to pipe [%d]= %d\n",count,val);	
			write_uint16("matrix_in", val);			
		if (count == 0)
		nrows = val ;
		if (count == 1)
		ncols = val ;
		if (count == 2)
		ncol_ind = val ;
		count++;
		} 	
			
		//rate = ((float)(ncols-nrows))/(ncols); 
		write_float32("rate_in", rate );
		//fprintf(stderr, "rate_in = %f \n",rate);
		
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		//fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		write_float32("ebbyNo_in", ebbyNo );
		//fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		

}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock(FILE* in_file)
{
	float val;
	int I ;
	for ( I = 0 ; I < ncols ; I++)
	{
		uint16_t numread;
		numread = fscanf(in_file,"%f\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading code_block file \n");
			break;
			}			
		write_float32("code_block_in", val);
					
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
	
	uint16_t I ;
	float valf ;
		uint16_t val = read_uint16("maxNitr_out");
		fprintf(stderr, "maxNitr_out = %d \n",val);

		valf = read_float32("ebbyNo_out");
		fprintf(stderr, "ebbyNo_out = %f \n",valf);

	for( I = 0 ; I < ncol_ind+nrows+3 ; I++)
		{	
		uint16_t val = read_uint16("mem_out");
		fprintf(stderr, "mem_out[%d] = %d \n",I,val);					
		} 
		
		valf = read_float32("rate_out");
		fprintf(stderr, "rate_out = %f \n",valf);		
	

	FILE* code_block_file ;	
	code_block_file = fopen(argv[2],"r");
	sendCodeBlock(code_block_file);
	fclose(code_block_file);
	
	
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block_decoded");
		fprintf(stderr, "code_block_in[%d] = %f \n",I,val);
		} 	

	for ( I = 0 ; I < (ncols/4) ; I++ )
	{
	uint16_t val_I  = read_uint16("I_out_pipe");
	fprintf(stderr, "I_out_pipe[%d] = %d \n",I,val_I);
	}
/*	
	for ( I = 0 ; I < 4 ; I++ )
	{
	uint16_t val_I  = read_uint16("I_out_pipe");
	fprintf(stderr, "I_out_pipe[%d] = %d \n",I,val_I);
	}
		
*/					
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPriori_out");
		fprintf(stderr, "aPriori_out[%d] = %f \n",I,val);
		} 
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(minSumDecode);	
#endif
    return 0;
}

