#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include <math.h>
#include <fpu.h>
#include "prog.h"


#define CHECK_BIT_COUNT1   ( pm.ncol_ind - ( pm.row_ptr[row] -1 ) )
#define CHECK_BIT_COUNT2   ( pm.row_ptr[row + 1] ) - ( pm.row_ptr[row]  )



#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif
//-------------------------------------------------------------------------------------------------
//
//
	uint16_t mem[MATRIX_NNZ];
	uint16_t maxNitr    ;
	float   ebbyNo    ; 
	float code_block[MATRIX_ORDER];
	float aPriori[MATRIX_ORDER];	// aPriori matrix
	float message[MATRIX_NNZ] ; 
	float aPosteriori[MATRIX_ORDER];
	float ext_info[MATRIX_NNZ];
	//
	//
	ParityCheckMatrix pm;	


	
	
void initInputs()
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
	//
	// Populating mem with parity check matrix H11
	initMem() ;
}
//--------------------------------------------------------------------

//
//
void initMem( )
{
uint16_t I,val,range;
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem[I] = val ; 
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
		
	range = (mem[2]+mem[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
		val = read_uint16("matrix_in");
		mem[I+3] = val ;
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val);
#endif
		} 
}

//---------------------------------------------------------------------------

//
// reading the input parity check matrix in structure
void readMatrix() 
{
	uint16_t nrows, ncols ;
	uint16_t ncol_ind ;

	pm.nrows = mem[0];
	pm.ncols = mem[1];
	pm.ncol_ind = mem[2];
	pm.col_ind = &(mem[3]) ;
	pm.row_ptr = &( mem[ (3+mem[2]) ] ) ;

}
//
//---------------------------------------------------------------------------------------

//
// reading code block to decode
void readCodeBlock ()
{
	uint16_t I;	
	for(I = 0; I < (pm.ncols); I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			float code_bit = read_float32("code_block_in");
#ifdef SW
			fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
#endif
			code_block[I] = code_bit ;
			}
}
//
//---------------------------------------------------------------------------------------------- 

/*
// Min sum algorithm to decode the code block	:
void minSumDecode( uint16_t max_nitr, ParityCheckMatrix* pm_p11, ParityCheckMatrix* pm_p12,\
								ParityCheckMatrix* pm_p21, ParityCheckMatrix* pm_p22,\
								float* code_block1,\
								float* code_block2,\
								float ebbyNo)
{


}
*/
//------------------------------------------------------------------------------------------------------

//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a piosteriori probabilities.
// return the decode status of the code block.
uint8_t checkIsdecoded() 
{
											// is_decoded : variable indicated if block is \
												// fully decoded or require further iteration0.
	uint8_t is_decoded = 1;
	uint16_t I;
	for( I = 0 ; I < pm.ncols ; I++)
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
		return (is_decoded) ;
}

//-------------------------------------------------------------------------------------------------------------

//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage ()
{
		uint16_t* chk_node_bit_p;					// pointer points first bit node corrosponding to a check
		uint16_t row,col;
		for ( row = 0 ; row < (pm.nrows) ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
				//
				// iterating through all the check node.
					chk_node_bit_p = & ( pm.col_ind[ pm.row_ptr[row]-1 ]) ;
					if ( row == ((pm.nrows)-1) )
						{
						//
						// true for last check node only.
						for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
							{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
							//
							//	iterating through all the bit nodes of a check node and updating message.
								message [ (pm.row_ptr[row]-1) + col ] =  \
								aPosteriori[ chk_node_bit_p[col]-1] - 		\
								ext_info [(pm.row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm.row_ptr[row]-1) + col,message [ (pm.row_ptr[row]-1) + col ] );
							}
						}
					else 
						{
						//
						// true for all the check nodes except last check node.
						for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
							{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
							//
							//	iterating through all the bit nodes of a check node and updating message.
							message [ (pm.row_ptr[row]-1) + col ] =    \
							aPosteriori[ chk_node_bit_p[col]-1]  -  	  \
							ext_info [(pm.row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm.row_ptr[row]-1) + col,message [ (pm.row_ptr[row]-1) + col ] );
							}
						}
				}
}

//-----------------------------------------------------------------------------------------------------------------

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine ()
{
		uint16_t* chk_node_bit_p;						// pointer points first bit node corrosponding to a check
		uint16_t row,col;
		for ( row = 0 ; row < (pm.nrows) ; row++ )
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			//
		    // iterating through all the check node.						
			chk_node_bit_p = & ( pm.col_ind[ pm.row_ptr[row]-1 ]) ;
			if ( row == ((pm.nrows)-1) )
				{
				//
				// true for last check node only
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					// iterating through all the bit nodes corrosponding to a check 
					uint16_t I1;
					float val1 ;				// represents magnitude of the extrensic information.
					uint8_t flag1 = 0 ; 				// represents first iteration through the inner most loop.
					uint8_t exor1 = 0;				// represents sign of the extrinsic information.
					float sign1 ; 
					for ( I1 = 0 ; I1 < CHECK_BIT_COUNT1 ; I1++)
						{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
						//
						// To calculating extrinsic information for all the edges from a check to all the bit nodes,
		    			// iterating through all the bit nodes corrosponding to a perticular check node.
						if ( I1 == col)
						//
						// skipping the self information .
						continue;
						else
							{
							//
							// finding sign of the extrinsic information 
							if ( message[ (pm.row_ptr[row]-1) + I1] >= 0.0 )
								{
								exor1 = exor1 ^ 0x00 ;
								} 
							else if ( message[ (pm.row_ptr[row]-1) + I1] < 0.0 )
								{
								exor1 = exor1 ^ 0x01 ; 
								}
								
							// finding minimum of the messages to update magnitude of the extrinsic information.
							if (flag1 == 0)
								{
								// 
								// true for first iteration to initialize the magnitude of the extrinsic information.
								val1 = absf(message[ (pm.row_ptr[row]-1) + I1]);
								}
							else
								{
								if ( absf(message[ (pm.row_ptr[row]-1) + I1]) < val1 )
									{
									val1 = absf(message[ (pm.row_ptr[row]-1) + I1]) ; 
									}
								}
							} 
						//
						// update flag to represent that this is not the first iteration to the inner loop.	
						flag1 = 1 ;
						}
					//
					//	if exor = 0	: sign of extrinsic information is positive
					//  if exor = 1 : sign of extrinsic information is negative
					sign1 = (exor1 == 0)?1.0:-1.0;
					//
					//	Evaluating extrinsic information 
					ext_info[ (pm.row_ptr[row]-1) + col ] = val1 * sign1 ;
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm.row_ptr[row]-1) + col ] ) ;
					//
					// Modify a posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm.row_ptr[row]-1) + col ] ; 	
					}
				}
			else
				{
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
					// iterating through all the bit nodes corrosponding to a check 
					uint16_t I;
					float val ;				// represents magnitude of the extrensic information.
					uint8_t flag = 0 ; 				// represents first iteration through the inner most loop.
					uint8_t exor = 0;				// represents sign of the extrinsic information.
					float sign ; 
					for ( I = 0 ; I < CHECK_BIT_COUNT2 ; I++)
						{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
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
							if ( message[ (pm.row_ptr[row]-1) + I] >= 0.0 )
								{
								exor = exor ^ 0x00 ;
								} 
							else if ( message[ (pm.row_ptr[row]-1) + I] < 0.0 )
								{
								exor = exor ^ 0x01 ; 
								}
								
							// finding minimum of the messages to update magnitude of the extrinsic information.
							if (flag == 0)
								{
								// 
								// true for first iteration to initialize the magnitude of the extrinsic information.
								val = absf(message[ (pm.row_ptr[row]-1) + I]);
								}
							else
								{
								if ( absf(message[ (pm.row_ptr[row]-1) + I]) < val )
									{
									val = absf(message[ (pm.row_ptr[row]-1) + I]) ; 
									}
								}
							} 
						//
						// update flag to represent that this is not the first iteration to the inner loop.	
						flag = 1 ;
						}
					//
					//	if exor = 0	: sign of extrinsic information is positive
					//  if exor = 1 : sign of extrinsic information is negative
					if (exor == 0) sign =  1.0;
					else 				sign = -1.0;
					//
					//	Evaluating extrinsic information 
					ext_info[ (pm.row_ptr[row]-1) + col ] = val * sign ;
					//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm.row_ptr[row]-1) + col ] ) ;
					//
					// Modify posteriori	: 	Sum of extrinsic inforamtion from all check nodes to a bit node.
					aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm.row_ptr[row]-1) + col ] ; 	
					}
				}
			}
			
}


//-------------------------------------------------------------------------------------------------------------------------

//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage ( )
{
	uint16_t* chk_node_bit_p;  								// pointer points first bit node corrosponding to a check
	uint16_t row,col;
		for ( row = 0 ; row < (pm.nrows) ; row++ )
			{
#ifndef SW
			__loop_pipelining_on__(256,2,0);
#endif
			chk_node_bit_p = & ( pm.col_ind[ pm.row_ptr[row]-1 ]) ;
			//
			// itratating to all the check nodes
			if ( row == (pm.nrows-1) ) 				
				{
				//
				// true for last check node only.
				for ( col = 0 ; col < CHECK_BIT_COUNT1 ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(256,2,0);
#endif
					// iterating through all the bit nodes of the last check node to initialize message.
				message [ (pm.row_ptr[row]-1) + col ] = aPriori[ (chk_node_bit_p[col]-1)] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm.row_ptr[row]-1) + col ]) ;
					}
				}
			else 
				{
				//
				// true for all check nodes except last check node.
				for ( col = 0 ; col < CHECK_BIT_COUNT2 ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(250,2,0);
#endif
					// iterating through all the bit nodes of the last check node to initialize message.
					message [ (pm.row_ptr[row]-1) + col ] = aPriori[ (chk_node_bit_p[col]-1)] ;
//					printf( "message( %d,%d ) = %lf \t", row ,col , message [ (pm.row_ptr[row]-1) + col ]) ;
					}
				}
			}
}			
			
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori (  )
{		
uint16_t I;
for ( I = 0 ; I < pm.ncols ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			aPosteriori[I] = aPriori[I] ;
			}
}

//----------------------------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( )
{
uint16_t I;
		for ( I = 0 ; I < pm.ncol_ind ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info[I] = 0;
			}
}

//---------------------------------------------------------------------------------------------------------------

//
// initializing apriori probabilities
void initialize_aPriori ( )
{
	uint16_t I;
	
	float sigma2 ;
	
	float rate ;
//	
//	calculating rate of code	:
	rate = (float) ((pm.ncols)-(pm.nrows))/(pm.ncols); 
	
	sigma2 = 1/(2*rate*ebbyNo) ;
	
//	printf(" rate = %lf , ebbyNodb = %lf , ebbyNo = %lf , sigma2 = %lf \n", rate, ebbyNodb, ebbyNo, sigma2);
//
// 	Initializing a priori probabilities	:
	for ( I = 0 ; I < pm.ncols ; I++ )
		{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
		// It has a minus sign in contrast to papers.
		// Reason is :
		//
		// Here BPSK modulation :	0  ->  -1
		// 				1  ->   1
		//
		//
		//aPriori[I] = 4*code_block[I]/(2*sigma2) ;    // for test_matrix 
		aPriori[I] = -4*code_block[I]/(2*sigma2) ; 
#ifdef SW  
		fprintf(stderr," I= %d ,  aPriori[I]=  %lf \n", I , aPriori[I]);
#endif
		}
}
//--------------------------------------------------------------------------------------------------------------------

//
//----------------------------------------------------------------------------------------------------------

float absf( float f)
{
if (f < 0.0)
return (-f);
else
return (f);
}

//
//-----------------------------------------------------------------------------------------------------------

void daemon ()
{
	
	initInputs() ; 

	readMatrix();
	
#ifdef SW
	fprintf(stderr,"Info: pm11.nrow = %d , pm11.ncol = %d , pm11.ncol_ind = %d \n",pm.nrows,pm.ncols,pm.ncol_ind);
#endif

	uint64_t block_count = 0;	
		//
		// keep reading code blocks till they get exhausted.
		//
		//	reading code block 	
		readCodeBlock();
		block_count++;	
		
// decoding block 
//	minSumDecode( maxNitr , & pm11, &pm12, &pm21, &pm22 ,code_block1, code_block2, ebbyNo  );	

	uint16_t nitr = 1;  // initializing number of iterations

//
// initializing apriori probabiliies	
	initialize_aPriori ( );
		
//
// Message initialization:
//
// message contain the soft information transferred from bit nodes towards check nodes. 
// messages are stored in row compressed from similar to parity check matrix.
// thus indexed same as parity check matrix.

	initializeMessage ( );


//
//	After initialization starting iterative decoding	:
	while ( nitr <= maxNitr )
		{
//
// 	Initializing a posteriori probabilities	:
		
		initialize_aPosteriori(  );
//
// 	Intializing the extrinsic inforamtion
		
		initializeExtrinsicInfo (  );
			
//
//	Performing computation on Check nodes	:
		 checkNodeComputeEngine( );
/*								
#ifdef SW
	int I ;	
		for(I = 0 ; I < pm.ncols ; I++)
			{
			fprintf(stderr, " aPosteriori[%d] = %lf \n", I , aPosteriori[I]);
			}
#endif			
*/
//

//	Modifing the code block according to a posteriori probabilities 
//	and checking if the new block satisfies all the parity checks.

		uint8_t is_decoded = 1 ;
		is_decoded = checkIsdecoded() ;
        
		if (is_decoded == 1 )
			{
			// decoding stops.
			break;
			}
		else 
			{
			// else we have to update information on Bit Node side.
			updateMessage();
			}									
		nitr++ ;
		}  // end while
#ifdef SW
	fprintf(stderr," number of iteration required = %d \n",(nitr-1)) ;
	int I;
	for(I = 0; I< (pm.ncols); I++)
		{
		fprintf(stderr,"code_block1[%d] = %f" , I,code_block[I]);
		}
#endif
		write_uint8("stop_the_daemon", 0);
		
}

