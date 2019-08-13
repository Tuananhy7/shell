#include"math.h"
#include"stdio.h"
#include"unistd.h"

void func(void vargp)
{
        sleep(1);
        printf("Printing GeeksQuiz from Thread \n");
            printf("sqrt(16) IS %d", sqrt(16));
                return NULL;
}

int main()
{
                pthread_t t;

                pthread_create(&t, NULL, func, NULL);
                pthread_join(t, NULL);

                pthread_exit(NULL);
                puts("hello");
        exit(0);
}

