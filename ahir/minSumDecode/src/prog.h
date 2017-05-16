/*
#define ORDER 16
void Stage1();
void Stage2();
*/

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
// reading the input parity check matrix in structure
void readMatrix( ParityCheckMatrix* pm_p , uint16_t* mem) ;

//
//
void initMem( uint16_t* mem ) ;

//
//
void initInputs() ;
