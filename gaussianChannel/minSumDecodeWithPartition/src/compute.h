#ifndef compute_h
#define compute_h

#define CHECK_BIT_COUNT1   ( pm_p->ncol_ind - ( pm_p->row_ptr[row] -1 ) )
#define CHECK_BIT_COUNT2   ( pm_p->row_ptr[row + 1] ) - ( pm_p->row_ptr[row]  )


//
// structure contain the parity check matrix 
//
typedef struct ParityCheckMatrix 
{
	int  nrows;				// range 32k
	int  ncols;				// range 32k -- maximus order of input matrix
	unsigned  ncol_ind;		// range 64k
	int* col_ind;
	int* row_ptr;
} ParityCheckMatrix ;

//
// reads the  parity check matrix
//
int readMatrix (char* matrix_file_name, ParityCheckMatrix* pm_p);

//
// 	reads the code block 
//
int readCodeBlock ( ParityCheckMatrix* pm_p , FILE* in_code , double* code_block);

//
// decode the code block by min sum decode algrithm
//
int minSumDecode ( int max_number_of_iteration , ParityCheckMatrix* pm_p , double* code_block, double EbbyNo );

//
//	check the number of decoding errors.
//
int findAccuracy( ParityCheckMatrix* pm );

//
//	demodulate block after decoding. 
//	encoding scheme -		0 - -1
//							1 - +1
//
void bpskdemodulation( int nbits , double* code_block);

//
//	To check if decoding is complete
//	Uses the principle that if previous aposteriori estimation of all the bits remain unchanged 
//	then all the bits will not flip thus decoding stops.
// 
bool checkIsdecoded( ParityCheckMatrix* pm_p, double* code_block , double* aPosteriori ) ;

//
//	The function updates the information on bit node side after every iteration.
//
void updateMessage ( ParityCheckMatrix* pm_p, double* ext_info, double* aPosteriori, double* message );

//
// The function takes messages from bit nodes and compute extrinsic inforamtion for all the edges
// and a posteriori probabilities for all the code bits. 
//
void checkNodeComputeEngine ( ParityCheckMatrix* pm_p, double* message, double* ext_info, double* aPosteriori);

//
//	the function takes a priori probabilities at bit nodes as a input and initializes the messages passing 
//	through edges, from bit nodes side to check node side.
//
void initializeMessage ( ParityCheckMatrix* pm_p, double* aPriori, double* message );

//
// initialize a posteriori probability by a priori probabilities.
//
void initialize_aPosteriori ( ParityCheckMatrix* pm_p, double* aPriori, double* aPosteriori );

//
// initialize extrinsic inforamtion for every iteration to zero.
//
void initializeExtrinsicInfo ( ParityCheckMatrix* pm_p, double* ext_info );
#endif
