/*
查找source字符串中匹配chars字符串中任何字符的第一个字符
返回一个指向source中第一个匹配所找到位置的指针
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char  const *find_char (char const  *source, char  const*chars);
int main()
{
    char  source[10] = {0};
    char  chars [10] = {0};
    char ch;
    int i=0;

    printf("Input source :");
    for(i=0; i<10; i++)
    {
        ch = getchar();
        if(ch != '\0' && ch != '\n')
            source[i] = ch;
        else
            break;
    }

    printf("Input chars :");
    for(i=0;i<10;i++)
    {
        ch = getchar();
        if(ch != '\0' && ch != '\n')
            chars[i] = ch;
        else
            break;
    }

    printf("The output is : %s\n",find_char(source,chars));
    return 0;
}
char  const *find_char (char  const *source, char const *chars)
{
    char* temp;
    while (*chars  != '\0')
    {
        temp = source;
        while(*temp  != '\0')
        {
            if (*temp == *chars)
            {
                return temp;
            }
            else
                temp ++;
        }
        chars++;
    }
    return NULL ;
}
