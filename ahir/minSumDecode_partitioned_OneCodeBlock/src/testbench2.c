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

//
// reading the input parity check matrix in structure
void sendInputs(uint8_t maxNitr,float ebbyNo ) 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );
		fprintf(stderr, "maxNitr = %d \n",maxNitr);
		//
		// write SNR in db
		write_float32("ebbyNo_in", ebbyNo );
		fprintf(stderr, "ebbyNo_in = %f \n",ebbyNo);
		//
		// write matrix entries from matrix pipe
		//

/*		uint16_t numread, val;
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

		} 	
*/
		// taking example matrix to check the correctness
		uint16_t matrix[32] = {2,4,4,1,2,\
								3,4,1,4,2,\
								4,2,1,2,1,\
								1,2,4,3,1,\
								4,2,1,3,2,\
								4,3,3,1,4\
								,1,2} ;
		int I;
		for ( I = 0 ; I < 32 ; I++)
			{
			write_uint16("matrix_in", matrix[I]);
			fprintf(stderr,"matrix_in[%d] = %d \n ",I, matrix[I] );	
			}
}


//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock()
{
/*	float val;
	while(1) 
		{
		uint16_t numread;
		numread = fscanf(in_file,"%f\n", &val );
		if (numread != 1)
			{
			fprintf (stderr,"ERROR : In reading code_block file \n");
			break;
			}			
//			fprintf(stderr,"Info: write to code_block_in pipe = %f\n",val);	
			write_float32("code_block_in", val);			
		}
*/
	float code_block[8] = {-0.8, 0.7, -0.9, 0.7, 0.5, -1.5, -2.4, -1.2} ; 
	int I;
	for ( I = 0 ; I < 8 ; I++)
	{
	write_float32("code_block_in", code_block[I]);
	fprintf(stderr,"code_block[%d] = %f \n",I, code_block[I]);
	}	
}



#ifdef SW
DEFINE_THREAD(top_daemon_1)
DEFINE_THREAD(top_daemon_2)
DEFINE_THREAD(daemon_3)
DEFINE_THREAD(daemon_4)
#endif

int main(int argc,char* argv[])
{


	signal(SIGINT, Exit);
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
	FILE* matrix_file ;
	uint8_t maxNitr;
	float ebbyNodb ;
	float ebbyNo ;
	
//	matrix_file = fopen (argv[1], "r");
	maxNitr = atoi( argv[4] );
	ebbyNodb= atof( argv[5] );
	
	ebbyNo = pow(10,0.1*ebbyNodb) ;
	sendInputs( maxNitr, ebbyNo );
//	fclose(matrix_file);
	
	FILE* code_block_file ;	
//	code_block_file = fopen(argv[2],"r");
	sendCodeBlock();
//	fclose(code_block_file);
	
	
	uint8_t done1 = read_uint8("stop_the daemon1");
	uint8_t done2 = read_uint8("stop_the daemon2");
	uint8_t done3 = read_uint8("stop_the daemon3");
	uint8_t done4 = read_uint8("stop_the daemon4");
	

	float code_block1[4];
	float code_block2[4];
	int I ;
	for ( I = 0 ; I < 4 ; I++ )
	{
	code_block1[I] = read_float32("code_block1_out");
	code_block2[I] = read_float32("code_block2_out");
	fprintf(stderr, "code_block1[%d] = %f \n",I,code_block1[I] );
	fprintf(stderr, "code_block2[%d] = %f \n",I,code_block2[I] );
	}
	
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon_1);	
	PTHREAD_CANCEL(top_daemon_2);	
	PTHREAD_CANCEL(daemon_3);	
	PTHREAD_CANCEL(daemon_4);	
#endif
    return 0;
}

