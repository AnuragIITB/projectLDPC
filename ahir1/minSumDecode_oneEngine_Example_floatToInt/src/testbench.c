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


uint32_t mem[19] = { \
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

uint32_t ncols = 8;
uint32_t nrows = 4;
uint32_t ncol_ind = 12 ;

uint32_t rate_into_100 = 50 ;  

uint32_t maxNitr = 25 ;
float ebbyNodb = 6.02;
float ebbyNo  ;

void sendInputs() 
{
		//
		
		//
		// write matrix entries from matrix pipe
		//
		int I ;
		for( I = 0 ; I < 19 ; I++)
		{	
		uint32_t val = mem[I];
		write_uint32("matrix_in", val);	
		//fprintf(stderr, "matrix_in = %d \n",val);		
		} 	
 
		write_uint32("rate_in", rate_into_100 );
		fprintf(stderr, "rate_in = %d \n",rate_into_100);

		// write maximum number of iterations
		write_uint32("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		
		ebbyNo = pow(10,0.1*ebbyNodb) ;
		uint32_t quant_ebbyNo = (uint32_t) (ebbyNo*10) ;
		write_uint32("ebbyNo_in", quant_ebbyNo );
		fprintf(stderr, "ebbyNo_in = %d \n",quant_ebbyNo);
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
		uint32_t quant_cb = (uint32_t)(val*100);	
		write_uint32("code_block_in", quant_cb);
		fprintf(stderr,"Info: write to code_block_in pipe quantized = %d\n",quant_cb);			
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
		int valf ;
		
/*		uint32_t val = read_uint32("maxNitr_out");
		fprintf(stderr, "maxNitr_out = %d \n",val);

		val = read_uint32("ebbyNo_out");
		val = (int) val ;
		fprintf(stderr, "ebbyNo_out = %d \n",val);

	for( I = 0 ; I < ncol_ind+nrows+3 ; I++)
		{	
		uint32_t val = read_uint32("mem_out");
		fprintf(stderr, "mem_out = %d \n",val);					
		} 
		
		val = read_uint32("rate_out");
		fprintf(stderr, "rate_out = %d \n",val);		
	
		for( I = 0 ; I < ncols ; I++)
		{	
	  val = read_uint32("code_block_decoded");
		float valf = (float) val; 		
		fprintf(stderr, "code_block_decoded = %f \n",val);
		} 	
			
		for( I = 0 ; I < ncols ; I++)
		{	
		 val = read_uint32("aPriori_out");
		fprintf(stderr, "aPriori_out = %d \n",val);
		} 
		
		for( I = 0 ; I < ncol_ind ; I++)
		{	
		 val = read_uint32("init_message_out");
		fprintf(stderr, "init_message_out = %d \n",val);
		} 		
int A ;
for ( A = 0 ; A < 2 ; A++)	
{	
	for( I = 0 ; I < ncols ; I++)
		{	
		 val = read_uint32("init_aPosteriori_out");
		fprintf(stderr, "init_aPosteriori_out = %d \n",val);
		} 
			
		for( I = 0 ; I < ncol_ind ; I++)
		{	
		 val = read_uint32("init_ext_info_out");
		fprintf(stderr, "init_ext_info_out = %d \n",val);
		} 
		

/*		
		for( I = 0 ; I < 4 ; I++)
		{	
		float val = read_uint32("val_pipe");
		fprintf(stderr, "val_pipe = %d \n",val);
		}
		
		for( I = 0 ; I < 1 ; I++)
		{	
		float val = read_uint32("sign_pipe");
		fprintf(stderr, "sign_pipe = %d \n",val);
		}
		
				for( I = 0 ; I < 1 ; I++)
		{	
		uint32_t val = read_uint32("index_2D_pipe");
		fprintf(stderr, "index_2D_pipe = %d \n",val);
		}
						
		for( I = 0 ; I < 1 ; I++)
		{	
		float val = read_uint32("temp_info_pipe");
		fprintf(stderr, "temp_info_pipe = %d \n",val);
		}
	*/			
/*		for( I = 0 ; I < ncol_ind ; I++)
		{	
		 val = read_uint32("ext_info_out");
		fprintf(stderr, "ext_info_out = %d \n",val);
		}
		
		for( I = 0 ; I < ncols ; I++)
		{	
		 val = read_uint32("aPosteriori_out");
		fprintf(stderr, "aPosteriori_out = %d \n",val);
		}  
		
		uint32_t is_decoded = read_uint32("decode_done");
		fprintf(stderr , "is_decoded = %d \n ", is_decoded );

		for( I = 0 ; I < ncol_ind ; I++)
		{	
		 val = read_uint32("message_out");
		fprintf(stderr, "message_out = %d \n",val);
		} 
} 		
*/		
		for( I = 0 ; I < ncols ; I++)
		{	
		uint32_t val = read_uint32("code_block_decoded");
		fprintf(stderr, "code_block_out = %d \n",val);
		}
		
		uint32_t nitr_required = read_uint32("Nitr_required");
		fprintf(stderr, "Nitr_required =  %d \n",nitr_required);	
		

		
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(minSumDecode);
	return(0);
#endif
}
