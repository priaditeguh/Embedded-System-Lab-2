// Author: Hamid Mushtaq
#ifndef UTIL_H
#define UTIL_H

#include   	<sys/time.h>  
#include	<iostream>
#include 	<stdint.h>

class Timer
{
private:
	timeval st;
	timeval et;
	long elapsed;

	inline long getElapsedMicroSecs(void)
	{
		long secs_used   = et.tv_sec - st.tv_sec;                /*  avoid overflow by subtracting first           */
		long micros_used = (secs_used * 1000000) + et.tv_usec - st.tv_usec;
	
		return micros_used;
	}
public:
	Timer() : elapsed(0) {}
	
	inline void start(void) 
	{ 
		gettimeofday(&st, NULL);
	}
	
	inline void stop(void) 
	{ 
		gettimeofday(&et, NULL);
		elapsed += getElapsedMicroSecs();
	}

	inline long getMicroSecs(void) 		{return elapsed;}
	inline long getMilliSecs(void) 		{return elapsed / (long)1e3;}
	inline long getSecs(void) 			{return elapsed / (long)1e6;}
	inline float getMilliSecsF(void)	{return elapsed / 1e3;}
	inline float getSecsF(void) 		{return elapsed / 1e6;}
};

#endif
