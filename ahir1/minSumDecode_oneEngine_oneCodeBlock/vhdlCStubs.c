#include <vhdlCStubs.h>
float absf(float f)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call absf ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_float(buffer,f); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float ret_val__ = get_float(buffer,&ss);
return(ret_val__);
}
uint8_t checkIsdecoded()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call checkIsdecoded ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,8); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint8_t ret_val__ = get_uint8_t(buffer,&ss);
return(ret_val__);
}
void checkNodeComputeEngine()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call checkNodeComputeEngine ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void ebbyNo_initializer_in_progx_xoptx_xo()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call ebbyNo_initializer_in_progx_xoptx_xo ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
float fpadd32(float L,float R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpadd32 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_float(buffer,L); ADD_SPACE__(buffer);
append_float(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float ret_val_x_x = get_float(buffer,&ss);
return(ret_val_x_x);
}
double fpadd64(double L,double R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpadd64 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
double fpadd64_inner(double L,double R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpadd64_inner ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
float fpdiv32_inner(float a,float b)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpdiv32_inner ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_float(buffer,a); ADD_SPACE__(buffer);
append_float(buffer,b); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float aByb = get_float(buffer,&ss);
return(aByb);
}
double fpdiv64(double a,double b)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpdiv64 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,a); ADD_SPACE__(buffer);
append_double(buffer,b); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val__ = get_double(buffer,&ss);
return(ret_val__);
}
double fpdiv64_inner(double a,double b)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpdiv64_inner ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,a); ADD_SPACE__(buffer);
append_double(buffer,b); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double aByb = get_double(buffer,&ss);
return(aByb);
}
float fpmul32(float L,float R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpmul32 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_float(buffer,L); ADD_SPACE__(buffer);
append_float(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float ret_val_x_x = get_float(buffer,&ss);
return(ret_val_x_x);
}
double fpmul64(double L,double R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpmul64 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
double fpmul64_inner(double L,double R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpmul64_inner ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
float fpsqrt32(float a)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpsqrt32 ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_float(buffer,a); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float sqrt_a = get_float(buffer,&ss);
return(sqrt_a);
}
double fpsqrt64(double a)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpsqrt64 ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_double(buffer,a); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double sqrt_a = get_double(buffer,&ss);
return(sqrt_a);
}
double fpsqrt64_inner(double a)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpsqrt64_inner ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_double(buffer,a); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double sqrt_a = get_double(buffer,&ss);
return(sqrt_a);
}
float fpsub32(float L,float R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpsub32 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_float(buffer,L); ADD_SPACE__(buffer);
append_float(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float ret_val_x_x = get_float(buffer,&ss);
return(ret_val_x_x);
}
double fpsub64(double L,double R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpsub64 ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
double fpsub64_inner(double L,double R)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpsub64_inner ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
float fpu32(float L,float R,uint8_t OP_ID)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpu32 ");
append_int(buffer,3); ADD_SPACE__(buffer);
append_float(buffer,L); ADD_SPACE__(buffer);
append_float(buffer,R); ADD_SPACE__(buffer);
append_uint8_t(buffer,OP_ID); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
float ret_val_x_x = get_float(buffer,&ss);
return(ret_val_x_x);
}
double fpu64(double L,double R,uint8_t OP_ID)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call fpu64 ");
append_int(buffer,3); ADD_SPACE__(buffer);
append_double(buffer,L); ADD_SPACE__(buffer);
append_double(buffer,R); ADD_SPACE__(buffer);
append_uint8_t(buffer,OP_ID); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double ret_val_x_x = get_double(buffer,&ss);
return(ret_val_x_x);
}
void global_storage_initializer_()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call global_storage_initializer_ ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void initInputs()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call initInputs ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void initMem()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call initMem ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void initializeExtrinsicInfo()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call initializeExtrinsicInfo ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void initializeMessage()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call initializeMessage ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void initialize_aPosteriori()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call initialize_aPosteriori ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void initialize_aPriori()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call initialize_aPriori ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void progx_xoptx_xo_iNtErNal_xx_xstr7_initializer_in_progx_xoptx_xo()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call progx_xoptx_xo_iNtErNal_xx_xstr7_initializer_in_progx_xoptx_xo ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void progx_xoptx_xo_storage_initializer_()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call progx_xoptx_xo_storage_initializer_ ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void rate_initializer_in_progx_xoptx_xo()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call rate_initializer_in_progx_xoptx_xo ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void readCodeBlock()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call readCodeBlock ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
double sqrtDoubleApprox(uint64_t a)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call sqrtDoubleApprox ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_uint64_t(buffer,a); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
double sqrt_approx = get_double(buffer,&ss);
return(sqrt_approx);
}
void top_daemon()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call top_daemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void updateMessage()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call updateMessage ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void update_aPosteriori()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call update_aPosteriori ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
