#ifndef __RAND_AND_H
#define __RAND_AND_H

#ifdef __ANDROID__
// android 4.4 cannot locate symbol "rand", use custom method
int myrand(void);
void mysrand(unsigned int seed);
#undef rand
#undef srand
#define rand myrand
#define srand mysrand
#endif

#endif