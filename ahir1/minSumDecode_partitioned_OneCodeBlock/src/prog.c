#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include <math.h>
#include <fpu.h>
#include "prog.h"


#define CHECK_BIT_COUNT1_11   ( ncol_ind_11 - ( mem11[3 + ncol_ind_11 +row] -1 ) )
#define CHECK_BIT_COUNT2_11   (  mem11[3 + ncol_ind_11 +row + 1] ) - (  mem11[3 + ncol_ind_11 +row]  )

#define CHECK_BIT_COUNT1_12   ( ncol_ind_12 - ( mem12[3 + ncol_ind_12 +row] -1 ) )
#define CHECK_BIT_COUNT2_12   (  mem12[3 + ncol_ind_12 +row + 1] ) - (  mem12[3 + ncol_ind_12 +row]  )

#define CHECK_BIT_COUNT1_21   ( ncol_ind_21 - ( mem21[3 + ncol_ind_21 +row] -1 ) )
#define CHECK_BIT_COUNT2_21   (  mem21[3 + ncol_ind_21 +row + 1] ) - (  mem21[3 + ncol_ind_21 +row]  )

#define CHECK_BIT_COUNT1_22   ( ncol_ind_22 - ( mem22[3 + ncol_ind_22 +row] -1 ) )
#define CHECK_BIT_COUNT2_22   (  mem22[3 + ncol_ind_22 +row + 1] ) - (  mem22[3 + ncol_ind_22 +row]  )

#define	nrows 	 mem11[0]     // same for all partitions
#define	ncols 	 mem11[1]	 // same for all partitions

#define	ncol_ind_11 	 mem11[2]
#define	ncol_ind_12 	 mem12[2]
#define	ncol_ind_21 	 mem21[2]
#define	ncol_ind_22 	 mem22[2]

#define 	index_2D_11 	mem11[3 + ncol_ind_11 + row] -1 + col 
#define 	index_2D_12 	mem12[3 + ncol_ind_12 + row] -1 + col
#define 	index_2D_21 	mem21[3 + ncol_ind_21 + row] -1 + col
#define 	index_2D_22 	mem22[3 + ncol_ind_22 + row] -1 + col

#define		index_1D_11 		mem11 [3 + index_2D_11] - 1
#define		index_1D_12 		mem12 [3 + index_2D_12] - 1
#define		index_1D_21 		mem21 [3 + index_2D_21] - 1
#define		index_1D_22 		mem22 [3 + index_2D_22] - 1
#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif
//-------------------------------------------------------------------------------------------------
//
//
	uint16_t mem11[MATRIX_NNZ];
	uint16_t mem12[MATRIX_NNZ];
	uint16_t mem21[MATRIX_NNZ];
	uint16_t mem22[MATRIX_NNZ];
	
	uint16_t maxNitr    ;
	float   ebbyNo    ; 
	float   rate ;
	float code_block1[MATRIX_ORDER];
	float code_block2[MATRIX_ORDER];
	
	float aPriori1[MATRIX_ORDER];	// aPriori matrix
	float aPriori2[MATRIX_ORDER];
	
	float message11[MATRIX_NNZ] ;
	float message12[MATRIX_NNZ] ;
	float message21[MATRIX_NNZ] ;
	float message22[MATRIX_NNZ] ; 

	float aPosteriori1[MATRIX_ORDER];
	float aPosteriori2[MATRIX_ORDER];
	
	float ext_info11[MATRIX_NNZ];
	float ext_info12[MATRIX_NNZ];
	float ext_info21[MATRIX_NNZ];
	float ext_info22[MATRIX_NNZ];
	
	float trans_info11_12[MATRIX_NNZ];
	float trans_info22_21[MATRIX_NNZ];
	float trans_info12_11[MATRIX_NNZ];
	float trans_info21_22[MATRIX_NNZ];

//--------------------------------------------------------------------------------------------------
//
void initMem()
{
	//fprintf(stderr,"initMem");
	uint16_t I,val,range;
	//
	// input for mem1
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem11[I] = val ; 
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem11[2]+mem11[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem11[I+3] = val ;
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	//
	// input for mem2 
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem12[I] = val ; 
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem12[2]+mem12[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem12[I+3] = val ;
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	//
	// input for mem3
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem21[I] = val ; 
#ifdef SW
	//fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem21[2]+mem21[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem21[I+3] = val ;
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	//
	// input for mem4
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem22[I] = val ; 
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	range = (mem22[2]+mem22[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem22[I+3] = val ;
#ifdef SW
		//fprintf(stderr,"Info: read data = %d\n",val);
#endif	
		}
	 
}

//-------------------------------------------------------------------------------------
	
void initInputs( )
{
	//
	// reading maxinum number of iteration
	uint16_t nitr = read_uint16("maxNitr_in");
	maxNitr = nitr ;
#ifdef SW
	//fprintf(stderr,"Info:read maxNitr = %d\n", nitr);
#endif
	//
	// reading signal to noise power ration
	float SNR = read_float32("ebbyNo_in"); 
	ebbyNo = SNR ;
#ifdef SW
	//fprintf(stderr,"Info:read SNR = %f\n", SNR);
#endif
	//
	// initializing the memory
	initMem();
	//
	// initializing the rate
	float Rate = read_float32("rate_in");
	rate = Rate ;
}
//--------------------------------------------------------------------


//---------------------------------------------------------------------------------------

//
// reading code block to decode
void readCodeBlock()
{
	//fprintf(stderr,"readCodeBlock");
	uint16_t I;	
	// reading code_block1
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			float code_bit = read_float32("code_block_in");
#ifdef SW
			//fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
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
			//fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
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
	//fprintf(stderr,"initialize_aPriori1 ");
	uint16_t I;
	
//	float rate ;
//	
//	calculating rate of code	:
//	rate = (float) ((ncols)-(nrows))/(ncols); 
	
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
		//fprintf(stderr," I= %d ,  aPriori1[I]=  %f \n", I , aPriori1[I]);
#endif
		}
}

//
// initializing apriori probabilities
void initialize_aPriori2 ()
{
	//fprintf(stderr,"initialize_aPriori2 ");
	uint16_t I;
	
//	float rate ;
//	
//	calculating rate of code	:
//	rate = (float) ((ncols)-(nrows))/(ncols); 
	
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
		//fprintf(stderr," I= %d ,  aPriori2[I]=  %f \n", I , aPriori2[I]);
#endif
		}
}

//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------




//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage11 ()
{
	//fprintf(stderr,"initializeMessage11 ");
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_11 ; I++)
	{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
	message11[I] = aPriori1[mem11[3+I]-1];	
#ifdef SW
	//fprintf(stderr," message11[%d]= %f \n ",I,message11[I]);
#endif	
	}
}			

void initializeMessage12 ()
{
	//fprintf(stderr,"initializeMessage12 ");
	uint16_t I ;
	for ( I=0 ; I < ncol_ind_12 ; I++)
	{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
	message12[I] = aPriori2[mem12[3+I]-1];	
#ifdef SW
	//fprintf(stderr," message12[%d]= %f \n ",I,message12[I]);
#endif	
	}
}	

void initializeMessage21 ()
{
	//fprintf(stderr,"initializeMessage21 ");
	uint16_t I ;
	for ( I=0 ; I < ncol_ind_21 ; I++)
	{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
	message21[I] = aPriori1[mem21[3+I]-1];	
#ifdef SW
	//fprintf(stderr," message21[%d]= %f \n ",I,message21[I]);
#endif	
	}
}

void initializeMessage22 ()
{
	//fprintf(stderr,"initializeMessage22 ");
	uint16_t I ;
	for ( I=0 ; I < ncol_ind_22 ; I++)
	{
#ifndef SW
	__loop_pipelining_on__(63,2,0);
#endif
	message22[I] = aPriori2[mem22[3+I]-1];	
#ifdef SW
	//fprintf(stderr," message22[%d]= %f \n ",I,message22[I]);
#endif	
	}
}	
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori1 ()
{		
	//fprintf(stderr,"initializeaPosteriori1 \n");
	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			aPosteriori1[I] = aPriori1[I] ;
			}
#ifdef SW
	//fprintf(stderr," aPosteriori1 initialized \n");
#endif
	
}
void initialize_aPosteriori2 ()
{		
	//fprintf(stderr,"initializeaPosteriori2 \n");
	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			aPosteriori2[I] = aPriori2[I] ;
			}
#ifdef SW
	//fprintf(stderr," aPosteriori2 initialized \n");
#endif
	
}

//----------------------------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo11 ()
{
	//fprintf(stderr,"initializeExtrinsicInfo11 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_11; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info11[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"ext_info11 initialized \n");
#endif

}
void initializeExtrinsicInfo12 ()
{
	//fprintf(stderr,"initializeExtrinsicInfo12 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_12; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info12[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"ext_info12 initialized \n");
#endif

}
void initializeExtrinsicInfo21 ()
{
	//fprintf(stderr,"initializeExtrinsicInfo21 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_21; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info21[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"ext_info21 initialized \n");
#endif

}
void initializeExtrinsicInfo22 ()
{
	//fprintf(stderr,"initializeExtrinsicInfo22 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_22; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info22[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"ext_info22 initialized \n");
#endif

}
//---------------------------------------------------------------------------------------------------
void initializeTransInfo11_12 ()
{
	//fprintf(stderr,"initializeTransInfo11_12 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_11; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			trans_info11_12[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"trans_info11 initialized \n");
#endif

}
void initializeTransInfo12_11 ()
{
	//fprintf(stderr,"initializeTransInfo12_11 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_12; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			trans_info12_11[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"trans_info12 initialized \n");
#endif

}
void initializeTransInfo21_22 ()
{
	//fprintf(stderr,"initializeTransInfo21_22 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_21; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			trans_info21_22[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"trans_info21 initialized \n");
#endif

}
void initializeTransInfo22_21 ()
{
	//fprintf(stderr,"initializeTransInfo22_21 \n");
uint16_t I;
		for ( I = 0 ; I < ncol_ind_22; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			trans_info22_21[I] = 0;
			}
#ifdef SW
			//fprintf(stderr,"trans_info22 initialized \n");
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
//-----------------------------------------------------------------------------------------------------------

float modifyInfo (float ext_info , float self_information )
{

	float sign ;
	float magnitude ;
 
	if ( ext_info >= 0 )
		{
		if ( self_information >=0 )
		sign = +1.0;                              // both positive 
		else
		sign = -1.0;
		} 
	else
		{
		if ( self_information < 0 )
		sign = +1.0;										// both negative
		else
		sign = -1.0;
		}
				
								
		// finding minimum of the messages to update magnitude of the extrinsic information.
	if ( absf( self_information ) > absf( ext_info ) )

		magnitude = absf( ext_info ) ;
	else
		magnitude = absf( self_information ) ;

return (sign*magnitude) ;
					

}

//---------------------------------------------------------------------------------------------------------------

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine11 ()
{
	//fprintf(stderr,"checkNodeComputeEngine11  \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_11 ;
		else 
			range = CHECK_BIT_COUNT2_11 ;	
			
		if ( range > 1)
		{
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
				uint16_t index =  mem11[3 + ncol_ind_11 + row] -1 + I  ;
				//
				// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		  	 	// iterating through all the bit nodes corrosponding to a perticular check node.
				if ( I == col)
					{
					//
					// excluding self inforamtion for calculation of extrinsic info.			
					continue;
					}
				else
					{
					//
					// finding sign of the extrinsic information 
					if ( message11[ index] >= 0.0 )
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
						val = absf(message11[ index]);
						}
					else
						{
						if ( absf(message11[ index]) < val )
							{
							val = absf(message11[ index]) ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info11[ index_2D_11 ] = val * sign ;
				//fprintf(stderr , "ext_info11[%d] = %f \n",index_2D_11,ext_info11[ index_2D_11] );	
				if (col == 0)
					{
					//
					trans_info11_12[row] = modifyInfo ( ext_info11[ index_2D_11 ] , message11[ index_2D_11 ] );
					//fprintf(stderr, "trasnverse_info11_12( %d ) = %f \n", row , trans_info11_12[row] ) ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info11_12[row] = message11[ mem11[3 + ncol_ind_11 + row] -1 ] ;
			//fprintf( stderr , "trasnverse_info11_12( %d ) = %f \n", row , trans_info11_12[row] ) ;
			}
		}			
}

void checkNodeComputeEngine12 ()
{
	//fprintf(stderr,"checkNodeComputeEngine12  \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_12 ;
		else 
			range = CHECK_BIT_COUNT2_12 ;	

		if ( range > 1)
		{
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
				uint16_t index =  mem12[3 + ncol_ind_12 + row] -1 + I  ;
				//
				// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		  	 	// iterating through all the bit nodes corrosponding to a perticular check node.
				if ( I == col)
					{
					//
					// excluding self inforamtion for calculation of extrinsic info.			
					continue;
					}
				else
					{
					//
					// finding sign of the extrinsic information 
					if ( message12[ index] >= 0.0 )
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
						val = absf(message12[ index]);
						}
					else
						{
						if ( absf(message12[ index]) < val )
							{
							val = absf(message12[ index]) ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info12[ index_2D_12 ] = val * sign ;
				//fprintf(stderr , "ext_info12[%d] = %f \n",index_2D_12,ext_info12[ index_2D_12] );	
				if (col == 0)
					{
					//
					trans_info12_11[row] = modifyInfo ( ext_info12[ index_2D_12 ] , message12[ index_2D_12 ] );
					//fprintf( stderr , "trasnverse_info12_11( %d ) = %f \n", row , trans_info12_11[row] ) ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info12_11[row] = message12[ mem12[3 + ncol_ind_12 + row] -1 ] ;
			//fprintf( stderr ,"trasnverse_info12_11( %d ) = %f \n", row , trans_info12_11[row] ) ;
			}
		}			
}

void checkNodeComputeEngine21 ()
{
	//fprintf(stderr,"checkNodeComputeEngine21  \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_21 ;
		else 
			range = CHECK_BIT_COUNT2_21 ;	

		if ( range > 1)
		{
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
				uint16_t index =  mem21[3 + ncol_ind_21 + row] -1 + I  ;
				//
				// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		  	 	// iterating through all the bit nodes corrosponding to a perticular check node.
				if ( I == col)
					{
					//
					// excluding self inforamtion for calculation of extrinsic info.			
					continue;
					}
				else
					{
					//
					// finding sign of the extrinsic information 
					if ( message21[ index] >= 0.0 )
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
						val = absf(message21[ index]);
						}
					else
						{
						if ( absf(message21[ index]) < val )
							{
							val = absf(message21[ index]) ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info21[ index_2D_21 ] = val * sign ;
				//fprintf(stderr , "ext_info21[%d] = %f \n",index_2D_21,ext_info21[ index_2D_21] );	
				if (col == 0)
					{
					//
					trans_info21_22[row] = modifyInfo ( ext_info21[ index_2D_21 ] , message21[ index_2D_21 ] );
					//fprintf( stderr , "trasnverse_info21_22( %d ) = %f \n", row , trans_info21_22[row] ) ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info21_22[row] = message21[ mem21[3 + ncol_ind_21 + row] -1 ] ;
			//fprintf( stderr , "trasnverse_info21_22( %d ) = %f \n", row , trans_info21_22[row] ) ;
			}
		}			
}

void checkNodeComputeEngine22 ()
{
	//fprintf(stderr,"checkNodeComputeEngine22  \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_22 ;
		else 
			range = CHECK_BIT_COUNT2_22 ;	

		if ( range > 1)
		{
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
				uint16_t index =  mem22[3 + ncol_ind_22 + row] -1 + I  ;
				//
				// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		  	 	// iterating through all the bit nodes corrosponding to a perticular check node.
				if ( I == col)
					{
					//
					// excluding self inforamtion for calculation of extrinsic info.			
					continue;
					}
				else
					{
					//
					// finding sign of the extrinsic information 
					if ( message22[ index] >= 0.0 )
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
						val = absf(message22[ index]);
						}
					else
						{
						if ( absf(message22[ index]) < val )
							{
							val = absf(message22[ index]) ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info22[ index_2D_22 ] = val * sign ;	
				//fprintf(stderr , "ext_info22[%d] = %f \n",index_2D_22,ext_info22[ index_2D_22] );
				if (col == 0)
					{
					//
					trans_info22_21[row] = modifyInfo ( ext_info22[ index_2D_22 ] , message22[ index_2D_22 ] );
					//fprintf( stderr ,"trasnverse_info22_21( %d ) = %f \n", row , trans_info22_21[row] ) ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info22_21[row] = message22[ mem22[3 + ncol_ind_22 + row] -1 ] ;
			//fprintf( stderr , "trasnverse_info22_21( %d ) = %f \n", row , trans_info22_21[row] ) ;
			}
		}			
}


//-------------------------------------------------------------------------------------------------------------------------

//
//
//
void transverseCorrection11 ()
{		
	//fprintf(stderr,"transverseCorrection11 \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_11 ;
		else 
			range = CHECK_BIT_COUNT2_11 ;	

		if  ( range > 1) 
				{
				//
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
				if ( trans_info12_11[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						ext_info11[ index_2D_11 ] = modifyInfo ( ext_info11[ index_2D_11] ,  trans_info12_11[row] ) ;
						//fprintf( stderr, "ext_info11( %d,%d ) = %f \n", row ,col , ext_info11[ index_2D_11 ] ) ;
							}
						}
					else
						{
						for ( col = 0 ; col < range ; col++)
							{
							ext_info11[ index_2D_11  ] = ext_info11[ index_2D_11  ] ; // dummy statement
							//fprintf( stderr, "ext_info11( %d,%d ) = %f \n", row ,col , ext_info11[ index_2D_11 ] ) ;
							}
						}				
					}
		else if ( range == 1)
			{
			ext_info11[  mem11[3 + ncol_ind_11 + row] -1] = trans_info12_11[row] ; 
			//fprintf( stderr, "ext_info11( %d) = %f \n", row  ,ext_info11[  mem11[3 + ncol_ind_11 + row] -1] ) ;
			}
		}

			
}
void transverseCorrection12 ()
{		
	//fprintf(stderr,"transverseCorrection12 \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_12 ;
		else 
			range = CHECK_BIT_COUNT2_12 ;	

		if  ( range > 1) 
				{
				//
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
				if ( trans_info11_12[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						ext_info12[ index_2D_12 ] = modifyInfo ( ext_info12[ index_2D_12] ,  trans_info11_12[row] ) ;
						//fprintf( stderr, "ext_info12( %d,%d ) = %f \n", row ,col , ext_info12[ index_2D_12 ] ) ;
							}
						}
					else
						{
						for ( col = 0 ; col < range ; col++)
							{
							ext_info12[ index_2D_12  ] = ext_info12[ index_2D_12  ] ; // dummy statement
							//fprintf( stderr, "ext_info12( %d,%d ) = %f \n", row ,col , ext_info12[ index_2D_12 ] ) ;
							}
						}				
					}
		else if ( range == 1)
			{
			ext_info12[  mem12[3 + ncol_ind_12 + row] -1 ] = trans_info11_12[row] ; 
			//fprintf( stderr, "ext_info12( %d) = %f \n", row  ,ext_info12[  mem12[3 + ncol_ind_12 + row] -1 ] ) ;
			}
		}

			
}
void transverseCorrection22 ()
{		
	//fprintf(stderr,"transverseCorrection22 \n");
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_22 ;
		else 
			range = CHECK_BIT_COUNT2_22 ;	

		if  ( range > 1) 
				{
				//
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
				if ( trans_info21_22[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						ext_info22[ index_2D_22 ] = modifyInfo ( ext_info22[ index_2D_22] ,  trans_info21_22[row] ) ;
						//fprintf( stderr,"ext_info22( %d,%d ) = %f \n", row ,col , ext_info22[ index_2D_22 ] ) ;
							}
						}
					else
						{
						for ( col = 0 ; col < range ; col++)
							{
							ext_info22[ index_2D_22  ] = ext_info22[ index_2D_22  ] ; // dummy statement
							//fprintf( stderr, "ext_info22( %d,%d ) = %lf \n", row ,col , ext_info22[ index_2D_22 ] ) ;
							}
						}				
					}
		else if ( range == 1)
			{
			ext_info22[  mem22[3 + ncol_ind_22 + row] -1 ] = trans_info21_22[row] ; 
			//fprintf( stderr, "ext_info22( %d) = %f \n", row  , ext_info22[  mem22[3 + ncol_ind_22 + row] -1 ]) ;
			}
		}

			
}
void transverseCorrection21 ()
{	
	//fprintf(stderr,"transverseCorrection21 \n");	
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif	

		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_21 ;
		else 
			range = CHECK_BIT_COUNT2_21 ;	

		if  ( range > 1) 
				{
				//
				// if only more than one edge is connected then exterinsic info can be calculated
				// case is possible after partitioning
				if ( trans_info22_21[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						ext_info21[ index_2D_21 ] = modifyInfo ( ext_info21[ index_2D_21] ,  trans_info22_21[row] ) ;
						//fprintf( stderr, "ext_info21( %d,%d ) = %f \n", row ,col , ext_info21[ index_2D_21 ] ) ;
							}
						}
					else
						{
						for ( col = 0 ; col < range ; col++)
							{
							ext_info21[ index_2D_21  ] = ext_info21[ index_2D_21  ] ; // dummy statement
							//fprintf( stderr, "ext_info21( %d,%d ) = %f \n", row ,col , ext_info21[ index_2D_21 ] ) ;
							}
						}				
					}
		else if ( range == 1)
			{
			ext_info21[ mem21[3 + ncol_ind_21 + row] -1 ] = trans_info22_21[row] ; 
			//fprintf( stderr, "ext_info21( %d) = %f \n", row  , ext_info21[ mem21[3 + ncol_ind_21 + row] -1 ]) ;
			}
		}

			
}
//-------------------------------------------------------------------------------------------------


void update_aPosteriori11() 
{
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_11 ; I++)
		{
		aPosteriori1[mem11[3+I]-1] += ext_info11[I] ; 
		}
}

void update_aPosteriori12() 
{
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_12 ; I++)
		{
		aPosteriori2[mem12[3+I]-1] += ext_info12[I] ; 
		}
}

void update_aPosteriori21() 
{
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_21 ; I++)
		{
		aPosteriori1[mem21[3+I]-1] += ext_info21[I] ; 
		}
}

void update_aPosteriori22() 
{
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_22 ; I++)
		{
		aPosteriori2[mem22[3+I]-1] += ext_info22[I] ; 
		}
}
//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a piosteriori probabilities.
// return the decode status of the code block.
uint8_t checkIsdecoded1( ) 
{
	//fprintf(stderr,"checkIsdecoded1\n");
	uint8_t is_decoded = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif 
//	 iterating through all code bits	:
		if ( aPosteriori1[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block1[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block1[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori1[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block1[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block1[I] = 1.0;			// modifies the code bit.
			}
		}
#ifdef SW
		//fprintf(stderr,"check is decoded1 done \n");
#endif
	return(is_decoded);
}

uint8_t checkIsdecoded2( ) 
{
	//fprintf(stderr,"checkIsdecoded2\n");	
	uint8_t is_decoded = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif 
//	 iterating through all code bits	:
		if ( aPosteriori2[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block2[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block2[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori2[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block2[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded = 0;				// flags that a bit got flipped while decoding.
				}
			code_block2[I] = 1.0;			// modifies the code bit.
			}
		}
#ifdef SW
		//fprintf(stderr,"check is decoded2 done \n");
#endif
	return(is_decoded);
}

//-------------------------------------------------------------------------------------------------------------
//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage11 ()
{
		//fprintf(stderr,"updateMessage11\n");
		uint16_t row,col;
		for ( row = 0 ; row < nrows ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_11 ;
				else
					range = CHECK_BIT_COUNT2_11 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					//
					//	iterating through all the bit nodes of a check node and updating message.
					message11 [ index_2D_11 ] =  aPosteriori1[ index_1D_11 ] - ext_info11 [ index_2D_11 ] ;
#ifdef SW
					//fprintf (stderr,"message11(%d) = %f \n", index_2D_11 , message11 [ index_2D_11 ] );
#endif
					}
				}

}


void updateMessage12 ()
{
		//fprintf(stderr,"updateMessage12\n");
		uint16_t row,col;
		for ( row = 0 ; row < nrows ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_12 ;
				else
					range = CHECK_BIT_COUNT2_12 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					//
					//	iterating through all the bit nodes of a check node and updating message.
					message12 [ index_2D_12 ] =  aPosteriori2[ index_1D_12 ] - ext_info12 [ index_2D_12 ] ;
#ifdef SW
					//fprintf (stderr,"message12(%d) = %f \n", index_2D_12 , message12 [ index_2D_12 ] );
#endif
					}
				}

}


void updateMessage21 ()
{
		//fprintf(stderr,"updateMessage21\n");
		uint16_t row,col;
		for ( row = 0 ; row < nrows ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_21 ;
				else
					range = CHECK_BIT_COUNT2_21 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					//
					//	iterating through all the bit nodes of a check node and updating message.
					message21 [ index_2D_21 ] =  aPosteriori1[ index_1D_21 ] - ext_info21 [ index_2D_21 ] ;
#ifdef SW
					//fprintf (stderr,"message21(%d) = %f \n", index_2D_21 , message21 [ index_2D_21 ] );
#endif
					}
				}

}


void updateMessage22 ()
{
		//fprintf(stderr,"updateMessage22\n");
		uint16_t row,col;
		for ( row = 0 ; row < nrows ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_22 ;
				else
					range = CHECK_BIT_COUNT2_22 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					//
					//	iterating through all the bit nodes of a check node and updating message.
					message22 [ index_2D_22 ] =  aPosteriori2[ index_1D_22 ] - ext_info22 [ index_2D_22 ] ;
#ifdef SW
					//fprintf (stderr,"message22(%d) = %f \n", index_2D_22 , message22 [ index_2D_22 ] );
#endif
					}
				}

}



//
//-----------------------------------------------------------------------------------------------------------

void bpsk_demodulate()
{
//	fprintf(stderr," bpsk_demodulate\n");
	int I;
	for (I =0 ; I < ncols ; I++)
		{
		if (code_block1[I] < 0.0 )
			{
			code_block1[I] = 0.0 ;
			//fprintf(stderr,"\n I do came here!\n");
			}
		if (code_block2[I] < 0.0 )
			{
			code_block2[I] = 0.0 ;
			//fprintf(stderr,"\n I do came here!\n");	
			}
		}
}

//-----------------------------------------------------------------------------------------------------	

void top_daemon_1 ()
{
	
	initInputs() ; 
	
	//initMem( ) ;
	
	readCodeBlock ();
	
	write_uint8("reading_code_block_done",1) ;
	
	initialize_aPriori1 () ;
	
	initializeMessage11 () ;
	
	write_uint8("message11_initialized",1) ;
	
	uint8_t nitr_1 = 1 ;
	
		
	while(nitr_1 < maxNitr)
		{
	
		initialize_aPosteriori1();
	
		initializeExtrinsicInfo11() ;
		
		initializeTransInfo11_12() ;

		checkNodeComputeEngine11 ();
		
		write_uint8("trans_info11_12_calulation_done",1);
		
		uint8_t init_trans_info = read_uint8("trans_info12_11_calulation_done") ;
		
		transverseCorrection11 () ;
		
		update_aPosteriori11() ;
		
		write_uint8("aPosteriori1_phase_1_done",1) ;
		
		//fprintf(stderr,"Now! write aPosteriori1_phase_1_done - daemon1 \n" );
		
		uint8_t aPosteriori_update_phase2_done = read_uint8("aPosteriori1_phase_2_done");
		
		int po ;
		for ( po = 0; po < ncols ; po++ )
			{
			fprintf(stderr , "aPosteriori1[%d] = %f \n",po,aPosteriori1[po]);
			}
		
		uint8_t is_decoded_1 = checkIsdecoded1( ) ;
		
		uint8_t is_decoded_from_2 = read_uint8("is_decoded_2") ; 
		
		uint8_t is_decoded = (is_decoded_1 && is_decoded_from_2) ;
		
		write_uint8("is_decoded_d2",is_decoded) ;
		
		write_uint8("is_decoded_d3",is_decoded) ;
		
		write_uint8("is_decoded_d4",is_decoded) ;
				
		if (is_decoded == 1)
			break ;
		else
			updateMessage11( );
		
		nitr_1++ ; 
		
		write_uint8("message11_modified",1);
		uint8_t read_message_21_modified = read_uint8("message21_modified");
		}
		
		bpsk_demodulate() ; 		

#ifdef SW
	fprintf(stderr," number of iteration required = %d \n",(nitr_1-1)) ;
	int I;
	for(I = 0; I < ncols; I++)
		{
		//fprintf(stderr,"code_block1[%d] = %f \n" , I,code_block1[I]);
		//fprintf(stderr,"code_block2[%d] = %f \n" , I,code_block2[I]);
		}

	FILE* decode_file ;
	decode_file = fopen ("decode.txt","w");
	uint16_t J ;
	
	for ( J = 0 ; J < ncols ; J++ )
	{	
	fprintf(decode_file,"%f\n",code_block1[I]);
	fprintf(decode_file,"%f\n",code_block2[I]);
	}
	
	fclose(decode_file);
#endif
	
//	write_uint8("stop_the_daemon1",1);
	
//	write_uint16("ncols_out",ncols);
	
	
	uint16_t K1 ;
	for ( K1 = 0 ; K1 < ncols ; K1++ )
	{
	write_float32("code_block1_out",code_block1[K1]);
	//fprintf(stderr, "code_block1_out_write[%d] = %f \n",K1,code_block1[K1] );
	}
	
	uint16_t K2 ;
	
	for ( K2 = 0 ; K2 < ncols ; K2++ )
	{
	write_float32("code_block2_out",code_block2[K2]);
	//fprintf(stderr, "code_block2_out_write[%d] = %f \n",K2,code_block2[K2] );
	}		 
}

void top_daemon_2()
{

	uint8_t init_mat = read_uint8("reading_code_block_done");
	
	initialize_aPriori2 ();	
	
	initializeMessage12 ();
	
	write_uint8("message12_initialized",1) ;
	
	uint8_t nitr_2 = 1 ;
	
	while(nitr_2 < maxNitr)
	{	
	
		initialize_aPosteriori2();
	
		initializeExtrinsicInfo12() ;
	
		initializeTransInfo12_11() ;
		
		checkNodeComputeEngine12 ();

		write_uint8("trans_info12_11_calulation_done",1);
			
		uint8_t init_trans_info = read_uint8("trans_info11_12_calulation_done") ;
		
		transverseCorrection12 () ;
		
		update_aPosteriori12() ;
		
		write_uint8("aPosteriori2_phase_1_done",1) ;
		
				
		uint8_t aPosteriori_update_phase2_done = read_uint8("aPosteriori2_phase_2_done");
	
		int po ;
		for ( po = 0; po < ncols ; po++ )
			{
			fprintf(stderr , "aPosteriori2[%d] = %f \n",po,aPosteriori2[po]);
			}
			
		uint8_t find_is_decoded_2 = checkIsdecoded2( ) ;
		
		write_uint8("is_decoded_2",find_is_decoded_2) ;
		
		uint8_t is_decoded = read_uint8("is_decoded_d2");
		
		if (is_decoded == 1)
			break ;
		else
			updateMessage12( );
		
		nitr_2++ ;  
		
		write_uint8("message12_modified",1);
	
		uint8_t read_message_22_modified = read_uint8("message22_modified");
		
	}

}

void daemon_3()
{
	uint8_t init_aPriori1 = read_uint8("message11_initialized") ;
	 
	initializeMessage21 ();

	uint8_t nitr_3 = 1 ;
		
		while(nitr_3 < maxNitr)
		{
		initializeExtrinsicInfo21() ;
	
		initializeTransInfo21_22() ;
	
		checkNodeComputeEngine21 ();
	
		write_uint8("trans_info21_22_calulation_done",1);
		
		uint8_t trans_info_computed = read_uint8("trans_info22_21_calulation_done");
		
		transverseCorrection21 () ;
		
		uint8_t aPosteriori_update_phase1_done = read_uint8("aPosteriori1_phase_1_done") ;
		
		update_aPosteriori21() ;
		
		write_uint8("aPosteriori1_phase_2_done",1);
		
		uint8_t is_decoded = read_uint8("is_decoded_d3");
		
		if (is_decoded ==1 )
			break ;
		else
			updateMessage21( );
			
		nitr_3++ ; 
		
		write_uint8("message21_modified",1);
		
		uint8_t read_message11_modified = read_uint8("message11_modified");
		}

}

void daemon_4()
{
	uint8_t init_aPriori2 = read_uint8("message12_initialized") ;
	
	initializeMessage22 ();
	
	uint8_t nitr_4 = 1 ;
		
		while(nitr_4 < maxNitr)
		{
		initializeExtrinsicInfo22() ;
	
		initializeTransInfo22_21() ;
	
		checkNodeComputeEngine22 ();
	
		write_uint8("trans_info22_21_calulation_done",1);
		
		uint8_t trans_info_computed = read_uint8("trans_info21_22_calulation_done");
		
		transverseCorrection22 () ;
		
		uint8_t aPosteriori_update_phase1_done = read_uint8("aPosteriori2_phase_1_done") ;
		
		update_aPosteriori22() ;
		
		write_uint8("aPosteriori2_phase_2_done",1);
		
		uint8_t is_decoded = read_uint8("is_decoded_d4");
		
		if (is_decoded ==1 )
			break ;
		else
			updateMessage22( );
	
		nitr_4++ ;  
		
		write_uint8("message22_modified",1);
		
		uint8_t read_message12_modified = read_uint8("message12_modified");
		}

}


