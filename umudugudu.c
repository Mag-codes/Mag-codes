#include<stdio.h>
#include<string.h>

struct Umudugudu
{
    int id[5];
	char nid[16];
    char name[30];
    char age[6];
    char gender[10];
    char occupation[30];
    char isibo[30];
} u;
int main()

{
	login_system();

    int ch;
    printf("\n\n\t*******************************************************\n");
    printf("\t\t*KAZE NEZA MURI SISITEME Y'UMUDUGUDU*\n");
    printf("\t*******************************************************");

    while(1)
    {

        printf("\n\n\t\tHITAMO:");
        printf("\n\n\t[1]KWIYANDIKISHA\t");
        printf("\n\t[2]AMAKURU\t");
        printf("\n\t[3]GUHINDURA\t");
        printf("\n\t[4]SHAKISHA\t");
		printf("\n\t[5]GUSIBA\t");
        printf("\n\t[6]SOHOKA\t\t");
        printf("\n\n\tAMAHITAMO:");
        scanf("%d",&ch);

        switch(ch)
        {

        case 1:
            add();
            break;

        case 2:
            view();
            break;

        case 3:
            edit();
            break;

        case 4:
            search();
            break;

       case 5:
            delete();
            break;

         case 6:
        	system("cls");
            printf("\n\n\t\t...MURAKOZE GUKORESHA IYI SISITEME... \n");
            exit(0);


        default:
            printf("\nWAHISEMO NABI.");
            printf("\nONGERA ");
            getch();
            break;

        }

        //system("cls");

    }
    return 0;

}
//....................................RECORD.....................................
void add( )
{
system("cls");
FILE *ptr;
char anthr = 'Y';
printf("\n\n\t\t*********************************\n");
printf("\t\t* MURAKAZA NEZA MURIYI SISITEME *");
printf("\n\t\t*********************************\n\n");
ptr= fopen("umudugudu.txt","a");
while ( anthr == 'Y'|| anthr=='y' )
{
printf("\tNOMERO Y'INDANGAMUNTU : ");
scanf("%s",u.nid);
printf("\tIZINA : ");
scanf("%s",u.name);
printf("\tGABO/GORE: ");
scanf("%s",u.gender);
printf("\tIMYAKA: ");
scanf("%s",&u.age);
printf("\tAKAZI AKORA: ");
scanf("%s",&u.occupation);
printf("\tISIBO: ");
scanf("%s",u.isibo);
fprintf(ptr,"%s\t%s\t%s\t%s\t%s\t%s\n", u.nid,u.name,u.gender,u.age,u.occupation,u.isibo);
printf ( "\n\tANDIKA UNDI MUNTU...(Y/N) \t\n" ) ;
anthr = getch();
}
fclose(ptr);
}
//................................DISPLAY....................................

view(){
system("cls");
FILE *ptr;
printf("\n\n\t\t***************************\n");
printf("\t\t   * ABATURAGE BOSE *");
printf("\n\t\t***************************\n\n");
ptr=fopen("umudugudu.txt","r");
while(!feof(ptr))
     {
        fscanf(ptr,"%s\t%s\t%s\t%s\t%s\t%s\n",u.nid,u.name,u.gender,u.age,u.occupation,u.isibo);
        printf("\n\t\tNOMERO Y'INDANGAMUNTU NI: %s",u.nid);
        printf("\n\t\tAMAZINA NI: %s",u.name);
        printf("\n\t\tGABO/GORE: %s",u.gender);
        printf("\n\t\tIMYAKA: %s",u.age);
        printf("\n\t\tAKAZI AKORA: %s",u.occupation);
        printf("\n\t\tISIBO: %s",u.isibo);
        printf("\n\n");
     }
     fclose(ptr);
}
//.............................EDIT...................................
void edit() {
    system("cls");
    FILE *ptr, *t;
    char nm[100];
    int a, found = 0;

    ptr = fopen("umudugudu.txt", "r");
    t = fopen("temp.txt", "w");

    printf("\n\n\t\t*******************************\n");
    printf("\t\t* HANO USHOBORA GUHINDURA *\n");
    printf("\t\t*******************************\n\n");
    printf("\n\t\tINJIZA IZINA RYUWO USHAKA GUHINDURA: ");
    scanf("%s", nm);

    while (fscanf(ptr, "%s\t%s\t%s\t%s\t%s\t%s\n", u.nid, u.name, u.gender, u.age, u.occupation, u.isibo) != EOF) {
        if (strcmp(nm, u.name) == 0) {
            found = 1;
            printf("\n\t\tHITAMO ICYO USHAKA GUHINDURA:\n");
            printf("\n\t\t1. NIMERO Y'INDANGAMUNTU");
            printf("\n\t\t2. AMAZINA");
            printf("\n\t\t3. GABO/GORE");
            printf("\n\t\t4. IMYAKA");
            printf("\n\t\t5. AKAZI AKORA");
            printf("\n\t\t6. ISIBO");
            printf("\n\t\tHITAMO: ");
            scanf("%d", &a);

            switch (a) {
                case 1:
                    printf("\n\t\tINJIZA NIMERO Y'INDANGAMUNTU NSHYA: ");
                    scanf("%s", u.nid);
                    break;
                case 2:
                    printf("\n\t\tINJIZA AMAZINA MASHYA: ");
                    scanf("%s", u.name);
                    break;
                case 3:
                    printf("\n\t\tGABO/GORE: ");
                    scanf("%s", u.gender);
                    break;
                case 4:
                    printf("\n\t\tIMYAKA: ");
                    scanf("%s", u.age);
                    break;
                case 5:
                    printf("\n\t\tAKAZI AKORA: ");
                    scanf("%s", u.occupation);
                    break;
                case 6:
                    printf("\n\t\tISIBO: ");
                    scanf("%s", u.isibo);
                    break;
                default:
                    printf("\n\t\t\nWAHISEMO NABI...!!! ONGERA\n");
                    return;
            }
        }
        fprintf(t, "%s\t%s\t%s\t%s\t%s\t%s\n", u.nid, u.name, u.gender, u.age, u.occupation, u.isibo);
    }

    fclose(ptr);
    fclose(t);
    remove("umudugudu.txt");
    rename("temp.txt", "umudugudu.txt");

    if (!found) {
        printf("\n\t\tNTAWURI MURI SISITEME\n");
    }
}
//............................SEARCH......................................
void search()
{
    system("cls");
    FILE* ptr;
    char nm[15];
    int isFound = 0;

    ptr = fopen("umudugudu.txt", "r");
    if (ptr == NULL) {
        printf("\nERROR: Could not open file.\n");
        return;
    }

    printf("\n\n\t\t*******************************\n");
    printf("\t\t* HANO USHOBORA GUSHAKISHA *");
    printf("\n\t\t*******************************\n\n");
    printf("\n\t\tINJIZA IZINA RYUWO USHAKA:");
    scanf("%s", nm);

    while (fscanf(ptr, "%s\t%s\t%s\t%s\t%s\t%s\n", u.nid, u.name, u.gender, u.age, u.occupation, u.isibo) == 6)
    {
        if (strcmp(nm, u.name) == 0) {
            isFound = 1;
            printf("\n\t\tNOMERO Y'INDANGAMUNTU NI: %s", u.nid);
            printf("\n\t\tAMAZINA NI: %s", u.name);
            printf("\n\t\tIMYAKA: %s", u.age);
            printf("\n\t\tGABO/GORE: %s", u.gender);
            printf("\n\t\tAKAZI AKORA: %s", u.occupation);
            printf("\n\t\tISIBO: %s", u.isibo);
            printf("\n\n");
            break;
        }
    }

    if (!isFound) {
        printf("\n\t\tNTAWURI MURI SISITEME\n");
    }

    fclose(ptr);
}
//----------------------DELETE------------------------------------------
void delete()
{
    system("cls");
    FILE *ptr1, *ptr2;
    char nm[15];
    int isFound = 0;

    ptr1 = fopen("umudugudu.txt", "r");
    ptr2 = fopen("temp.txt", "w");

    printf("\n\n\t\t************************************\n");
    printf("\t\t* HANO USHOBORA GUSIBA UMUTURAGE *");
    printf("\n\t\t************************************\n\n");
    printf("\n\t\tINJIZA IZINA RYUWO USHAKA GUSIBA:");
    scanf("%s", nm);

    while (fscanf(ptr1, "%s\t%s\t%s\t%s\t%s\t%s\n", u.nid, u.name, u.gender, u.age, u.occupation, u.isibo) != EOF)
    {
        if (strcmp(nm, u.name) != 0)
        {
            fprintf(ptr2, "%s\t%s\t%s\t%s\t%s\t%s\n", u.nid, u.name, u.gender, u.age, u.occupation, u.isibo);
        }
        else
        {
            isFound = 1;
            printf("\n\t\tGUSIBA BYAKUNZEE....!!!");
        }
    }
    if (!isFound)
    {
        printf("\n\t\tNTAWURI MURI SISITEME");
    }

    fclose(ptr1);
    fclose(ptr2);

    remove("umudugudu.txt");
    rename("temp.txt", "umudugudu.txt");
}
void login_system()
{
	int v=0,t=0;
    char username[10],c=' ';
    char pssword[10],code[10];
    char user[10]="auca";
    char passwords[10]="auca";
    do
{

    printf("\n  **************************  AHO KWINJIRIRA  **************************  ");
    printf(" \n                       AMAZINA UKORESHA:-");
	scanf("%s", &username);
	printf(" \n                       IJAMBO BANGA:-");
	while(t<10)
	{
	    pssword[t]=getch();
	    c=pssword[t];
	    if(c==13) break;
	    else printf("*");
	    t++;
	}
	pssword[t]='\0';

	t=0;

		if(strcmp(username,"auca")==0 && strcmp(pssword,"auca")==0)
	{
	printf("  \n\n\n       MURAKAZA NEZA MURI SISITEME Y'UMUDUGUDU !! ");
	printf("\n\n\n\t\t\t\tKANDA AHO ARIHO HOSE GUKOMEZA...");
	getch();
	break;
	}
	else
	{
		printf("\n        UMWIRONDORO WAKORESHEJE SIWO !! ONGERA UGERAGEZE...");
		v++;

	}
}
	while(v<=2);
	if (v>2)
	{
		printf("\nMWARENGEJE INSHURO ZAGENWE!!!");
		exit(0);

		}
		system("cls");
}

