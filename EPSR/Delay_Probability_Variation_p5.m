close all
clear
clc

load('Workspace/Controller_Workspace')

%% Open Loop System
N=500;                  %Total number of samples with period T
T=0.2;                  %Smallest sampling period
Ts=1e-4;                %Continuous time sampling period

sysfd=c2d(sysf, Ts);    %Full system discrete      
Ac=sysfd.a;
Bc=sysfd.b;

tf=0:Ts:(N*T-1);        %Time axis                        
Nf=size(tf);
Nf=Nf(2);

df=zeros(n, Nf);        %System states
init=[zeros(1, 6) 0.5 zeros(1, 6) 0.5 zeros(1, 7)];
df(:, 1)=init';         

for i=1:Nf-1
    df(:, i+1) = Ac*df(:, i);
end

%% Settling Time Calculation
STime_1=settlingtime(df(14, :), tf, 30, 'MidPercentReferenceLevel', 90, 'StateLevels', [0, 0.5], 'Tolerance', 5)
AN=25;

%% Delay Probability Variation
r1=0.55;
r2=0.75;
r3=0.85;
r4=0.95;
r5=1;

%% Closed loop system       
M=round(N/5);           %Total number of real time samples
t=zeros(1, M);          %Measurement instants
t(1)=0;

x=zeros(n, M);          %Samples system states
x(:, 1)=init';

dsys=zeros(n, Nf);      %Continuous system states for proposed control
dsys(:, 1)=init';

xx=zeros(n, Nf);        %Continuous system states for LQG control
xx(:, 1)=init';

x_=zeros(n, N);         %Observer states for proposed control
x_(:, 1)=zeros(n, 1);

xx_=zeros(n, N);        %Observer states for LQG control
xx_(:, 1)=init';

u=zeros(ku, N);         %Input for proposed control
ux=zeros(ku, N);        %Input for LQG control

%% Runtime
for rr=0.1:0.1:0.5
    rr
    r1=0.55-rr;
    r2=0.75-rr;
    r3=0.85-rr;
    r4=0.95-rr;
    
    for ALoop=1:AN
        i=1;                    %Loop variable
        l=1;                    %Sample number of period T
        K=1;                    %Sample number of period Ts
        k=1;                    %Continuous samples vector between period T

        while i<M
            r=rand(1, 1); 
            % j=1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
            if(r<=r1)
                j=1;
                d=0.04*rand(1, 1);                  %Delay               
                u(:, l)=F1*x_(:, l);

                %System response due to delay
                run('Macros/Delayed_Response.m')

                %Normal system reponse
                run('Macros/System_Response.m')

                %Non-uniform sampled system state
                x(:, i+1)=dsys(:, K-1);             
                t(i+1)=t(i)+j*T;

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L1*C*(x(:, i)-x_(:, l));
                l=l+1;

            % j=2
            % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            elseif(r>r1 && r<=r2)
                j=2;
                d=0.04+0.04*rand(1, 1);
                u(:, l)=F1*x_(:, l);

                %System response due to delay
                run('Macros/Delayed_Response.m')

                %Normal system reponse
                run('Macros/System_Response.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L2*C*(x(:, i)-x_(:, l));
                l=l+1;

                %Normal system reponse
                u(:, l)=F2*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Non-uniform sampled system state
                x(:, i+1)=dsys(:, K-1);
                t(i+1)=t(i)+j*T;

            % j=3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
            elseif(r>r2 && r<=r3)
                j=3;
                d=0.08+0.04*rand(1, 1);
                u(:, l)=F1*x_(:, l);

                %System response due to delay
                run('Macros/Delayed_Response.m')

                %Normal system reponse
                run('Macros/System_Response.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L3*C*(x(:, i)-x_(:, l));
                l=l+1;

                %Normal system reponse
                u(:, l)=F2*x_(:, l); 
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Normal system reponse
                u(:, l)=F3*x_(:, l); 
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Non-uniform sampled system state
                x(:, i+1)=dsys(:, K-1);
                t(i+1)=t(i)+j*T;

            % j=4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
            elseif(r>r3 && r<=r4)
                j=4;
                d=0.12+0.04*rand(1, 1);
                u(:, l)=F1*x_(:, l);

                %System response due to delay
                run('Macros/Delayed_Response.m')

                %Normal system reponse
                run('Macros/System_Response.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L4*C*(x(:, i)-x_(:, l));
                l=l+1;

                %Normal system reponse
                u(:, l)=F2*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Normal system reponse
                u(:, l)=F3*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Normal system reponse
                u(:, l)=F4*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Non-uniform sampled system state
                x(:, i+1)=dsys(:, K-1);
                t(i+1)=t(i)+j*T;

            % j=5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
            elseif(r>r4 && r<=r5)
                j=5;
                d=0.16+0.04*rand(1, 1);
                u(:, l)=F1*x_(:, l);

                %System response due to delay
                run('Macros/Delayed_Response.m')

                %Normal system reponse
                run('Macros/System_Response.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L4*C*(x(:, i)-x_(:, l));
                l=l+1;

                %Normal system reponse
                u(:, l)=F2*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Normal system reponse
                u(:, l)=F3*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Normal system reponse
                u(:, l)=F4*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Normal system reponse
                u(:, l)=F5*x_(:, l);
                run('Macros/System_Response_2.m')

                %Observer state updation
                x_(:, l+1)=A*x_(:, l)+B*u(:, l);
                l=l+1;

                %Non-uniform sampled system state
                x(:, i+1)=dsys(:, K-1);
                t(i+1)=t(i)+j*T;
            end

            i=i+1;
        end

        STime_2(ALoop)=settlingtime(dsys(14, :), tf, 30, 'MidPercentReferenceLevel', 90, 'StateLevels', [0, 0.5], 'Tolerance', 5);
    end
    AVG_STime=sum(STime_2)/AN
end



