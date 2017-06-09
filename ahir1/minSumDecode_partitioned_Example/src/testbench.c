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


uint16_t mem[32] = {2,4,4,1,2,\
					3,4,1,4,2,\
					4,2,1,2,1,\
					1,2,4,3,1,\
					4,2,1,3,2,\
					4,3,3,1,4\
					,1,2} ;
					
					
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

uint16_t ncols = 4;
uint16_t nrows = 2;
//uint16_t ncol_ind = 12 ;

float rate = 0.5 ;  

uint16_t maxNitr = 2 ;
float ebbyNodb = 6.02;
float ebbyNo  ;

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
		for( I = 0 ; I < 32 ; I++)
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
	for ( J = 0 ; J < 8 ; J++)
		{
		val = code_block[J] ; 
		//fprintf(stderr,"Info: write to code_block_in pipe = %f\n",val);	
		write_float32("code_block_in", val);			
		}
}

void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

#ifdef SW
DEFINE_THREAD(top_daemon_1)
DEFINE_THREAD(top_daemon_2)
DEFINE_THREAD(daemon_3)
DEFINE_THREAD(daemon_4)
#endif
int main(int argc, char* argv[])
{
	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(top_daemon_1);
	PTHREAD_CREATE(top_daemon_1);
	PTHREAD_DECL(top_daemon_2);
	PTHREAD_CREATE(top_daemon_2);	
	PTHREAD_DECL(daemon_3);
	PTHREAD_CREATE(daemon_3);	
	PTHREAD_DECL(daemon_4);
	PTHREAD_CREATE(daemon_4);	
#endif

	sendInputs();
	sendCodeBlock() ;

		int I ;
		
		for(I = 0; I < 32 ; I++)
		{
		uint16_t val = read_uint16("matrix_out");
		fprintf(stderr, "matrix_out = %d \n",val);
		}

		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block1_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		}
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block2_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		}
				
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPriori2_out");
		fprintf(stderr, "aPriori2_out = %f \n",val);
		} 	
			
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPriori1_out");
		fprintf(stderr, "aPriori1_out = %f \n",val);
		} 
	

		for( I = 0 ; I < 4 ; I++)
		{	
		float val = read_float32("ext_info11_out");
		fprintf(stderr, "ext_info11_out = %f \n",val);
		} 		
		
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = read_float32("ext_info12_out");
		fprintf(stderr, "ext_info12_out = %f \n",val);
		} 
		
		
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = read_float32("ext_info21_out");
		fprintf(stderr, "ext_info21_out = %f \n",val);
		} 
		
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = read_float32("ext_info22_out");
		fprintf(stderr, "ext_info22_out = %f \n",val);
		} 
		
			
		
		for( I = 0 ; I < 4 ; I++)
		{	
		float val = read_float32("init_message11_out");
		fprintf(stderr, "init_message11_out = %f \n",val);
		} 		
		
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = read_float32("init_message12_out");
		fprintf(stderr, "init_message12_out = %f \n",val);
		} 
		
		
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = read_float32("init_message21_out");
		fprintf(stderr, "init_message21_out = %f \n",val);
		} 
		
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = read_float32("init_message22_out");
		fprintf(stderr, "init_message22_out = %f \n",val);
		} 
/*		
*/
/*		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block1_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		}
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block2_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		}			
*/				
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = read_float32("trans_info11_12_out");
		fprintf(stderr, "trans_info11_12_out = %f \n",val);
		} 
		
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = read_float32("trans_info12_11_out");
		fprintf(stderr, "trans_info12_11_out = %f \n",val);
		} 
				
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = read_float32("trans_info21_22_out");
		fprintf(stderr, "trans_info21_22_out = %f \n",val);
		} 
		
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = read_float32("trans_info22_21_out");
		fprintf(stderr, "trans_info22_21_out = %f \n",val);
		} 
		
	

		
				
		
	
	/*	
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block1_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		}
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("code_block2_out");
		fprintf(stderr, "code_block_out = %f \n",val);
		}
					
		uint16_t Nitr_required = read_uint16("nitr_required");
		fprintf(stderr, "Nitr_required =  %d \n",Nitr_required);
	
	*/	
	

	
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPosteriori1_out");
		fprintf(stderr, "aPosteriori1_out = %f \n",val);
		}  

		for( I = 0 ; I < ncols ; I++)
		{	
		float val = read_float32("aPosteriori2_out");
		fprintf(stderr, "aPosteriori2_out = %f \n",val);
		}

		
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon_1);	
	PTHREAD_CANCEL(top_daemon_2);	
	PTHREAD_CANCEL(daemon_3);	
	PTHREAD_CANCEL(daemon_4);
	return(0);
#endif
}
