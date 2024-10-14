Absolute-Loader

Implementation of an Absolute loader in C.

In computer systems a loader is the part of an operating system that is responsible for loading programs and libraries. It is one of the essential stages in the process of starting a program, as it places programs into memory and prepares them for execution. Loading a program involves reading the contents of the executable containing the program instructions into memory, and then carrying out other required preparatory tasks to prepare the executable for running. Once loading is complete, the operating system starts the program by passing control to the loaded program code. All operating systems that support program loading have loaders, apart from highly specialized computer systems that only have a fixed set of specialized programs. Embedded systems typically do not have loaders, and instead, the code executes directly from ROM. In order to load the operating system itself, as part of booting, a specialized boot loader is used. In many operating systems, the loader resides permanently in memory, though some operating systems that support virtual memory may allow the loader to be located in a region of memory that is pageable. In the case of operating systems that support virtual memory, the loader may not actually copy the contents of executable files into memory, but rather may simply declare to the virtual memory subsystem that there is a mapping between a region of memory allocated to contain the running program's code and the contents of the associated executable file.

#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>

		

void main()
{
  FILE *fp;
  int i,addr1,l,j,staddr1;
  char name[10],line[50],name1[10],addr[10],rec[10],ch,staddr[10];
  printf("enter program name:" );
  scanf("%s",name);
  fp=fopen("abssrc.txt","r");
  fscanf(fp,"%s",line);
  for(i=2,j=0;i<8,j<6;i++,j++)
    name1[j]=line[i];
    name1[j]='\0';
  printf("name from obj. %s\n",name1);
  if(strcmp(name,name1)==0)
   {
    do
    {
    fscanf(fp,"%s",line);
    if(line[0]=='T')
    {
    for(i=2,j=0;i<8,j<6;i++,j++)
    staddr[j]=line[i];
    staddr[j]='\0';
    staddr1=atoi(staddr);
    i=12;
    while(line[i]!='$')
    {
      if(line[i]!='^')
      {
        printf("00%d \t %c%c\n", staddr1,line[i],line[i+1]);
        staddr1++;
        i=i+2;
      }
      else i++;
    }
    }
    else if(line[0]='E')
    fclose(fp);
    }while(!feof(fp));
    }
    
getch();
}

