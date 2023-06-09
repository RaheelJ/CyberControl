close all
clear
clc

load('Workspace/Controller_Workspace')

%% Open Loop System
N=150;                  %Total number of samples with period T
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



%% Closed loop system
M=round(N/3);           %Total number of real time samples
t=zeros(1, M);          %Measurement instants
t(1)=0;

x=zeros(n, M);          %Samples system states
x(:, 1)=init';

dsys=zeros(n, Nf);      %Continuous system states for proposed control
dsys(:, 1)=init';

xx=zeros(n, Nf);        %Continuous system states for LQR control
xx(:, 1)=init';

x_=zeros(n, N);         %Observer states for proposed control
x_(:, 1)=zeros(n, 1);

xx_=zeros(n, N);        %Observer states for LQR control
xx_(:, 1)=zeros(n, 1);

u=zeros(ku, N);         %Input for proposed control
ux=zeros(ku, N);        %Input for LQG control

temp=init';
temp_d=0;

i=1;                    %Loop variable
l=1;                    %Sample number of period T
K=1;                    %Sample number of period Ts
k=1;                    %Continuous samples vector between period T

KK=1;                    %Sample number of period Ts for LQR
kk=1;                    %Continuous samples vector between period T for LQR


%% Runtime 
while i<M
    
    r=rand(1, 1);

    % j=1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
    if(r<=0.45)
        j=1;
        d=0.06*rand(1, 1);                  %Delay 
        
        u(:, l)=F1*x_(:, l);
        run('Macros/Delayed_Response.m')    %System response due to delay
        run('Macros/System_Response.m')     %Normal system response
        x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L1*C*(x(:, i)-x_(:, l));
        
        %Non-uniform sampled system state
        x(:, i+1)=dsys(:, K-1);             
        t(i+1)=t(i)+j*T;
              
        %LQG Control
        run('Macros/LQR_Control.m')
        l=l+1;
        
    % j=2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif(r>0.45 && r<=0.65)
        j=2;
        d=0.06+0.06*rand(1, 1);
        
        u(:, l)=F1*x_(:, l);
        run('Macros/Delayed_Response.m')
        run('Macros/System_Response.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L2*C*(x(:, i)-x_(:, l));
        
        %LQG Control
        run('Macros/LQR_Control.m')        
        l=l+1;
        
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F2*x_(:, l);
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
        
        %Non-uniform sampled system state
        x(:, i+1)=dsys(:, K-1);
        t(i+1)=t(i)+j*T;
        
        
    % j=3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif(r>0.65 && r<=0.75)
        j=3;
        d=0.12+0.06*rand(1, 1);
        
        u(:, l)=F1*x_(:, l);
        run('Macros/Delayed_Response.m')
        run('Macros/System_Response.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L3*C*(x(:, i)-x_(:, l));
        
        %LQG Control
        run('Macros/LQR_Control.m')
        l=l+1;
        
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F2*x_(:, l); 
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
       
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F3*x_(:, l); 
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
        
        %Non-uniform sampled system state
        x(:, i+1)=dsys(:, K-1);
        t(i+1)=t(i)+j*T;
        
    % j=4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif(r>0.75 && r<=0.85)
        j=4;
        d=0.18+0.06*rand(1, 1);
        
        if (d<0.2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            u(:, l)=F1*x_(:, l);
            run('Macros/Delayed_Response.m')
            run('Macros/System_Response.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L4*C*(x(:, i)-x_(:, l));

            %LQG Control
            run('Macros/LQR_Control.m')
            l=l+1;

            %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            u(:, l)=F2*x_(:, l);
            run('Macros/System_Response_2.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l);

            %LQG Control
            r=rand(1, 1);
            run('Macros/LQR_Control.m')
            l=l+1;
        else %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            u(:, l)=F1*x_(:, l);
            temp_d=d;
            d=T;
            run('Macros/Delayed_Response.m')
            run('Macros/System_Response.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l);
            
            %LQG Control
            run('Macros/LQR_Control.m')
            l=l+1;

            %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            d=temp_d-T;
            u(:, l)=F2*x_(:, l);
            run('Macros/Delayed_Response.m')
            run('Macros/System_Response.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L4*C*(x(:, i)-x_(:, l));
            
            %LQG Control
            r=rand(1, 1);
            run('Macros/LQR_Control.m')
            l=l+1;
        end
           
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F3*x_(:, l);
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
       
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F4*x_(:, l);
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
        
        %Non-uniform sampled system state
        x(:, i+1)=dsys(:, K-1);
        t(i+1)=t(i)+j*T;
        
    % j=5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif(r>0.85 && r<=1)
        j=5;
        d=0.24+0.06*rand(1, 1);

        
        if (d<0.2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            u(:, l)=F1*x_(:, l);
            run('Macros/Delayed_Response.m')
            run('Macros/System_Response.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L5*C*(x(:, i)-x_(:, l));

            %LQG Control
            run('Macros/LQR_Control.m')
            l=l+1;

            %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            u(:, l)=F2*x_(:, l);
            run('Macros/System_Response_2.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l);

            %LQG Control
            r=rand(1, 1);
            run('Macros/LQR_Control.m')
            l=l+1;
        else %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            u(:, l)=F1*x_(:, l);
            temp_d=d;
            d=T;
            run('Macros/Delayed_Response.m')
            run('Macros/System_Response.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l);
            
            %LQG Control
            run('Macros/LQR_Control.m')
            l=l+1;

            %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            d=temp_d-T;
            u(:, l)=F2*x_(:, l);
            run('Macros/Delayed_Response.m')
            run('Macros/System_Response.m')
            x_(:, l+1)=A*x_(:, l)+B*u(:, l)+L5*C*(x(:, i)-x_(:, l));
            
            %LQG Control
            r=rand(1, 1);
            run('Macros/LQR_Control.m')
            l=l+1;
        end
        
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F3*x_(:, l);
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
        
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F4*x_(:, l);
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
       
        %Without Sample %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        u(:, l)=F5*x_(:, l);
        run('Macros/System_Response_2.m')
        x_(:, l+1)=A*x_(:, l)+B*u(:, l);
        
        %LQG Control
        r=rand(1, 1);
        run('Macros/LQR_Control.m')
        l=l+1;
        
        %Non-uniform sampled system state
        x(:, i+1)=dsys(:, K-1);
        t(i+1)=t(i)+j*T;
    end
    
    i=i+1;
end


%% Plots

% Rotor angle deviation d_21 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1,'FontSize',20);
xlim(axes1,[0 10]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');
% Create stairs
plot(tf,dsys(7, :),'LineStyle','-.','LineWidth',3,'Color',[1 0 0],'Parent',axes1,...
    'DisplayName','With Proposed Control');
plot(tf,xx(7, :),'LineStyle','-.','LineWidth',3,'Color',[0 1 0],'Parent',axes1,...
    'DisplayName','With LQR Control');
stem(t,x(7, :),'LineWidth',2,'Color',[0 0 0],'Parent',axes1,...
    'DisplayName','Non-uniform samples');
% Create title
ylabel('\delta_{21} (rad)')
xlabel('Time (s)')
title('Rotor Angle response of Machine 2','FontSize',20);
% Create stairs
plot(tf,df(7, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes1,...
    'DisplayName','Without Control');
% Create legend
legend(axes1,'show');

% Rotor angle deviation d_31 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure2 = figure;
% Create axes
axes2 = axes('Parent',figure2,'FontSize',20);
xlim(axes2,[0 10]);
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'all');
% Create stairs
plot(tf,dsys(14, :),'LineStyle','-.','LineWidth',3,'Color',[1 0 0],'Parent',axes2,...
    'DisplayName','With Proposed Control');
plot(tf,xx(14, :),'LineStyle','-.','LineWidth',3,'Color',[0 1 0],'Parent',axes2,...
    'DisplayName','With LQR Control');
stem(t,x(14, :),'LineWidth',2,'Color',[0 0 0],'Parent',axes2,...
    'DisplayName','Non-uniform samples');
% Create title
ylabel('\delta_{31} (rad)')
xlabel('Time (s)')
title('Rotor Angle response of Machine 3','FontSize',20);
% Create stairs
plot(tf,df(14, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes2,...
     'DisplayName','Without Control');
% Create legend
legend(axes2,'show');


% Reactance Xc of TCSC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure5=figure;
axes5 = axes('Parent',figure5,'FontSize',20);
xlim(axes5,[0 10]);
xlabel('Time (s)');
ylabel('X_c (p.u.)');
box(axes5,'on');
grid(axes5,'on');
hold(axes5,'all');
% Create plot
plot(tf,dsys(21, :),'LineStyle','-.','LineWidth',3,'Color',[1 0 0],'Parent',axes5,...
    'DisplayName','With Proposed Control');
plot(tf,xx(21, :),'LineStyle','-.','LineWidth',3,'Color',[0 1 0],'Parent',axes5,...
    'DisplayName','With LQR Control');
% Create title
title('Controlled Reactance of TCSC','FontSize',20);
% Create legend
legend(axes5,'show');

