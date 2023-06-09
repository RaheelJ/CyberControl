clear
clc
close all
load('Workspace/Observer_Workspace')

n=21;
Ac=sysf.a;
Bc=sysf.b;
A=sysd.a;
B=sysd.b;

%% Parameters 
T=0.2;
N=10;
Dmax=0.2;
D=zeros(1, N+1);
D(N+1)=Dmax;
Delta=1e-2;
delta_t=1e-4;
delta_d=0.01;    

for i=N                                         %Total number of boundaries
    for j=1:i-1                                 %Current boundary
        f=0;
        fmin=1e6;
        D_prev=D(j);
        D_next=D(N+1);
        j
        D
        for d=D_prev+Delta:Delta:D_next-Delta         
            %% Calculation of E[L0] & E[L1]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            min_d=D_prev;
            max_d=d;
            Scale=0;
            E_L0=zeros(n, n);
            E_L1=zeros(n, n);
            for taw=min_d:delta_d:max_d
                L0_temp=zeros(n, n);
                L1_temp=zeros(n, n);
                for t=0:delta_t:T-taw
                    L0_temp=L0_temp+expm(Ac*t)*delta_t;
                end
                for t=0:delta_t:taw
                    L1_temp=L1_temp+expm(Ac*t)*delta_t;
                end
                L0=L0_temp;
                L1=expm(Ac*(j*T-taw))*L1_temp;
                E_L0=E_L0+p(taw)*L0*delta_d;
                E_L1=E_L1+p(taw)*L1*delta_d;
                Scale=Scale+p(taw);
            end
            E_L0=E_L0/Scale;
            E_L1=E_L1/Scale;
                     
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            X0=A^(j-1)*(E_L0*Bc-B);
            X1=E_L1*Bc;
            X=[X1 X0];
            O=norm(X);
            f=O;
            [f d]
            if f-fmin<1e-10
                fmin=f;
                D(j+1)=d;
                Df=D;
            end
        end     
    end
end
D
    