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
	pthread_t tid;
	signal(SIGINT,sig_handler);
	a = 10;
	pthread_create(&tid,NULL,func,NULL);
	sleep(1);
	return 0;
}
