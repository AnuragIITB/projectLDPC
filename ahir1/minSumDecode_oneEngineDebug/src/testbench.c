#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif
#include <math.h>


//------------------------------------------------------------------------------
void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

//--------------------------------------------------------------------------------

uint16_t mem[19] = { \
4, \
8, \
12, \
1, \
2, \
3, \
4, \
5, \
6,\
1, \
4, \
7, \
2, \
5, \
8, \
1, \
4, \
7, \
10
} ;
float code_block[8] = { \
-0.8, \
0.7, \
-0.9, \
0.7, \
0.5, \
-1.5, \
-2.4, \
-1.2, \
} ;

uint16_t ncols = 8;
uint16_t nrows = 4;
uint16_t ncol_ind = 12 ;

float rate = 0.5 ;  

uint16_t maxNitr = 25 ;
float ebbyNodb = 6.02;
float ebbyNo  ;


//
// reading the input parity check matrix in structure
void sendInputs() 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		//fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		
		ebbyNo = pow(10,0.1*ebbyNodb) ;
		write_float32("ebbyNo_in", ebbyNo );
		//fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		
		//
		// write matrix entries from matrix pipe
		//
		int I ;
		for( I = 0 ; I < 19 ; I++)
		{	
		uint16_t val = mem[I];
		write_uint16("matrix_in", val);	
		//fprintf(stderr, "matrix_in = %d \n",val);		
		} 	
 
		write_float32("rate_in", rate );
		//fprintf(stderr, "rate_in = %f \n",rate);

}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock()
{
	float val;
	int J ;
	for ( J = 0 ; J < ncols ; J++)
		{
		val = code_block[J] ; 
		//fprintf(stderr,"Info: write to code_block_in pipe = %f\n",val);	
		write_float32("code_block_in", val);			
		}
}

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


	sendInputs();
	sendCodeBlock() ;
	
		
	
		int I ;
		for( I = 0 ; I < ncol_ind+nrows+3 ; I++)
		{	
		uint16_t val = read_uint16("mem_out");
		fprintf(stderr, "mem_out = %d \n",val);					
		} 
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		} 	
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPriori_out");
		fprintf(stderr, "aPriori_out = %f \n",val);
		} 
		
	
/*
	while(1)
	{
	
	// read aposteriori
	int P ;
	for (P = 0 ; P < ncols ; P++)
		{
		float aPosteriori = read_float32("aPosteriori_out");
		fprintf(stderr,"aPosteriori_out[%d]=%f\n", P , aPosteriori );
		}
	// read is_decoded status
	uint8_t is_decoded_tb = read_uint8("is_decoded_out");
	fprintf(stderr , "is_decoded_out = %d", is_decoded_tb);
	if(is_decoded_tb == 1)
	break;
	}
*/

/*	
	uint16_t I ;
	float code_block[ncols];
	for ( I = 0 ; I < ncols ; I++ )
	{
	float val_code_block  = read_float32("code_block_out");
	code_block[I] = val_code_block;
	fprintf(stderr, "code_block[%d] = %f \n",I,code_block[I] );
	}
*/	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon);	
#endif
    return 0;
}

