#include "libserialport.h"
int main(int argc, char **argv)
{
    sp_port **list;
    sp_list_ports(&list);
    return 0;
}