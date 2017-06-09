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
//---------------------------------------------------------------------


uint16_t a[5] = { 1 , 2 , 3 , 4 , 5 };
float b[5] = { 1.1 , 2.1 , 3.1 , 4.1 , 5.1 };
float c[5] ;

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
	
	
	
	int II;
	for ( II = 0 ; II < ORDER ; II++)
	{
	uint16_t val_a = a[II] ; 
	write_uint16("read_input_a",val_a);
	}
	
	int JJ ;
	for ( JJ = 0 ; JJ < ORDER ; JJ++)
	{
	float val_b = b[JJ] ;
	write_float32("read_input_b",val_b);
	}	
	
	int KK ;
	for ( KK = 0 ; KK < ORDER ; KK++)
	{
	float output = read_float32("write_output_c");
	fprintf(stderr , "c[%d] = %f \n", KK , output) ; 
	}
	
#ifdef SW
	close_pipe_handler();
	PTHREAD_CANCEL(top_daemon);	
#endif
    return 0;
}

