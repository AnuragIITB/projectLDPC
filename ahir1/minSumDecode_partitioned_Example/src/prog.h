# define MATRIX_ORDER 512
# define MATRIX_NNZ   512

#define __absf(input,output)		{\
									if (input < 0.0)\
									output = (-input);\
									else\
									output = (input);\
									}
									
#define __modifyInfo(ext_info,self_information,result)  {\
	float sign ;\
	float magnitude ;\
	if ( ext_info >= 0 )\
		{\
		if ( self_information >=0 ) \
		sign = +1.0;				\
		else						\
		sign = -1.0;				\
		}							\
		else \
		{\
		if ( self_information < 0 ) \
		sign = +1.0;				\
		else\
		sign = -1.0;\
		}\
		float mod_ext_info ;\
		float mod_self_info ;\
		__absf( self_information , mod_self_info);\
		__absf( ext_info , mod_ext_info ) ;\
			if ( mod_self_info > mod_ext_info )\
		magnitude = mod_ext_info  ;\
	else\
		magnitude = mod_self_info ;\
   	result = (sign*magnitude) ;\
					}
					
					
void top_daemon_1 () ;
void top_daemon_2 () ;
void daemon_3 () ;
void daemon_4 () ;
