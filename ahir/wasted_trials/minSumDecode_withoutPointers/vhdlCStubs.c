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
void checkIsdecoded()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call checkIsdecoded ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void checkNodeComputeEngine()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call checkNodeComputeEngine ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void daemon()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call daemon ");
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
void progx_xoptx_xo_storage_initializer_()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call progx_xoptx_xo_storage_initializer_ ");
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
void updateMessage()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call updateMessage ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
