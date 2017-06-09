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

// 
	uint8_t start_reading_code_block  = read_uint8("matrix_written");
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
		write_uint8("code_block_written",1);
}
//
//---------------------------------------------------------------------------------------------- 

//
// initializing apriori probabilities
void initialize_aPriori ( )
{

	uint8_t start_initializating_aPriori = read_uint8("code_block_written");
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
		write_uint8("aPriori_written",1);
}
//--------------------------------------------------------------------------------------------------------------------
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
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage ()
{

	uint8_t start_initializing_message = read_uint8("aPriori_written");
	uint16_t* chk_node_bit_p ;  	// pointer points first bit node corrosponding to a check
	uint16_t row = 0 ;
	uint16_t col = 0 ;
		for ( row = 0 ; row < (pm.nrows) ; row++ )
			{
#ifndef SW
			__loop_pipelining_on__(256,2,0);
#endif
			chk_node_bit_p = & ( pm.col_ind[ pm.row_ptr[row]-1 ]) ;
			//
			// itratating to all the check nodes
			uint16_t range ;
			uint16_t index1 = 0;
			uint16_t index2 = 0;
			if ( row == (pm.nrows-1) ) 				
				range = CHECK_BIT_COUNT1 ;
			else
				range = CHECK_BIT_COUNT2 ;
				//
				// true for last check node only.
			for ( col = 0 ; col < range ; col++)
				{
#ifndef SW
			__loop_pipelining_on__(256,2,0);
#endif
				index1 = (pm.row_ptr[row]-1) + col ;
				index2 = (chk_node_bit_p[col]-1) ;
				// iterating through all the bit nodes of the last check node to initialize message.
				message [ index1 ] = aPriori[ index2 ] ;
#ifdef SW
//				fprintf(stderr, "message( %d,%d ) = %f \n", row ,col , message [ (pm.row_ptr[row]-1) + col ]) ;
#endif
				}
				
			}
			write_uint8("message_written",1);
}			
			
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori ( )
{		

while(1)
{
//fprintf(stderr, " initialize_aPosteriori is running \n ");
uint8_t start_initializing_aPosteriori = read_uint8("message_written");
if (start_initializing_aPosteriori )
	{
	uint16_t I;
	for ( I = 0 ; I < pm.ncols ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			aPosteriori[I] = aPriori[I] ;
#ifdef SW
			fprintf(stderr,"aPosteriori[%d] = %f\n",I,aPosteriori[I]);
#endif
			}
		write_uint8("aPosteriori_written",1);	
	}
}

}
//----------------------------------------------------------------------------------------------------------------

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( )
{

while(1)
{
uint8_t start_initializing_ext_info = read_uint8("aPosteriori_written");
uint16_t I;
		for ( I = 0 ; I < pm.ncol_ind ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif
			ext_info[I] = 0;
#ifdef SW
			fprintf(stderr,"ext_info[%d] = %f\n",I,ext_info[I]);
#endif
			}
//			fprintf(stderr,"Ext_info_initialized\n");
			write_uint8("ext_info_written",1);
}
}
//---------------------------------------------------------------------------------------------------------------

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine ()
{
while(1)
{
	uint8_t start_compute_engine = read_uint8("ext_info_written");
							// pointer points first bit node corrosponding to a check
	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t* chk_node_bit_p;
	uint16_t range = 0;
		
	for ( row = 0 ; row < (pm.nrows) ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(63,2,0);
#endif							
		chk_node_bit_p = & ( pm.col_ind[ pm.row_ptr[row]-1 ]) ;
		
		if ( row == ((pm.nrows)-1) )
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
			float sign ; 
			for ( I = 0 ; I < range ; I++)
				{
#ifndef SW
			__loop_pipelining_on__(63,2,0);
#endif			
				uint16_t index = (pm.row_ptr[row]-1) + I ;
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
							val = absf(message[ index]) ; 
							}
						}
					} 
				flag = 1 ;
				}
				sign = (exor == 0)?1.0:-1.0;
				ext_info[ (pm.row_ptr[row]-1) + col ] = val * sign ;
				//printf( "ext_info( %d,%d ) = %lf \t", row ,col , ext_info[ (pm.row_ptr[row]-1) + col ] ) ;
				aPosteriori[chk_node_bit_p[col]-1 ] += ext_info[ (pm.row_ptr[row]-1) + col ] ; 	
			}	
		}		
		write_uint8("computation_done",1);
//		fprintf(stderr, "computation done \n");	
}
}

//-------------------------------------------------------------------------------------------------------------------------
//
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a piosteriori probabilities.
// return the decode status of the code block.
void checkIsdecoded() 
{

while(1)
{											// is_decoded : variable indicated if block is \
	
												// fully decoded or require further iteration0.
	uint8_t start_check_is_decoded = read_uint8("computation_done");
	
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
		write_uint8("is_decoded_done",is_decoded);
//		fprintf(stderr,"check is decoded done \n");
}
}
//-------------------------------------------------------------------------------------------------------------
//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage ()
{		
uint8_t nitr ;
while(1)
	{	
		uint8_t is_decoded =	read_uint8("is_decoded_done");
		nitr++ ;
		if (is_decoded == 1)
			{	
			write_uint8("code_block_decoded",1);
			write_uint8("nitr_required",(nitr-1));
#ifdef SW
			fprintf(stderr, " code block decoded done \n");
#endif
			break ;
			}
		else 
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
				uint16_t range ;
				if ( row == ((pm.nrows)-1) )
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
					message [ (pm.row_ptr[row]-1) + col ] =  \
					aPosteriori[ chk_node_bit_p[col]-1] - 		\
					ext_info [(pm.row_ptr[row]-1) + col] ;
//	printf (" message(%d) = %lf",(pm.row_ptr[row]-1) + col,message [ (pm.row_ptr[row]-1) + col ] );
					}
				}
				write_uint8("message_written",1);
		}
	}
}
//-----------------------------------------------------------------------------------------------------------------


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

	write_uint8("matrix_written",1);

	uint8_t decoding_done = read_uint8("code_block_decoded");
	uint8_t nitr = read_uint8("nitr_required");


#ifdef SW
	fprintf(stderr," number of iteration required = %d \n",(nitr)) ;
	int I;
	for(I = 0; I< (pm.ncols); I++)
		{
		fprintf(stderr,"code_block[%d] = %f \n" , I,code_block[I]);
		}
#endif
	
	write_uint8("stop_the_daemon", 1);		
}

