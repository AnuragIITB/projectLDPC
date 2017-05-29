#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include <math.h>
#include <fpu.h>
#include "prog.h"


#define CHECK_BIT_COUNT1   ( ncol_ind - ( mem[3 + ncol_ind +row] -1 ) )
#define CHECK_BIT_COUNT2   (  mem[3 + ncol_ind +row + 1] ) - (  mem[3 + ncol_ind +row]  )

#define	nrows 	 mem1[0]     // same for all partitions
#define	ncols 	 mem1[1]	 // same for all partitions

#define	ncol_ind_1 	 mem1[2]
#define	ncol_ind_2 	 mem2[2]
#define	ncol_ind_3 	 mem3[2]
#define	ncol_ind_4 	 mem4[2]

#define 	index_2D	mem[3 + ncol_ind + row] -1 + col 
#define	index_1D 	mem [3 + index_2D] - 1

#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif
//-------------------------------------------------------------------------------------------------
//
//
	uint16_t mem1[MATRIX_NNZ];
	uint16_t mem2[MATRIX_NNZ];
	uint16_t mem3[MATRIX_NNZ];
	uint16_t mem4[MATRIX_NNZ];
	
	uint16_t maxNitr    ;
	float   ebbyNo    ; 
	float code_block1[MATRIX_ORDER];
	float code_block2[MATRIX_ORDER];
	
	float aPriori1[MATRIX_ORDER];	// aPriori matrix
	float aPriori2[MATRIX_ORDER];
	
	float message1[MATRIX_NNZ] ;
	float message2[MATRIX_NNZ] ;
	float message3[MATRIX_NNZ] ;
	float message4[MATRIX_NNZ] ; 

	float aPosteriori1[MATRIX_ORDER];
	float aPosteriori2[MATRIX_ORDER];
	
	float ext_info1[MATRIX_NNZ];
	float ext_info2[MATRIX_NNZ];
	float ext_info3[MATRIX_NNZ];
	float ext_info4[MATRIX_NNZ];
	
	
void initInputs( )
{
	//
	// reading maxinum number of iteration
	uint16_t nitr = read_uint16("maxNitr_in");
	maxNitr = nitr ;
#ifdef SW
	fprintf(stderr,"Info:read maxNitr = %d\n", nitr);
#endif
	//
	// reading signal to noise power ration
	float SNR = read_float32("ebbyNo_in"); 
	ebbyNo = SNR ;
#ifdef SW
	fprintf(stderr,"Info:read SNR = %f\n", SNR);
#endif
}
//--------------------------------------------------------------------

//
//
void initMem()
{
	uint16_t I,val,range;
	//
	// input for mem1
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem1[I] = val ; 
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem1[2]+mem1[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem1[I+3] = val ;
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	//
	// input for mem2 
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem2[I] = val ; 
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem2[2]+mem2[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem2[I+3] = val ;
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	//
	// input for mem3
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem3[I] = val ; 
#ifdef SW
	fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem3[2]+mem3[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem3[I+3] = val ;
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	//
	// input for mem4
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem4[I] = val ; 
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem4[2]+mem4[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem4[I+3] = val ;
#ifdef SW
		fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	 
}


//---------------------------------------------------------------------------------------

//
// reading code block to decode
void readCodeBlock()
{
	uint16_t I;	
	// reading code_block1
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			float code_bit = read_float32("code_block_in");
#ifdef SW
			fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
#endif
			code_block1[I] = code_bit ;
			}
	//
	// reading code_block2
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			float code_bit = read_float32("code_block_in");
#ifdef SW
			fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
#endif
			code_block2[I] = code_bit ;
			}
}

//
//---------------------------------------------------------------------------------------------- 

//
// initializing apriori probabilities
void initialize_aPriori1 ()
{
	uint16_t I;
	
	float rate ;
//	
//	calculating rate of code	:
	rate = (float) ((ncols)-(nrows))/(ncols); 
	
//	printf(" rate = %lf , ebbyNodb = %lf , ebbyNo = %lf , sigma2 = %lf \n", rate, ebbyNodb, ebbyNo, sigma2);
//
// 	Initializing a priori probabilities	:
	for ( I = 0 ; I < ncols ; I++ )
		{
#ifndef SW
			//__loop_pipelining_on__(63,2,0);
#endif
		// It has a minus sign in contrast to papers.
		// Reason is :
		//
		// Here BPSK modulation :	0  ->  -1
		// 				1  ->   1
		//
		//
		//aPriori[I] = 4*code_block[I]/(2*sigma2) ;    // for test_matrix 
		aPriori1[I] = -4*code_block1[I]*(rate*ebbyNo) ; 
#ifdef SW  
		fprintf(stderr," I= %d ,  aPriori1[I]=  %f \n", I , aPriori1[I]);
#endif
		}
}

//
// initializing apriori probabilities
void initialize_aPriori2 ()
{
	uint16_t I;
	
	float rate ;
//	
//	calculating rate of code	:
	rate = (float) ((ncols)-(nrows))/(ncols); 
	
//	printf(" rate = %lf , ebbyNodb = %lf , ebbyNo = %lf , sigma2 = %lf \n", rate, ebbyNodb, ebbyNo, sigma2);
//
// 	Initializing a priori probabilities	:
	for ( I = 0 ; I < ncols ; I++ )
		{
#ifndef SW
			//__loop_pipelining_on__(63,2,0);
#endif
		// It has a minus sign in contrast to papers.
		// Reason is :
		//
		// Here BPSK modulation :	0  ->  -1
		// 				1  ->   1
		//
		//
		//aPriori[I] = 4*code_block[I]/(2*sigma2) ;    // for test_matrix 
		aPriori2[I] = -4*code_block2[I]*(rate*ebbyNo) ; 
#ifdef SW  
		fprintf(stderr," I= %d ,  aPriori2[I]=  %f \n", I , aPriori2[I]);
#endif
		}
}
/*
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------




//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage ( uint16_t* mem , float* aPriori , float* message )
{
	uint16_t I ;
	for ( I=0 ; I < ncol_ind ; I++)
	{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
	message[I] = aPriori[mem[3+I]-1];	
#ifdef SW
//	fprintf(stderr," message[%d]= aPriori[%d]%f \n ",I,mem[3+I],message[I]);
#endif	
	}
}			
		
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori ( float* aPriori , float* aPosteriori )
{		

	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			aPosteriori[I] = aPriori[I] ;
			}
#ifdef SW
	fprintf(stderr," aPosteriori initialized \n");
#endif
	
}
//----------------------------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( float* ext_info )
{
uint16_t I;
		for ( I = 0 ; I < ncol_ind ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info[I] = 0;
			}
#ifdef SW
			fprintf(stderr,"ext_info initialized \n");
#endif

}
//---------------------------------------------------------------------------------------------------------------

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine ( uint16_t* mem ,float*  message ,float* ext_info ,float* aPosteriori )
{

	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
		
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif						
		
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1 ;
		else 
			range = CHECK_BIT_COUNT2 ;	
				
		for ( col = 0 ; col < range ; col++)
			{
#ifndef SW	
			__loop_pipelining_on__(63,2,0);
#endif 			
			// iterating through all the bit nodes corrosponding to a check 
			uint16_t I = 0 ;
			float val = 0.0;				// represents magnitude of the extrensic information.
			uint8_t flag = 0 ; 				// represents first iteration through the inner most loop.
			uint8_t exor = 0;				// represents sign of the extrinsic information.
			float sign = 0.0; 
			for ( I = 0 ; I < range ; I++)
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif			
				uint16_t index =  mem[3 + ncol_ind + row] -1 + I  ;
				//
				// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		   		// iterating through all the bit nodes corrosponding to a perticular check node.
				if ( I == col)
				//
				// skipping the self information .
					continue;
				else
					{
					//
					// finding sign of the extrinsic information 
					if ( message[ index] >= 0.0 )
						{
						exor = exor ^ 0 ;
						}
					else 
						{
						exor = exor ^ 1 ; 
						}			
								
					// finding minimum of the messages to update magnitude of the extrinsic information.
					if (flag == 0)
						{
						// 
						// true for first iteration to initialize the magnitude of the extrinsic information.
						val = absf(message[ index]);
						}
					else
						{
						if ( absf(message[ index]) < val )
							{
						//	val = absf(message[ index]) ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info[ index_2D ] = val * sign ;
				aPosteriori[ index_1D ] += ext_info[ index_2D  ] ; 	
#ifdef SW
//				fprintf(stderr, "aPosteriori[%d] , ext_info[%d] = %f \n", index_1D ,index_2D , ext_info[index_2D]  ) ;
#endif
				
			}	
		}
		
#ifdef SW
		fprintf(stderr, "computation done \n");	
#endif

}
//----------------------------------------------------------------------------------------------------------

float absf( float f)
{
float ret ;
if (f < 0.0)
ret = (-f);
else
ret = (f);
return(ret) ;
}

//-------------------------------------------------------------------------------------------------------------------------

//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a piosteriori probabilities.
// return the decode status of the code block.
uint8_t checkIsdecoded( float* code_block , float* aPosteriori ) 
{
		
	uint8_t is_decoded = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif 
//	 iterating through all code bits	:
		if ( aPosteriori[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block[I] = 1.0;			// modifies the code bit.
			}
		}
#ifdef SW
		fprintf(stderr,"check is decoded done \n");
#endif
	return(is_decoded);
}
//-------------------------------------------------------------------------------------------------------------
//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage ( uint16_t* mem ,float* ext_info ,float* aPosteriori ,float* message )
{

		uint16_t row,col;
		for ( row = 0 ; row < nrows ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1 ;
				else
					range = CHECK_BIT_COUNT2 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					//
					//	iterating through all the bit nodes of a check node and updating message.
					message [ index_2D ] =  aPosteriori[ index_1D ] -ext_info [ index_2D] ;
#ifdef SW
//					fprintf (stderr,"message(%d) = %f \n", index_2D , message [ index_2D ] );
#endif
					}
				}

}

*/

//
//-----------------------------------------------------------------------------------------------------------

void top_daemon_1 ()
{
	
	initInputs() ; 
	
	initMem( ) ;
	
	readCodeBlock ();
	
	write_uint8("reading_code_block_done",1) ;
	
	initialize_aPriori1 () ;
	
	write_uint8("stop_the daemon1",1);
/*	
	uint8_t nitr = 1 ;

	initialize_aPriori ( code_block , aPriori );
	
	initializeMessage ( mem , aPriori, message );
	
	
	
	while(nitr < maxNitr)
		{
	
		initialize_aPosteriori( aPriori, aPosteriori );
	
		initializeExtrinsicInfo ( ext_info );
	
		checkNodeComputeEngine( mem ,  message ,  ext_info , aPosteriori );
	
		uint8_t is_decoded = checkIsdecoded( code_block , aPosteriori ) ;

		if (is_decoded)
			break ;
		else
			updateMessage( mem , ext_info , aPosteriori , message );
		
		nitr++ ;
		}
		
		

#ifdef SW
	fprintf(stderr," number of iteration required = %d \n",(nitr)) ;
	int I;
	for(I = 0; I < ncols; I++)
		{
		fprintf(stderr,"code_block[%d] = %f \n" , I,code_block[I]);
		}
#endif
	
		write_uint16("ncols_out",ncols);
	uint16_t K ;
	
	for ( K = 0 ; K < ncols ; K++ )
	{
	write_float32("code_block_out",code_block[K]);
	}
	
	*/		
}

void top_daemon_2()
{
	uint8_t init_mat = read_uint8("reading_code_block_done");
	initialize_aPriori2 ();	
	write_uint8("stop_the daemon2",1);
}

void daemon_3()
{
uint8_t init_mat = read_uint8("reading_code_block_done");

//write_uint8("stop_the daemon3",1);
}

void daemon_4()
{
uint8_t init_mat = read_uint8("reading_code_block_done");

//write_uint8("stop_the daemon4",1);
}

