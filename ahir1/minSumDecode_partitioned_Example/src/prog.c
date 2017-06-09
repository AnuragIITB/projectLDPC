#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include "prog.h"


	uint16_t mem11[MATRIX_NNZ];
	uint16_t mem12[MATRIX_NNZ];
	uint16_t mem21[MATRIX_NNZ];
	uint16_t mem22[MATRIX_NNZ];
	
	uint16_t maxNitr    ;
	float   ebbyNo    ; 
	float   rate ;
	float code_block1[MATRIX_ORDER];
	float code_block2[MATRIX_ORDER];
	
	float aPriori1[MATRIX_ORDER];	
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
	
	uint16_t is_decoded_1 ;
	uint16_t is_decoded_2 ;

	uint16_t Nitr_required ;
	
	uint16_t ncols,nrows;
	
	uint16_t ncol_ind_11 ;
	uint16_t ncol_ind_12 ;
	uint16_t ncol_ind_21 ;
	uint16_t ncol_ind_22 ;
	
	
#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif
//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------

void send_init_apriori1()
{
	int I;

		for( I = 0 ; I < ncols ; I++)
		{	
		float val = aPriori1[I] ;
		write_float32("aPriori1_out",val);
		} 
}

void send_init_apriori2()
{
	int I;

		for( I = 0 ; I < ncols ; I++)
		{	
		float val = aPriori2[I] ;
		write_float32("aPriori2_out",val);
		} 
}
//----------------------------------
void initMem()
{
	uint16_t I,val,range;
	//
	// input for mem1
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem11[I] = val ; 
		}
	nrows = mem11[0] ;
	ncols = mem11[1] ;
	ncol_ind_11 = mem11[2] ;
	range = (mem11[2]+mem11[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem11[I+3] = val ;
		}
	//
	// input for mem2 
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem12[I] = val ; 
		}
	ncol_ind_12 = mem12[2] ;
	range = (mem12[2]+mem12[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem12[I+3] = val ;
		}
	//
	// input for mem3
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem21[I] = val ; 
		}
	ncol_ind_21 = mem21[2] ;
	range = (mem21[2]+mem21[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem21[I+3] = val ;
		}
	//
	// input for mem4
		for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem22[I] = val ; 
		}
	ncol_ind_22 = mem22[2] ;
	range = (mem22[2]+mem22[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem22[I+3] = val ;
		}
	
}

//-------------------------------------------------------------------------------------
	
void initInputs( )
{
	//
	// reading maxinum number of iteration
	uint16_t nitr = read_uint16("maxNitr_in");
	maxNitr = nitr ;
	// reading signal to noise power ration
	float SNR = read_float32("ebbyNo_in"); 
	ebbyNo = SNR ;
	// initializing the memory
	initMem();
	// initializing the rate
	float Rate = read_float32("rate_in");
	rate = Rate ;
}
//
//---------------------------------------------------------------------------------------

void readCodeBlock()
{
	uint16_t I;	
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
			float code_bit = read_float32("code_block_in");
			code_block1[I] = code_bit ;
			}
	//
	// reading code_block2
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
			float code_bit = read_float32("code_block_in");
			code_block2[I] = code_bit ;
			}
}
//
//---------------------------------------------------------------------------------------------- 


void initialize_aPriori2 ()
{
	uint16_t I;	
	for ( I = 0 ; I < ncols ; I++ )
		{
#ifndef SW
//	__loop_pipelining_on__(16,2,0);
#endif	
		float StoN = ebbyNo ;
		float R = rate ;
		float temp1 = rate * StoN  ;
		float code_bit = -4*code_block2[ I ] ;
		float temp2 =  temp1 * code_bit ; 
		float val =  temp2;
		aPriori2[I] = val  ;  
		}
	send_init_apriori2();
}
	
	
void initialize_aPriori1 ()
{
	uint16_t I;	
	for ( I = 0 ; I < ncols ; I++ )
		{
#ifndef SW
//	__loop_pipelining_on__(16,2,0);
#endif	
		float StoN = ebbyNo ;
		float R = rate ;
		float temp1 = rate * StoN  ;
		float code_bit = -4*code_block1[ I ] ;
		float temp2 =  temp1 * code_bit ; 
		float val =  temp2;
		aPriori1[I] = val  ;  
		}
	send_init_apriori1();
}

//------------------------------------------------------------------------------------------

void initializeMessage11 ()
{
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_11 ; I++)
	{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
	uint16_t val = mem11[3+I]-1 ; 
	message11[I] = aPriori1[val];	
	}
}			

void initializeMessage12 ()
{
	uint16_t I ;
	for ( I=0 ; I < ncol_ind_12 ; I++)
	{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
	uint16_t val = mem12[3+I]-1 ;
	message12[I] = aPriori2[val];	
	}
}	

void initializeMessage21 ()
{
	uint16_t I ;
	for ( I=0 ; I < ncol_ind_21 ; I++)
	{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
	uint16_t val = mem21[3+I]-1 ;
	message21[I] = aPriori1[val];	
	}
}

void initializeMessage22 ()
{
	uint16_t I ;
	for ( I=0 ; I < ncol_ind_22 ; I++)
	{
#ifndef SW
//	__loop_pipelining_on__(63,2,0);
#endif
	uint16_t val = mem22[3+I]-1 ;
	message22[I] = aPriori2[val];	
	}
}	


//------------------------------------------------------------------------------------------

// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori1 ()
{	
	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
			{
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
			aPosteriori1[I] = aPriori1[I] ;
			}	
}
void initialize_aPosteriori2 ()
{	
	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		aPosteriori2[I] = aPriori2[I] ;
		}	
}
//--------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo11 ()
{
	uint16_t I;
		for ( I = 0 ; I < ncol_ind_11; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		ext_info11[I] = 0;
		}
}
void initializeExtrinsicInfo12 ()
{
	uint16_t I;
		for ( I = 0 ; I < ncol_ind_12; I++)
			{
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
			ext_info12[I] = 0;
			}
}
void initializeExtrinsicInfo21 ()
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind_21; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		ext_info21[I] = 0;
		}
}
void initializeExtrinsicInfo22 ()
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind_22; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		ext_info22[I] = 0;
		}
}
//---------------------------------------------------------------------------------------------------
void initializeTransInfo11_12 ()
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind_11; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		trans_info11_12[I] = 0;
		}
}

void initializeTransInfo12_11 ()
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind_12; I++)
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		trans_info12_11[I] = 0;
		}	
}
void initializeTransInfo21_22 ()
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind_21; I++)
			{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		trans_info21_22[I] = 0;
		}
}
void initializeTransInfo22_21 ()
{
	uint16_t I;
	for ( I = 0 ; I < ncol_ind_22; I++)
			{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif
		trans_info22_21[I] = 0;
		}
}
//------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------	

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine11 ()
{
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range ;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
		uint16_t CHECK_BIT_COUNT1_11 =  ( ncol_ind_11 - ( mem11[3 + ncol_ind_11 +row] -1 ) ) ;
		uint16_t CHECK_BIT_COUNT2_11 =  (  mem11[3 + ncol_ind_11 +row + 1] ) - (  mem11[3 + ncol_ind_11 +row]  ) ;
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_11 ;
		else 
			range = CHECK_BIT_COUNT2_11 ;	
			
		if ( range > 1)
		{
		for ( col = 0 ; col < range ; col++)
			{
			uint16_t index_2D_11 =	mem11[3 + ncol_ind_11 + row] -1 + col ; 
#ifndef SW	
//		__loop_pipelining_on__(63,2,0);
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
//				__loop_pipelining_on__(63,2,0);
#endif			
				uint16_t index =  mem11[3 + ncol_ind_11 + row] -1 + I  ;
				float temp1 ;
				__absf(message11[index],temp1);
				if ( I == col)
					{			
					continue;
					}
				else
					{
					if ( message11[ index] >= 0.0 )
						{
						exor = exor ^ 0 ;
						}
					else 
						{
						exor = exor ^ 1 ; 
						}			
								
					if (flag == 0)
						{
						val = temp1 ;
						}
					else
						{
						if ( temp1 < val )
							{
							val = temp1 ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info11[ index_2D_11 ] = val * sign ;
				if (col == 0)
					{
					__modifyInfo( ext_info11[ index_2D_11 ] , message11[ index_2D_11 ] , trans_info11_12[row]) ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info11_12[row] = message11[ mem11[3 + ncol_ind_11 + row] -1 ] ;
			}
		}			
}

void checkNodeComputeEngine12 ()
{
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range ;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
	uint16_t CHECK_BIT_COUNT1_12  = ( ncol_ind_12 - ( mem12[3 + ncol_ind_12 +row] -1 ) ) ;
	uint16_t CHECK_BIT_COUNT2_12  = (  mem12[3 + ncol_ind_12 +row + 1] ) - (  mem12[3 + ncol_ind_12 +row]  ) ;
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_12 ;
		else 
			range = CHECK_BIT_COUNT2_12 ;	

		if ( range > 1)
		{
		for ( col = 0 ; col < range ; col++)
			{
			uint16_t index_2D_12 =	mem12[3 + ncol_ind_12 + row] -1 + col ;
#ifndef SW	
//		__loop_pipelining_on__(63,2,0);
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
//				__loop_pipelining_on__(63,2,0);
#endif			
				uint16_t index =  mem12[3 + ncol_ind_12 + row] -1 + I  ;
				float temp1 ;
				__absf(message12[index],temp1);

				if ( I == col)
					{			
					continue;
					}
				else
					{
					if ( message12[ index] >= 0.0 )
						{
						exor = exor ^ 0 ;
						}
					else 
						{
						exor = exor ^ 1 ; 
						}			
					if (flag == 0)
						{
						val = temp1;
						}
					else
						{
						if ( temp1 < val )
							{
							val = temp1 ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info12[ index_2D_12 ] = val * sign ;
				if (col == 0)
					{
					__modifyInfo( ext_info12[ index_2D_12 ] , message12[ index_2D_12 ] , trans_info12_11[row] )  ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info12_11[row] = message12[ mem12[3 + ncol_ind_12 + row] -1 ] ;
			}
		}			
}

void checkNodeComputeEngine21 ()
{
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
	uint16_t  CHECK_BIT_COUNT1_21 =  ( ncol_ind_21 - ( mem21[3 + ncol_ind_21 +row] -1 ) ) ;
	uint16_t  CHECK_BIT_COUNT2_21  = (  mem21[3 + ncol_ind_21 +row + 1] ) - (  mem21[3 + ncol_ind_21 +row]  );
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_21 ;
		else 
			range = CHECK_BIT_COUNT2_21 ;	

		if ( range > 1)
		{
		for ( col = 0 ; col < range ; col++)
			{
			uint16_t index_2D_21 =	mem21[3 + ncol_ind_21 + row] -1 + col ;
#ifndef SW	
//		__loop_pipelining_on__(63,2,0);
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
//				__loop_pipelining_on__(63,2,0);
#endif			
				uint16_t index =  mem21[3 + ncol_ind_21 + row] -1 + I  ;
				float temp1 ;
				__absf(message21[index],temp1);
				if ( I == col)
					{		
					continue;
					}
				else
					{ 
					if ( message21[ index] >= 0.0 )
						{
						exor = exor ^ 0 ;
						}
					else 
						{
						exor = exor ^ 1 ; 
						}			
					if (flag == 0)
						{
						val = temp1;
						}
					else
						{
						if ( temp1 < val )
							{
							val = temp1 ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info21[ index_2D_21 ] = val * sign ;
				if (col == 0)
					{
					__modifyInfo( ext_info21[ index_2D_21 ], message21[ index_2D_21 ] , trans_info21_22[row] )  ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info21_22[row] = message21[ mem21[3 + ncol_ind_21 + row] -1 ] ;
			}
		}			
}

void checkNodeComputeEngine22 ()
{
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
	uint16_t CHECK_BIT_COUNT1_22  = ( ncol_ind_22 - ( mem22[3 + ncol_ind_22 +row] -1 ) );
	uint16_t CHECK_BIT_COUNT2_22  = (  mem22[3 + ncol_ind_22 +row + 1] ) - (  mem22[3 + ncol_ind_22 +row]  );
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_22 ;
		else 
			range = CHECK_BIT_COUNT2_22 ;	

		if ( range > 1)
		{
		for ( col = 0 ; col < range ; col++)
			{
			uint16_t index_2D_22 =	mem22[3 + ncol_ind_22 + row] -1 + col ;
#ifndef SW	
//		__loop_pipelining_on__(63,2,0);
#endif 			
		// iterating through all the bit nodes corrosponding to a check 
			uint16_t I = 0 ;
			float val = 0.0;				// represents magnitude of the extrensic information.
			uint16_t flag = 0 ; 				// represents first iteration through the inner most loop.
			uint16_t exor = 0;				// represents sign of the extrinsic information.
			float sign = 0.0; 
			for ( I = 0 ; I < range ; I++)
				{
#ifndef SW
//				__loop_pipelining_on__(63,2,0);
#endif			
				uint16_t index =  mem22[3 + ncol_ind_22 + row] -1 + I  ;
				float temp1 ;
				__absf(message22[index],temp1);
				if ( I == col)
					{			
					continue;
					}
				else
					{
					if ( message22[ index] >= 0.0 )
						{
						exor = exor ^ 0 ;
						}
					else 
						{
						exor = exor ^ 1 ; 
						}			
					if (flag == 0)
						{
						val = temp1;
						}
					else
						{
						if ( temp1 < val )
							{
							val = temp1 ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info22[ index_2D_22 ] = val * sign ;	
				if (col == 0)
					{
					__modifyInfo( ext_info22[ index_2D_22 ] , message22[ index_2D_22 ] , trans_info22_21[row] )  ;
					}
				}
			}
		else if ( range == 1)
			{
			trans_info22_21[row] = message22[ mem22[3 + ncol_ind_22 + row] -1 ] ;
			}
		}			
}


//------------------------------------------------------------------------------------------------------
//
//
//
void transverseCorrection11 ()
{	
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range ;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
uint16_t CHECK_BIT_COUNT1_11 =  ( ncol_ind_11 - ( mem11[3 + ncol_ind_11 +row] -1 ) ) ;
uint16_t CHECK_BIT_COUNT2_11 =  (  mem11[3 + ncol_ind_11 +row + 1] ) - (  mem11[3 + ncol_ind_11 +row]  ) ;
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_11 ;
		else 
			range = CHECK_BIT_COUNT2_11 ;	

		if  ( range > 1) 
				{
				if ( trans_info12_11[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						uint16_t index_2D_11 =	mem11[3 + ncol_ind_11 + row] -1 + col ;
						float temp1 ;
						__modifyInfo( ext_info11[ index_2D_11] , trans_info12_11[row] , temp1 ) ;
						ext_info11[ index_2D_11] = temp1 ; 
							}
						}
				 else 
					continue;				
				}
		else 
			{
			ext_info11[  mem11[3 + ncol_ind_11 + row] -1] = trans_info12_11[row] ;
			}
		}

			
}
void transverseCorrection12 ()
{		
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
	uint16_t  CHECK_BIT_COUNT1_12 =  ( ncol_ind_12 - ( mem12[3 + ncol_ind_12 +row] -1 ) ) ;
	uint16_t  CHECK_BIT_COUNT2_12  = (  mem12[3 + ncol_ind_12 +row + 1] ) - (  mem12[3 + ncol_ind_12 +row]  );
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_12 ;
		else 
			range = CHECK_BIT_COUNT2_12 ;	

		if  ( range > 1) 
				{
				if ( trans_info11_12[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						uint16_t index_2D_12 =	mem12[3 + ncol_ind_12 + row] -1 + col ; 
						float temp1;
						__modifyInfo( ext_info12[ index_2D_12 ] , trans_info11_12[row] , temp1 ) ;
						ext_info12[ index_2D_12 ]  = temp1 ;
						}
					}
				else
					continue;				
				}
		else 
			{
			ext_info12[  mem12[3 + ncol_ind_12 + row] -1 ] = trans_info11_12[row] ; 
			}
		}

			
}

void transverseCorrection21 ()
{	
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range ;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
uint16_t CHECK_BIT_COUNT1_21  = ( ncol_ind_21 - ( mem21[3 + ncol_ind_21 +row] -1 ) ) ;
uint16_t CHECK_BIT_COUNT2_21  = (  mem21[3 + ncol_ind_21 +row + 1] ) - (  mem21[3 + ncol_ind_21 +row]  ) ;
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_21 ;
		else 
			range = CHECK_BIT_COUNT2_21 ;	

		if  ( range > 1) 
				{
				if ( trans_info22_21[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						uint16_t index_2D_21 =	mem21[3 + ncol_ind_21 + row] -1 + col ;
						float temp1 ;
						__modifyInfo( ext_info21[ index_2D_21 ] , trans_info22_21[row] , temp1)  ;
						 ext_info21[ index_2D_21 ]  = temp1 ;
						}
					}	
				else
					continue;		
				}
		else 
			{
			ext_info21[ mem21[3 + ncol_ind_21 + row] -1 ] = trans_info22_21[row] ; 
			}
		}
}
void transverseCorrection22 ()
{		
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range ;
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
//		__loop_pipelining_on__(63,2,0);
#endif	
uint16_t CHECK_BIT_COUNT1_22  = ( ncol_ind_22 - ( mem22[3 + ncol_ind_22 +row] -1 ) ) ;
uint16_t CHECK_BIT_COUNT2_22  = (  mem22[3 + ncol_ind_22 +row + 1] ) - (  mem22[3 + ncol_ind_22 +row]  ) ;
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1_22 ;
		else 
			range = CHECK_BIT_COUNT2_22 ;	

		if  ( range > 1) 
				{
				if ( trans_info21_22[row] !=0 )
					{
					for ( col = 0 ; col < range ; col++)
						{
						uint16_t index_2D_22 =	mem22[3 + ncol_ind_22 + row] -1 + col ;
						float temp1 ;
						__modifyInfo( ext_info22[ index_2D_22 ] , trans_info21_22[row] , temp1  ) ;
						ext_info22[ index_2D_22 ] = temp1 ;
						}
					}
				else
					continue;			
				}
		else 
			{
			ext_info22[  mem22[3 + ncol_ind_22 + row] -1 ] = trans_info21_22[row] ; 
			}
		}

			
}

//--------------------------------------------------------------------------------------------------------
void update_aPosteriori11() 
{
	//fprintf(stderr,"update_aPosteriori11\n");
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_11 ; I++)
		{
		uint16_t val = mem11[3+I]-1 ;
		aPosteriori1[val] += ext_info11[I] ; 
		}
}

void update_aPosteriori12() 
{
	//fprintf(stderr,"update_aPosteriori12\n");
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_12 ; I++)
		{
		uint16_t val = mem12[3+I]-1 ;
		aPosteriori2[val] += ext_info12[I] ; 
		}
}

void update_aPosteriori21() 
{
	//fprintf(stderr,"update_aPosteriori21\n");
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_21 ; I++)
		{
		uint16_t val = mem21[3+I]-1 ;
		aPosteriori1[val] += ext_info21[I] ; 
		}
}

void update_aPosteriori22() 
{
	//fprintf(stderr,"update_aPosteriori22\n");	
	uint16_t I ;
	for ( I = 0 ; I < ncol_ind_22 ; I++)
		{
		uint16_t val = mem22[3+I]-1 ;
		aPosteriori2[val] += ext_info22[I] ; 
		}
}
//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a piosteriori probabilities.
// return the decode status of the code block.
void checkIsdecoded1( ) 
{
	//fprintf(stderr,"checkIsdecoded1\n");
	is_decoded_1 = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif 
//	 iterating through all code bits	:
		if ( aPosteriori1[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block1[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded_1 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block1[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori1[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block1[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded_1 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block1[I] = 1.0;			// modifies the code bit.
			}
		}
		//fprintf(stderr,"check is decoded1 done \n");
}

void checkIsdecoded2( ) 
{
	//fprintf(stderr,"checkIsdecoded2\n");
	is_decoded_2 = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif 
//	 iterating through all code bits	:
		if ( aPosteriori2[I] > 0.0 )    		// indicates that code bit is likely to be 0.
			{
			if ( code_block2[I] > 0.0)		// indicates that code bit is 1 at present.
				{
				is_decoded_2 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block2[I] = -1.0;			// modifies the code bit.
			}
				
		else if ( aPosteriori2[I] < 0.0 ) 	// indicates that code bit is likely to be 1.
			{
			if ( code_block2[I] < 0.0)		// indicates that code bit is 0 at present.
				{	
				is_decoded_2 = 0;				// flags that a bit got flipped while decoding.
				}
			code_block2[I] = 1.0;			// modifies the code bit.
			}
		}
		//fprintf(stderr,"check is decoded2 done \n");
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
//			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
uint16_t CHECK_BIT_COUNT1_11 =  ( ncol_ind_11 - ( mem11[3 + ncol_ind_11 +row] -1 ) ) ;
uint16_t CHECK_BIT_COUNT2_11 =  (  mem11[3 + ncol_ind_11 +row + 1] ) - (  mem11[3 + ncol_ind_11 +row]  )	 ;			
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_11 ;
				else
					range = CHECK_BIT_COUNT2_11 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
					uint16_t index_2D_11 =	mem11[3 + ncol_ind_11 + row] -1 + col ; 
					uint16_t index_1D_11 =	mem11 [3 + index_2D_11] - 1 ;
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
					message11 [ index_2D_11 ] =  aPosteriori1[ index_1D_11 ] - ext_info11 [ index_2D_11 ] ;
					//fprintf (stderr,"message11(%d) = %f \n", index_2D_11 , message11 [ index_2D_11 ] );
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
//			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
	uint16_t CHECK_BIT_COUNT1_12 =  ( ncol_ind_12 - ( mem12[3 + ncol_ind_12 +row] -1 ) ) ;
	uint16_t CHECK_BIT_COUNT2_12 =  (  mem12[3 + ncol_ind_12 +row + 1] ) - (  mem12[3 + ncol_ind_12 +row]  ) ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_12 ;
				else
					range = CHECK_BIT_COUNT2_12 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
					uint16_t index_2D_12 = 	mem12[3 + ncol_ind_12 + row] -1 + col ; 
					uint16_t index_1D_12 =	mem12 [3 + index_2D_12] - 1 ;
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
					message12 [ index_2D_12 ] =  aPosteriori2[ index_1D_12 ] - ext_info12 [ index_2D_12 ] ;
					//fprintf (stderr,"message12(%d) = %f \n", index_2D_12 , message12 [ index_2D_12 ] );
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
//			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
		uint16_t CHECK_BIT_COUNT1_21 =  ( ncol_ind_21 - ( mem21[3 + ncol_ind_21 +row] -1 ) );
		uint16_t CHECK_BIT_COUNT2_21 =  (  mem21[3 + ncol_ind_21 +row + 1] ) - (  mem21[3 + ncol_ind_21 +row]  );
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_21 ;
				else
					range = CHECK_BIT_COUNT2_21 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
					uint16_t index_2D_21 =	mem21[3 + ncol_ind_21 + row] -1 + col ;
					uint16_t index_1D_21 =	mem21 [3 + index_2D_21] - 1 ;
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
					message21 [ index_2D_21 ] =  aPosteriori1[ index_1D_21 ] - ext_info21 [ index_2D_21 ] ;
					//fprintf (stderr,"message21(%d) = %f \n", index_2D_21 , message21 [ index_2D_21 ] );
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
//			__loop_pipelining_on__(63,2,0);
#endif
				uint16_t range ;
uint16_t CHECK_BIT_COUNT1_22  = ( ncol_ind_22 - ( mem22[3 + ncol_ind_22 +row] -1 ) ) ; 
uint16_t CHECK_BIT_COUNT2_22  = (  mem22[3 + ncol_ind_22 +row + 1] ) - (  mem22[3 + ncol_ind_22 +row]  ) ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1_22 ;
				else
					range = CHECK_BIT_COUNT2_22 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
					uint16_t index_2D_22 =	mem22[3 + ncol_ind_22 + row] -1 + col;
					uint16_t index_1D_22 =	mem22 [3 + index_2D_22] - 1 ;
#ifndef SW
//			__loop_pipelining_on__(63,2,0);
#endif
					message22 [ index_2D_22 ] =  aPosteriori2[ index_1D_22 ] - ext_info22 [ index_2D_22 ] ;
					//fprintf (stderr,"message22(%d) = %f \n", index_2D_22 , message22 [ index_2D_22 ] );
					}
				}
}

//--------------------------------------------------------------------------------------------------


void send_inputs()
{
	int  I ;

	for(I = 0; I < 9 ; I++)
		{
		uint16_t val = mem11[I] ;
		write_uint16("matrix_out",val);
		}
	for(I = 0; I < 7 ; I++)
		{
		uint16_t val = mem12[I] ;
		write_uint16("matrix_out",val);
		}
	for(I = 0; I < 8 ; I++)
		{
		uint16_t val = mem21[I] ;
		write_uint16("matrix_out",val);
		}
	for(I = 0; I < 8 ; I++)
		{
		uint16_t val = mem22[I] ;
		write_uint16("matrix_out",val);
		}
	
	// code block
		for ( I = 0 ; I < ncols ; I++ )
		{
		float val = code_block1[I] ;
		write_float32("code_block1_out",val);
		}
	
		for ( I = 0 ; I < ncols ; I++ )
		{
		float val = code_block2[I] ;
		write_float32("code_block2_out",val);
		}
	
//	write_uint16("nitr_required",Nitr_required);

}

//------------------------------------------------------------------------------------------

void send_message()
{

	
	int I;		
		for( I = 0 ; I < 4 ; I++)
		{	
		float val = message11[I] ;
		write_float32("init_message11_out",val);
		} 
		
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = message12[I] ;
		write_float32("init_message12_out",val);
		}
		
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = message21[I] ;
		write_float32("init_message21_out",val);
		}
		
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = message22[I] ;
		write_float32("init_message22_out",val);
		}}
void sendOther()
{
	int I;
// initial Apriori
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = aPriori1[I] ;
		write_float32("aPriori1_out",val);
		} 
		
		
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = aPriori2[I] ;
		write_float32("aPriori2_out",val);
		} 
	
	// message init

}
///----------------------------------------------------------------------------------------------------------

void send_aPosteriori() 
{

		int I ;	

		for( I = 0 ; I < ncols ; I++)
		{	
		float val = aPosteriori1[I] ; 
		write_float32("aPosteriori1_out",val );
		} 
			
		for( I = 0 ; I < ncols ; I++)
		{	
		float val = aPosteriori2[I] ; 
		write_float32("aPosteriori2_out",val );
		}  
 
}
//---------------------------------------------------------------------------------
void send_transverseCorrection11 ()
{
		int I ; 
		for( I = 0 ; I < 4 ; I++)
		{	
		float val = ext_info11[I] ;
		write_float32("ext_info11_out",val);
		} 
} 

void send_transverseCorrection12 ()
{
		int I ; 
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = ext_info12[I] ;
		write_float32("ext_info12_out",val);
		} 
} 
void send_transverseCorrection21()
{
		int I ; 
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = ext_info21[I] ;
		write_float32("ext_info21_out",val);
		} 
} 

void send_transverseCorrection22()
{
		int I ; 
		for( I = 0 ; I < 3 ; I++)
		{	
		float val = ext_info22[I] ;
		write_float32("ext_info22_out",val);
		} 
} 
//-------------------------------------------------------------------------------------
void send_tens_info22_21()
{
		int I ; 
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = trans_info22_21[I] ;
		write_float32("trans_info22_21_out",val);
		} 
} 

void send_tens_info21_22()
{
		int I ; 
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = trans_info21_22[I] ;
		write_float32("trans_info21_22_out",val);
		} 
} 

void send_tens_info11_12()
{
		int I ; 
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = trans_info11_12[I] ;
		write_float32("trans_info11_12_out",val);
		} 
} 

void send_tens_info12_11()
{
		int I ; 
		for( I = 0 ; I < 2 ; I++)
		{	
		float val = trans_info12_11[I] ;
		write_float32("trans_info12_11_out",val);
		} 
} 
//-----------------------------------------------------------------------------------------

void top_daemon_1 ()
{
	while(1)
	{
	initInputs() ; 
	
	readCodeBlock ();
	
	send_inputs() ;
	
	write_uint8("reading_code_block_done",1) ;
	
	uint8_t po = read_uint8("aposteriori2_init") ; 
	
	initialize_aPriori1 () ;
	
	initializeMessage11 () ;
	
	write_uint8("message11_initialized",1) ;
	
	uint16_t nitr_1 = 1 ;
	
		
//	while(nitr_1 < maxNitr)
//		{
	
		initialize_aPosteriori1();
	
		initializeExtrinsicInfo11() ;
		
		initializeTransInfo11_12() ;

		checkNodeComputeEngine11 ();
		
		write_uint8("trans_info11_12_calulation_done",1);
			
		uint8_t init_trans_info = read_uint8("trans_info12_11_calulation_done") ;
		
		transverseCorrection11 () ;
		
		send_transverseCorrection11 () ;

		uint8_t aPosteriori_update_phase1_done = read_uint8("aPosteriori1_phase_1_done") ;
		
		update_aPosteriori11() ;
	
		checkIsdecoded1() ;
		
		uint16_t is_decoded_from_2_recieved = read_uint16("is_decoded_from_2") ; 
		
		uint16_t is_decoded = ( is_decoded_1 && is_decoded_from_2_recieved ) ;
		
		write_uint16("is_decoded_d2",is_decoded) ;
		
		
				
/*		if (is_decoded == 1)
			break ;
		else
			updateMessage11( );
		
		nitr_1++ ; 
		
		write_uint8("message11_modified",1);
		uint8_t read_message_21_modified = read_uint8("message21_modified");
		}
		Nitr_required = nitr_1 ;
		send_results() ;
	
#ifdef SW
//fprintf(stderr , "nitr = %d \n ",nitr_1 );
#endif
		*/
	}	
}

void top_daemon_2 ()
{
	while(1)
	{

	uint8_t init_mat = read_uint8("reading_code_block_done");
	
	initialize_aPriori2 ();	
	
	write_uint8("aposteriori2_init",1) ; 
		
	initializeMessage12 ();
	
	write_uint8("message12_initialized",1) ;
	
	uint16_t nitr_2 = 1 ;
	
//	while(nitr_2 < maxNitr)
//	{	
	
		initialize_aPosteriori2();
	
		initializeExtrinsicInfo12() ;
	
		initializeTransInfo12_11() ;
		
		checkNodeComputeEngine12 ();
		


		write_uint8("trans_info12_11_calulation_done",1);
	
			
		uint8_t init_trans_info = read_uint8("trans_info11_12_calulation_done") ;
		
		transverseCorrection12 () ;
		
				send_transverseCorrection12 () ;

	
		uint8_t aPosteriori_update_phase1_done = read_uint8("aPosteriori2_phase_1_done") ;
		
		update_aPosteriori12() ;
				
		checkIsdecoded2( ) ;
		
		write_uint16("is_decoded_from_2",is_decoded_2) ;
		
		uint16_t is_decoded = read_uint16("is_decoded_d2");
		
		write_uint16("is_decoded_d3",is_decoded) ;
		
/*		if (is_decoded == 1)
			break ;
		else
			updateMessage12( );
		
		nitr_2++ ;  
		
		write_uint8("message12_modified",1);
	
		uint8_t read_message_22_modified = read_uint8("message22_modified");
		
	}
	*/
	}
}

void daemon_3 ()
{
	while(1)
	{
	uint8_t init_aPriori1 = read_uint8("message11_initialized") ;
	 
	initializeMessage21 ();

	
//	write_uint8("message21_initialized",1) ;

	uint16_t nitr_3 = 1 ;
		
//		while(nitr_3 < maxNitr)
//		{
		initializeExtrinsicInfo21() ;
	
		initializeTransInfo21_22() ;	
    
		checkNodeComputeEngine21 ();
	
		write_uint8("trans_info21_22_calulation_done",1);
		
		
		uint8_t trans_info_computed = read_uint8("trans_info22_21_calulation_done");
		
		transverseCorrection21 () ;
		
		send_transverseCorrection21 () ;

		update_aPosteriori21() ;
		
		write_uint8("aPosteriori1_phase_1_done",1) ;
		
		uint16_t is_decoded = read_uint16("is_decoded_d3");
		
		write_uint16("is_decoded_d4",is_decoded) ;
		
/*		if (is_decoded ==1 )
			break ;
		else
			updateMessage21( );
			
		nitr_3++ ; 
		
		write_uint8("message21_modified",1);
		
		uint8_t read_message11_modified = read_uint8("message11_modified");
		}
*/
	}
}

void daemon_4 ()
{
	while(1)
	{
	uint8_t init_aPriori2 = read_uint8("message12_initialized") ;
	
	initializeMessage22 ();
	
	//send_message() ;
	
	uint16_t nitr_4 = 1 ;
		
//	while(nitr_4 < maxNitr)
//		{
		initializeExtrinsicInfo22() ;
	
		initializeTransInfo22_21() ;

		checkNodeComputeEngine22();
		
		write_uint8("trans_info22_21_calulation_done",1);
		
		uint8_t trans_info_computed = read_uint8("trans_info21_22_calulation_done");
		
		transverseCorrection22 () ;
		
				send_transverseCorrection22 () ;
		
		update_aPosteriori22() ;
		
		write_uint8("aPosteriori2_phase_1_done",1) ;
		
		uint16_t is_decoded = read_uint16("is_decoded_d4");
		

		send_message() ;	
		send_tens_info11_12() ;
		send_tens_info12_11() ;
		send_tens_info21_22() ;
		send_tens_info22_21() ;
		
		
			
		send_aPosteriori() ; 
				
/*		if (is_decoded ==1 )
			break ;
		else
			updateMessage22( );
	
		nitr_4++ ;  
		
		write_uint8("message22_modified",1);
		
		uint8_t read_message12_modified = read_uint8("message12_modified");
		
		
		}
*/		
		
	}
}
