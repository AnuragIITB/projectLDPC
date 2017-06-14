#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#include <math.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif


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

void sendInputs() 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		
		ebbyNo = pow(10,0.1*ebbyNodb) ;
		write_float32("ebbyNo_in", ebbyNo );
		fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		
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
		fprintf(stderr, "rate_in = %f \n",rate);

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
		fprintf(stderr,"Info: write to code_block_in pipe = %f\n",val);	
		write_float32("code_block_in", val);			
		}
}

void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

#ifdef SW
DEFINE_THREAD(minSumDecode)
#endif
int main(int argc, char* argv[])
{
	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(minSumDecode);
	PTHREAD_CREATE(minSumDecode);
#endif

	sendInputs();
	sendCodeBlock() ;

		int I ;
		float valf ;
		
		uint16_t val = read_uint16("maxNitr_out");
		fprintf(stderr, "maxNitr_out = %d \n",val);

		valf = read_float32("ebbyNo_out");
		fprintf(stderr, "ebbyNo_out = %f \n",valf);

	for( I = 0 ; I < ncol_ind+nrows+3 ; I++)
		{	
		uint16_t val = read_uint16("mem_out");
		fprintf(stderr, "mem_out = %d \n",val);					
		} 
		
		valf = read_float32("rate_out");
		fprintf(stderr, "rate_out = %f \n",valf);		
	
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block_decoded");
		fprintf(stderr, "code_block_decoded = %f \n",val);
		} 	
			
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPriori_out");
		fprintf(stderr, "aPriori_out = %f \n",val);
		} 
		
		for( I = 0 ; I < ncol_ind ; I++)
		{	
		float val = read_float32("init_message_out");
		fprintf(stderr, "init_message_out = %f \n",val);
		} 		
int A ;
for ( A = 0 ; A < 2 ; A++)	
{	
	for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("init_aPosteriori_out");
		fprintf(stderr, "init_aPosteriori_out = %f \n",val);
		} 
			
		for( I = 0 ; I < ncol_ind ; I++)
		{	
		float val = read_float32("init_ext_info_out");
		fprintf(stderr, "init_ext_info_out = %f \n",val);
		} 
		

/*		
		for( I = 0 ; I < 4 ; I++)
		{	
		float val = read_float32("val_pipe");
		fprintf(stderr, "val_pipe = %f \n",val);
		}
		
		for( I = 0 ; I < 1 ; I++)
		{	
		float val = read_float32("sign_pipe");
		fprintf(stderr, "sign_pipe = %f \n",val);
		}
		
				for( I = 0 ; I < 1 ; I++)
		{	
		uint16_t val = read_uint16("index_2D_pipe");
		fprintf(stderr, "index_2D_pipe = %d \n",val);
		}
						
		for( I = 0 ; I < 1 ; I++)
		{	
		float val = read_float32("temp_info_pipe");
		fprintf(stderr, "temp_info_pipe = %f \n",val);
		}
	*/			
		for( I = 0 ; I < ncol_ind ; I++)
		{	
		float val = read_float32("ext_info_out");
		fprintf(stderr, "ext_info_out = %f \n",val);
		}
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPosteriori_out");
		fprintf(stderr, "aPosteriori_out = %f \n",val);
		}  
		
		uint16_t is_decoded = read_uint16("decode_done");
		fprintf(stderr , "is_decoded = %d \n ", is_decoded );

		for( I = 0 ; I < ncol_ind ; I++)
		{	
		float val = read_float32("message_out");
		fprintf(stderr, "message_out = %f \n",val);
		} 
} 		
/*		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block_decoded");
		fprintf(stderr, "code_block_out = %f \n",val);
		}
		
		uint16_t Nitr_required = read_uint16("nitr_required");
		fprintf(stderr, "Nitr_required =  %d \n",Nitr_required);	
		
*/
		
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(minSumDecode);
	return(0);
#endif
}
