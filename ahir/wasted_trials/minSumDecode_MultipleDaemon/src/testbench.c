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
float expected_result [4];
void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

//
// reading the input parity check matrix in structure
void sendInputs( FILE* in_file,uint8_t maxNitr,float ebbyNo  ) 
{
		//
		// write maximum number of iterations
		write_uint16("maxNitr_in", maxNitr );

		//
		// write SNR in db
		write_float32("ebbyNo_in", ebbyNo );
		//
		// write matrix entries from matrix pipe
		//

		uint16_t numread, val;
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
}

//
//----------------------------------------------------------------------------------------------------

//
//
void sendCodeBlock(FILE* in_file)
{
	float val;
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
}

#ifdef SW
DEFINE_THREAD(daemon)
DEFINE_THREAD(readCodeBlock)
DEFINE_THREAD(checkIsdecoded)
DEFINE_THREAD(updateMessage)
DEFINE_THREAD(checkNodeComputeEngine)
DEFINE_THREAD(initializeMessage)
DEFINE_THREAD(initialize_aPosteriori)
DEFINE_THREAD(initializeExtrinsicInfo)
DEFINE_THREAD(initialize_aPriori)
#endif

int main(int argc,char* argv[])
{

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(daemon);
	PTHREAD_CREATE(daemon);
	PTHREAD_DECL(readCodeBlock);
	PTHREAD_CREATE(readCodeBlock);
	PTHREAD_DECL(initialize_aPriori);
	PTHREAD_CREATE(initialize_aPriori);
	PTHREAD_DECL(initializeMessage);
	PTHREAD_CREATE(initializeMessage);

	PTHREAD_DECL(initialize_aPosteriori);
	PTHREAD_CREATE(initialize_aPosteriori);
	PTHREAD_DECL(initializeExtrinsicInfo);
	PTHREAD_CREATE(initializeExtrinsicInfo);
	PTHREAD_DECL(checkNodeComputeEngine);
	PTHREAD_CREATE(checkNodeComputeEngine);
	PTHREAD_DECL(checkIsdecoded);
	PTHREAD_CREATE(checkIsdecoded);
	PTHREAD_DECL(updateMessage);
	PTHREAD_CREATE(updateMessage);
	
#endif
	FILE* matrix_file ;
	uint8_t maxNitr;
	float ebbyNodb ;
	float ebbyNo ;
	
	matrix_file = fopen (argv[1], "r");
	maxNitr = atoi( argv[4] );
	ebbyNodb= atof( argv[5] );
	
	ebbyNo = pow(10,0.1*ebbyNodb) ;
	sendInputs(matrix_file, maxNitr, ebbyNo );
	fclose(matrix_file);
	
	FILE* code_block_file ;	
	code_block_file = fopen(argv[2],"r");
	sendCodeBlock(code_block_file);
	fclose(code_block_file);
	
	uint8_t stop_the_daemon = read_uint8("stop_the_daemon");
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(daemon);
	PTHREAD_CANCEL(readCodeBlock);
	PTHREAD_CANCEL(initialize_aPriori);
	PTHREAD_CANCEL(initializeMessage);
	PTHREAD_CANCEL(initialize_aPosteriori);
	PTHREAD_CANCEL(initializeExtrinsicInfo);
	PTHREAD_CANCEL(checkNodeComputeEngine);
	PTHREAD_CANCEL(checkIsdecoded);
	PTHREAD_CANCEL(updateMessage);
	
#endif
    return 0;
}

