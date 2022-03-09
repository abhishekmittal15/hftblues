#include<stdio.h>
#include<stdlib.h>

static int num_packets=0;

int get_packet(){
	
	int packet=rand()%10;

	printf("C: Packet : %d\n",packet);
	num_packets++;
	return packet;
	
}
