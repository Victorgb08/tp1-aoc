#include <stdio.h>
 
int count(int n)
{
    // Casos básicos considerando n>0
    if (n < 3)
        return n;
    if (n >= 3 && n < 10)
       return n-1;
 
    // Cálculo da potência de 10 do número
    int po = 1;
    while (n/po > 9)
        po = po*10;
 
    // Cálculo do algarismo mais significativo
    int ams = n/po;
 
    if (ams != 3)
      // Para 636 (ams=6, po=100) total vai ser 5*count(100 - 1) + 4 + count(36)
      return count(ams)*count(po - 1) + count(ams) + count(n%po);
      // Cálculo dos números que não tem 3 na potência do número (5*80) + os inteiros que
      // são desconsiderados do cálculo anterior(5) + resto do número(26)
  
    else
      // Pega o maior número na potência - 1 (Ex: para 33 -> count(30-1))
      return count(ams*po - 1);
}
 
int main()
{
    int a;
    scanf("%i", &a);
    printf ("%d\n", count(a));
    return 0;
}