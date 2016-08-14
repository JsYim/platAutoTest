#include <stdio.h>
#include <stdlib.h>
char  find_char (char const *source, char const *chars);
int main()
{
    char const *source ="ABCDEF";
    char const *chars ="XRCQEF";
    printf("The input is :\n",find_char(source,chars));
    return 0;
}
char  find_char (char const *source, char const *chars)
{
        while (*source !='\0')
        {
            if (*source++ == *chars)
            {
                return *chars;
            }
            else
                *chars ++;
    }
}

