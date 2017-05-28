

# define MATRIX_ORDER 13000
# define MATRIX_NNZ   20000

typedef struct ParityCheckMatrix 
{
	uint16_t  nrows;				// range 32k
	uint16_t  ncols;				// range 32k -- maximus order of input matrix
	uint16_t  ncol_ind;		// range 64k
	uint16_t* col_ind;
	uint16_t* row_ptr;
} ParityCheckMatrix ;



void readMatrix( ) ;

void initMem( ) ;

void initInputs(); 

void readCodeBlock ( );

void minSumDecode( uint16_t max_nitr, ParityCheckMatrix* pm_p11, ParityCheckMatrix* pm_p12,\
								ParityCheckMatrix* pm_p21, ParityCheckMatrix* pm_p22,\
								float* code_block1,\
								float* code_block2,\
								float ebbyNodb);
								
void updateMessage ( ) ;

void initializeMessage ( );

void initialize_aPosteriori (  );

void initialize_aPriori ();

float absf(float f);

void checkIsdecoded( ) ;
 
void checkNodeComputeEngine ( );

void daemon () ;
