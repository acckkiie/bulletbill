/***** 14.1  Dijkstra Method ***/
/***** Programmed by M.Hisai and Y.Matano 1995 *****/
#include <stdio.h>
#include<stdlib.h>
#define MAX 20
void dtra();
void init();
void cal();
void output();
void route();
int i,j,n,istart,nm,is,jp,nstep,m[MAX],p[MAX],path[MAX][MAX];
float vmin,d[MAX][MAX],v[MAX],sd[MAX][MAX];
FILE *fp;

main()
{
    if((fp=fopen("dijkstra.dat","r"))==NULL) {
        printf("データファイルがありません。　　\n");
        exit(1);
    }
    fp=fopen("dijkstra.dat","r");
    fscanf(fp,"%d",&n);
    for(i=1;i<=n;i++) {
        for(j=1;j<=n;j++) {
            fscanf(fp,"%f",&d[i][j]);
	        if(d[i][j]==0.0)
                d[i][j]=9000.0;
        }
    }
    fscanf(fp,"%d",&istart);
    fclose(fp);
    fp=fopen("dijkstra_output.dat","w");
    dtra(d);
    fclose(fp);
    printf("dijkstra_output.txtにも出力しました\n");
}

void dtra(dd)
float dd[MAX][MAX];
{
    init();
    nstep=1;
    is=istart;
    output();
    while(nm!=0) {
        nstep++;
        cal(dd);
        output();
    }
    route();
}

void init()
{
    for(j=1;j<=n;j++) {
        v[j]=9000;
        p[j]=0;
    }
    v[istart]=0;
    nm=n-1;
    for(i=1;i<=nm;i++) {
        if(i<istart) m[i]=i;
        else        m[i]=i+1;
    }
}

void cal(dd)
float dd[MAX][MAX];
{
    for(i=1;i<=nm;i++) {
        j=m[i];
        if(dd[is][j]<9000 && v[is]+dd[is][j]<v[j]) {
            v[j]=v[is]+dd[is][j];
  	   p[j]=is;
        }
    }
    vmin=100000.0;
    for(i=1;i<=nm;i++) {
        j=m[i];
        if(v[j]<vmin) {
            vmin=v[j];
            is=j;
        }
    }
    nm+=-1;
    for(i=1;i<=nm;i++) {
        if(m[i]>=is) m[i]=m[i+1];
    }
}

void output()
{
    printf("STEP%2d \n",nstep);					fprintf(fp,"STEP%2d \n",nstep);
    printf("   j       Vj   Pj  \n");			fprintf(fp,"   j       Vj   Pj  \n");
    for(j=1;j<=n;j++) {
        printf("%3d %9.1f %3d \n",j,v[j],p[j]);	fprintf(fp,"%3d %9.1f %3d \n",j,v[j],p[j]);
    }
    printf("M=(");								fprintf(fp,"M=(");
    for(i=1;i<=nm;i++) {
        printf("%2d ",m[i]);					fprintf(fp,"%2d ",m[i]);
    }
    printf(") \n\n");							fprintf(fp,") \n\n");
}

void route()
{
    printf("OPTIMAL SOLUTION \n");				fprintf(fp,"OPTIMAL SOLUTION \n");
    printf("START NODE=%2d \n",istart);			fprintf(fp,"START NODE=%2d \n",istart);
    for(j=1;j<=n;j++) {
        path[istart][j]=p[j];
        sd[istart][j]=v[j];
        if(j!=istart) {
            printf("SHORTEST ROUTE:");			fprintf(fp,"SHORTEST ROUTE:");
            jp=j;
            while(jp!=istart) {
                printf("%2d<--",jp);			fprintf(fp,"%2d<--",jp);
                jp=p[jp];
            }
            printf("%2d        ",jp);			fprintf(fp,"%2d        ",jp);
            printf("DISTANCE=%3.0f  \n",v[j]);	fprintf(fp,"DISTANCE=%3.0f  \n",v[j]);
        }
    }
}
