#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <string.h>

int main (void) {

int mysocket;
int myconnect;
int port;
int start = 0;
int finish = 65535;
char destiny[16];

struct sockaddr_in target;

printf("Digite o IP para realizar o PortScan: ");
fgets(destiny,16,stdin);
destiny[strcspn(destiny, "\n")] = 0;

mysocket = socket(AF_INET,SOCK_STREAM,0);
target.sin_addr.s_addr = inet_addr(destiny);
target.sin_family = AF_INET;

for (port=start;port<finish;port++) {

// Zero define o protcolo IP
mysocket = socket(AF_INET,SOCK_STREAM,0);

target.sin_port = htons(port);

myconnect = connect(mysocket, (struct sockaddr *)&target, sizeof target);

if (myconnect == 0) {

        printf("%d -  Porta Aberta \n", port);
	close(mysocket);
	close(myconnect);

        } else {
		close(mysocket);
		close(myconnect);
       	}
	}
}
