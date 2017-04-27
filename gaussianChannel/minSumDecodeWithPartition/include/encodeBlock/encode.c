//
// code to generate encoded block of a perticular length
// input	:	Size of encoded block
// output	:	encodeBits.txt file 
// All zero are written in this file... 
//
#include<stdio.h>

int main ( int argc, char* argv[])
{

	FILE * encode_file;
	encode_file = fopen( "zeroEncodeBits.txt" , "w");
	int I;
	for ( I = 0; I < atoi(argv[1]) ; I++ )
		{
		fprintf( encode_file , "%d\n", 0);
		}


return 0;
}
