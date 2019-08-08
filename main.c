#include <stdio.h>

void *func()
{

}

void sig_handler(int signo)
{

}


int main()
{
	int a;
	signal(SIGINT,sig_handler);
	pthread_t tid = 0;
	a = 10
	pthread_create(&tid,NULL,func,NULL);
	return 0;
}
