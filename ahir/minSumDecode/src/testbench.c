#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#ifdef USE_GNUPTH
#include <pth.h>
#include <GnuPthUtils.h>
#else
#include <pthread.h>
#include <pthreadUtils.h>
#endif 
#include <Pipes.h>
#include <pipeHandler.h>
#include "prog.h"
#ifndef SW
#include "vhdlCStubs.h"
#endif

float expected_result [4];
void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}

void sendInputs()
{
		FILE* in_file ;
      in_file = fopen ("../include/parityCheckMatrix/test_minSumdivideAndConquer/test_minSumMatrixDivideAndConquer.txt", "r");

		readParityCheckMatrixFile(in_file) ;
		readParityCheckMatrixFile(in_file) ;
		readParityCheckMatrixFile(in_file) ;
		readParityCheckMatrixFile(in_file) ;
 
	  	fclose(matrix_file);	
}

readParityCheckMatrixFile(FILE* in_file) ;
{
		uint16_t nrows, ncols ;
		uint16_t ncol_ind ;
		fscanf(in_file,"%d\n %d\n %d\n ", &nrows, &ncols, &ncol_ind );
		write_uint16("matrix_in", nrows);
		uint16_t rV = read_uint16("matrix_out");
		fprintf(stderr," read-back %d \n", rV);
		write_uint16("matrix_in", ncols);
		uint16_t rV = read_uint16("matrix_out");
		fprintf(stderr," read-back %d \n", rV);
		write_uint16("matrix_in", ncol_ind);
		uint16_t rV = read_uint16("matrix_out");
		fprintf(stderr," read-back %d \n", rV);
		uint16_t val; 
		for(I = 0; I < ( nrows+ncol_ind ); I++)
		{
		fscanf(in_file,"%d\n ", &val);
		write_uint16("matrix_in", val);
		uint16_t rV = read_uint16("matrix_out");
		fprintf(stderr," read-back %d \n", rV);
		}
}
#ifdef SW
DEFINE_THREAD(Daemon)
#endif

int main(void)
{

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(Daemon);
	PTHREAD_CREATE(Daemon);
#endif

    sendInputs();
}

#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(Daemon);
#endif
    return 0;
}

