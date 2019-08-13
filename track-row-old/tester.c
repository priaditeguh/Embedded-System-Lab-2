/*  ----------------------------------- OS Specific Headers           */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

/** ============================================================================
 *  @func   main
 *
 *  @desc   Entry point for the application
 *
 *  @modif  None
 *  ============================================================================
 */

void printBitInt(int value);
void printBits(size_t const size, void const * const ptr);

int main (int argc, char ** argv)
{
  // uint8_t a = 0xFF;
  // uint8_t b = 0x00;
  // uint16_t c = (uint16_t) (a << 8 | b);
  // uint32_t c1 = (uint32_t) (a << 24 | a << 16 | a << 8 | b);
  // uint8_t d = (uint8_t)((c & 0xFF00) >> 8);
  // uint8_t e = (uint8_t)((c & 0x00FF));;
  // uint8_t f = (uint8_t)((c >> 8));;
  // uint8_t g = (uint8_t)((c));;
  // printf("%d\n", a);
  // printf("%d\n", b);
  // printf("%d\n", c);
  // printf("%u\n", c1);
  // // printf("%" PRIu32 "\n",c1);

  // printf("%d\n", d);
  // printf("%d\n", e);
  // printf("%d\n", f);
  // printf("%d\n", g);

  // int a  = 1;
  // printf("%d\n", a);
  // printBitInt(a);

 // int i = 23;
 // unsigned int ui = UINT_MAX;
 // float f = 23.45f;
 // printBits(sizeof(i), &i);
 // printBits(sizeof(ui), &ui);
 // printBits(sizeof(f), &f);
 int a =2;
 // printBits(sizeof(int), &a);
 float b =2;
 // printBits(sizeof(int), &b);

 float c = 12.123;
 int d = *((int*)(&c));
 float e = *((float*)(&d));

 // printBits(sizeof(int), &c);
 // printBits(sizeof(int), &d);
 // printBits(sizeof(int), &e);

 int f = 2;
 int g = 3;
 int h = f << 16 | g;
 printf("%d\n", f);
 printBits(sizeof(int), &f);
 printf("%d\n", g);
 printBits(sizeof(int), &g);
 printf("%d\n", h);
 printBits(sizeof(int), &h);

 int i = h >> 16;
printf("%d\n", i);
 printBits(sizeof(int), &i);
//  int j = (int) h & 0x0000FFFF;
// printf("%d\n", j);
//  printBits(sizeof(int), &j);

 int16_t a1 = 367;
 uint8_t b1 = a1 >> 8;
 uint8_t b2 = a1;

  printBits(sizeof(int16_t), &a1);
  printf("%d\n", a1);
 printBits(sizeof(uint8_t), &b1);
 printf("%d\n", b1);
 printBits(sizeof(uint8_t), &b2);
 printf("%d\n", b2);

 uint16_t c1 = b1 << 8 | b2;
printBits(sizeof(int16_t), &c1);
printf("%d\n", c1);

  float j = 16;
  printBits(sizeof(float), &j);
  uint8_t j1 = (long)j >> 24;
  printBits(sizeof(uint8_t), &j1);
  uint8_t j2 = (long)j >> 16;
  printBits(sizeof(uint8_t), &j2);
  uint8_t j3 = (long)j >> 8;
  printBits(sizeof(uint8_t), &j3);
  uint8_t j4 = (long)j ;
  printBits(sizeof(uint8_t), &j4);

  int o=0;
  printf("%d %d %d", o++, o++, o++);
 return 0 ;
}

void printBitInt(int value){
  unsigned char * desmond = (unsigned char *) & value;
  int i;

  for (i = 0; i < sizeof (double); i++) {
   printf ("%02X ", desmond[i]);
 }
 printf ("\n");
}
void printBits(size_t const size, void const * const ptr)
{
  unsigned char *b = (unsigned char*) ptr;
  unsigned char byte;
  int i, j, k;

  for (i=size-1;i>=0;i--)
  {
    for (j=7;j>=0;j--)
    {
      byte = (b[i] >> j) & 1;
      printf("%u", byte);
      k++;
      if (k%4==0)
        printf(" ");
    }
  }
  puts("");
}
