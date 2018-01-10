#include "Rand_android.h"
#ifdef __ANDROID__

static unsigned myNextRandom = 1;

int myrand(void)
{
    if (myNextRandom == 0) {
        myNextRandom = 123459876;
    }
    unsigned int hi = myNextRandom / 127773;
    unsigned int lo = myNextRandom % 127773;
    unsigned int x = (16807*lo - 2836*hi)&0xFFFFFFFF;
    myNextRandom = x;
    return x;
}

void mysrand(unsigned int seed)
{
	myNextRandom = seed;
}

#endif
