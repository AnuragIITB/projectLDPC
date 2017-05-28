//#include <stduint8_t.h>

#define CHECK_BIT_COUNT1   ( pm_p->ncol_ind - ( pm_p->row_ptr[row] -1 ) )
#define CHECK_BIT_COUNT2   ( pm_p->row_ptr[row + 1] ) - ( pm_p->row_ptr[row]  )

typedef struct ParityCheckMatrix 
{
	uint16_t  nrows;				// range 32k
	uint16_t  ncols;				// range 32k -- maximus order of input matrix
	uint16_t  ncol_ind;		// range 64k
	uint16_t* col_ind;
	uint16_t* row_ptr;
} ParityCheckMatrix ;


//
// reading the input parity check matrix in structure
void readMatrix( ParityCheckMatrix* pm_p , uint16_t* mem) ;

//
//
void initMem( uint16_t* mem ) ;

//
//
void initInputs(); 

//
// reading code block to decode
void readCodeBlock ( ParityCheckMatrix* pm_p, float* code_block);

//
//
// Min sum algorithm to decode the code block	:
void minSumDecode( uint16_t max_nitr, ParityCheckMatrix* pm_p11, ParityCheckMatrix* pm_p12,\
								ParityCheckMatrix* pm_p21, ParityCheckMatrix* pm_p22,\
								float* code_block1,\
								float* code_block2,\
								float ebbyNodb);
								


//
//	function to update the bit node information (message) according to a posteriori probability and extrinsic information.
void updateMessage ( ParityCheckMatrix* pm_p, float* ext_info, float* aPosteriori, float* message ) ;



//
//
void transverseCorrection ( ParityCheckMatrix* pm_p, float* transverse_info , float* ext_info, float* aPosteriori) ;

//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
void initializeMessage ( ParityCheckMatrix* pm_p, float* aPriori, float* message );

//
// initialize a posteriori probability by a priori probabilities.
void initialize_aPosteriori ( ParityCheckMatrix* pm_p, float* aPriori, float* aPosteriori );

//
// initialize extrinsic inforamtion for every iteration to zero.
void initializeExtrinsicInfo ( ParityCheckMatrix* pm_p, float* ext_info );

//
// initializing apriori probabilities
void initialize_aPriori ( ParityCheckMatrix* pm_p, float* code_block , float ebbyNodb , float* aPriori);

//
// transverse information is calculated by taking calculating min sum at a check node.
// thus for first bit node corrosponding to a check node ie at col = 0 
// we initialize the transverse info of check node i to the message passed from check i to col = 0
// the finally extrinsic inforamtion is applied to the self inforamtion to get transverse inforamtion for a check node

float modifyInfo (float ext_info , float self_information );

//
//
void initializeTransverseInfo ( ParityCheckMatrix* pm_p, float* transverse_info );

//
void	update_aPosteriori ( ParityCheckMatrix* pm_p, float* ext_info , float* aPosteriori );

//

float absf( float f);


//
////
// Function to modify code block and check if the new code block satisfies all parity checks	:
// it modifies the code block according to a posteriori probabilities.
// return the decode status of the code block.
void checkIsdecoded( uint16_t pmNcols , float* code_block , float* aPosteriori, uint8_t* is_decoded ) ;

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the bits. 
void checkNodeComputeEngine ( ParityCheckMatrix* pm_p, float* message, float* ext_info, float* transverse_info);
