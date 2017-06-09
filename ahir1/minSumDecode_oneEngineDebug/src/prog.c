#include <stdlib.h>
#include <stdint.h>
#include <Pipes.h>
#include <stdio.h>
#include "prog.h"

	uint16_t mem[MATRIX_NNZ];
	float code_block[MATRIX_ORDER];
	uint16_t maxNitr    ;
	float   ebbyNo    ; 
	float   rate  		;
	
	float aPriori[MATRIX_ORDER];	
	float message[MATRIX_NNZ] ; 
//	float aPosteriori[MATRIX_ORDER];
//	float ext_info[MATRIX_NNZ];
	uint16_t ncols,nrows,ncol_ind;
	
	

#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
#endif
//-------------------------------------------------------------------------------------------------
//
//




//---------------------------------------------------------------------------


	
void initInputs()
{
	//
	// reading maxinum number of iteration
	uint16_t nitr = read_uint16("maxNitr_in");
	maxNitr = nitr ;
#ifdef SW
//	fprintf(stderr,"Info:read maxNitr = %d\n", nitr);
#endif
	//
	// reading signal to noise power ration
	float SNR = read_float32("ebbyNo_in"); 
	ebbyNo = SNR ;
#ifdef SW
//	fprintf(stderr,"Info:read SNR = %f\n", SNR);
#endif
	//
	// Populating mem with parity check matrix H11
	uint16_t I,val,range;
	for(I = 0; I < 3; I++)
		{
		val = read_uint16("matrix_in");
		mem[I] = val ; 
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val); 
#endif
		}
	nrows = mem[0];
	ncols = mem[1];
	ncol_ind = mem[2] ; 
	range = (mem[2]+mem[0]) ;
	
	for(I = 0; I < range ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
		val = read_uint16("matrix_in");
		mem[I+3] = val ;
#ifdef SW
//		fprintf(stderr,"Info: read data = %d\n",val);
#endif
		} 
	//
	// reading rate of code as input
	float Rate = read_float32("rate_in");
	rate = Rate ;
	//
}
//--------------------------------------------------------------------

//
//---------------------------------------------------------------------------------------

//
// reading code block to decode
void readCodeBlock ()
{
	uint8_t I;	
	for(I = 0; I < ncols; I++)
			{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
			float code_bit = read_float32("code_block_in");
#ifdef SW
//			fprintf(stderr," read code_bit[%d] = %f \n",I,code_bit) ;
#endif
			code_block[I] = code_bit ;
			}
}
//
//---------------------------------------------------------------------------------------------- 

void initialize_aPriori ()
{
	uint16_t I;	
	for ( I = 0 ; I < ncols ; I++ )
		{
#ifndef SW
	__loop_pipelining_on__(16,2,0);
#endif	
		//float StoN = ebbyNo ;
		//float R = rate ;
		//float mul1 = rate * StoN  ;
		//float code_bit = code_block[ I ] ;
		//float val =  mul1 * code_bit ; 
		aPriori[I] = (float) I;
		}
}
//--------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------



/*
//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
inline void initializeMessage ()
{	
	uint16_t index_initMess ;
	uint16_t offset = 3 ;
	uint16_t base_value = 1 ;
	for ( index_initMess = 0 ; index_initMess < ncol_ind ; index_initMess++)
	{
#ifndef SW
	__loop_pipelining_on__(16,2,0);
#endif
	uint16_t temp_1 = mem[ offset + index_initMess ];
	uint16_t temp_2 = temp_1 - base_value;
	float val = aPriori[ base_value ]; 
	//message[I] = 1*aPriori[mem[3+I]-1];
	//message[J] = 1*aPriori[J];
	//val = aPriori[J];
	//message[A] = val;
	//write_uint16("J_out", I);
	//write_float32("message_out", val);	
	}
#ifdef SW
	//fprintf(stderr," message[%d]= aPriori[%d]%f \n ",J,mem[3+J],message[J]);
#endif	
}			
/*		
//-------------------------------------------------------------------------------------------------------------------

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori ( )
{		

	uint16_t I;
	for ( I = 0 ; I < ncols ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
			aPosteriori[I] = aPriori[I] ;
			}
#ifdef SW
	fprintf(stderr," aPosteriori initialized \n");
#endif
	
}
//----------------------------------------------------------------------------------------------------------------
/*
//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( )
{
uint16_t I;
		for ( I = 0 ; I < ncol_ind ; I++)
			{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
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
void checkNodeComputeEngine ()
{

	uint16_t row = 0;
	uint16_t col = 0;
	uint16_t range = 0;
	uint16_t index_2D ;
	uint16_t CHECK_BIT_COUNT1  ;
	uint16_t CHECK_BIT_COUNT2  ;	
	for ( row = 0 ; row < nrows ; row++ )
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif		
		CHECK_BIT_COUNT1   = ( ncol_ind - ( mem[3 + ncol_ind +row] -1 ) ) ;
        CHECK_BIT_COUNT2   = (  mem[3 + ncol_ind +row + 1] ) - (  mem[3 + ncol_ind +row]  ) ;				
		 
		if ( row == (nrows-1) )
			range = CHECK_BIT_COUNT1 ;
		else 
			range = CHECK_BIT_COUNT2 ;	
				
		for ( col = 0 ; col < range ; col++)
			{
#ifndef SW	
			__loop_pipelining_on__(16,2,1);
#endif 			
			// iterating through all the bit nodes corrosponding to a check 
			index_2D = mem[3 + ncol_ind + row] -1 + col ;
			uint16_t I = 0 ;
			float val = 0.0;				// represents magnitude of the extrensic information.
			uint8_t flag = 0 ; 				// represents first iteration through the inner most loop.
			uint8_t exor = 0;				// represents sign of the extrinsic information.
			float sign = 0.0; 
			for ( I = 0 ; I < range ; I++)
				{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
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
							val = absf(message[ index]) ; 
							}
						}  
					} 
				flag = 1 ;
				}
				if (exor == 0) 	sign = 1.0;
				else 			sign = -1.0;
				
				ext_info[ index_2D ] = val * sign ;
//			 	aPosteriori[ index_1D ] += ext_info[ index_2D  ] ; 	
#ifdef SW
//				fprintf(stderr, " ext_info[%d] = %f \n", index_2D , ext_info[index_2D]  ) ;
#endif
				
			}	
		}
		
#ifdef SW
		fprintf(stderr, "computation done \n");	
#endif
}
//-------------------------------------------------------------------------------------------------------------

void update_aPosteriori()
{
        uint16_t I ;
        for ( I = 0 ; I < ncol_ind ; I++)
                {
                aPosteriori[mem[3+I]-1] += ext_info[I] ;
                }
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
uint8_t checkIsdecoded() 
{
		
	uint8_t is_decoded = 1;
	uint16_t I;
	for( I = 0 ; I < ncols ; I++)
		{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
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
void updateMessage ()
{

		uint16_t row,col;
		uint16_t index_2D ;
		uint16_t index_1D ;
		uint16_t CHECK_BIT_COUNT1  ;
		uint16_t CHECK_BIT_COUNT2  ;
		for ( row = 0 ; row < nrows ; row++ )
				{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
				uint16_t range ;
				CHECK_BIT_COUNT1   = ( ncol_ind - ( mem[3 + ncol_ind +row] -1 ) ) ;
        		CHECK_BIT_COUNT2   = (  mem[3 + ncol_ind +row + 1] ) - (  mem[3 + ncol_ind +row]  ) ;
				if ( row == (nrows-1) )
					range = CHECK_BIT_COUNT1 ;
				else
					range = CHECK_BIT_COUNT2 ;
				//
				// true for last check node only.
				for ( col = 0 ; col < range ; col++)
					{
#ifndef SW
			__loop_pipelining_on__(16,2,1);
#endif
					index_2D = mem[3 + ncol_ind + row] -1 + col ;
					index_1D = mem [3 + index_2D] - 1 ;
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


send_output()
{	
		int J ;
		for( J = 0 ; J < nrows+ncol_ind+3 ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif	
		uint16_t val = mem[J];
		write_uint16("mem_out", val);		
		} 
		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif	
		float val = code_block[J];
		write_float32("code_block_out", val);		
		} 
		
		for( J = 0 ; J < ncols ; J++)
		{
#ifndef SW
		__loop_pipelining_on__(16,2,1);
#endif	
		float val = aPriori[J];
		write_float32("aPriori_out", val);		
		} 	
}		

void top_daemon ()
{

while(1)
	{
	
	initInputs() ; 
	
	readCodeBlock();
	
	uint8_t nitr = 1 ;

	initialize_aPriori();
	
	send_output() ;

/*	
	initializeMessage ();
	
		int III ;
		for( III = 0 ; III < ncol_ind ; III++)
		{	
		float val = message[III];
		write_float32("message_out", val);		
		} 		

*/		
/*	
	while(nitr < maxNitr)
		{
	
		initialize_aPosteriori ();
	
		initializeExtrinsicInfo ();
	
		checkNodeComputeEngine ();
		
		update_aPosteriori() ;
		 
		int P = 0 ;

		for ( P = 0 ; P < ncols ; P++)
		{
//		fprintf(stderr,"aPosteriori[%d] = %f \n",P,aPosteriori[P]);
//		write_float32("aPosteriori_out",aPosteriori[P]);
		}
	
		uint8_t is_decoded = checkIsdecoded() ;
//		write_uint8("is_decoded_out",is_decoded);
		
		if (is_decoded)
			break ;
		else
			updateMessage ();
		
		nitr++ ;
		}
		
		

#ifdef SW
	fprintf(stderr," number of iteration required = %d \n",(nitr)) ;
	int I;
	for(I = 0; I < ncols; I++)
		{
//		fprintf(stderr,"code_block[%d] = %f \n" , I,code_block[I]);
		}
#endif
	

	uint16_t K ;
	
	for ( K = 0 ; K < ncols ; K++ )
	{
	write_float32("code_block_out",code_block[K]);
	}	
*/		
	}
}
