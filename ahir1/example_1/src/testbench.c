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

	
void Sender()
{
	int idx = 0;

	while(1)
	{
		float a = drand48();
		float b = drand48();

		write_float32("a_in",a);
		write_float32("b_in",b);

		idx++;
	}
}

#ifdef SW
DEFINE_THREAD(Stage1)
DEFINE_THREAD(Stage2)
#endif
DEFINE_THREAD(Sender)

int main(int argc, char* argv[])
{
	float result;
	srand48(159);
	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);

#ifdef SW
	init_pipe_handler();
	PTHREAD_DECL(Stage1);
	PTHREAD_CREATE(Stage1);
	PTHREAD_DECL(Stage2);
	PTHREAD_CREATE(Stage2);
#endif
	PTHREAD_DECL(Sender);
	PTHREAD_CREATE(Sender);

	uint8_t idx;
	

	for(idx = 0; idx < 4; idx++)
	{
		result = read_float32("c_out");
		fprintf(stdout,"%d. Result = %f,\n", idx, result);
		
	}
	PTHREAD_CANCEL(Sender);
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(Stage1);
	PTHREAD_CANCEL(Stage2);
#endif
	return(0);
}
