%% Something Important

% S_11=phi'*S11*phi;
% S_12=phi'*S11*sigma0+phi'*S12;
% S_13=phi'*S11*sigma1;
% S_21=sigma0'*S11*phi+S21*phi;
% S_22=sigma0'*(S11*sigma0+S12)+S21*sigma0+S22;
% S_23=sigma0'*S11*sigma1+S21*sigma1;
% S_31=sigma1'*S11*phi;
% S_32=sigma1'*S11*sigma0+sigma1'*S12;
% S_33=sigma1'*S11*sigma1;
% S_=[S_11 S_12 S_13; S_21 S_22 S_23; S_31 S_32 S_33];

%% Controller Design

clc
close all

sysf.InputDelay = 0;
sysd=c2d(sysf, 0.2, 'zoh');
A=sysd.a;
B=sysd.b;
C=sysd.c;
D=sysd.d;

n=21;
m=2;
ku=1;

P=[0.7 0.2 0.1];
taw=[0.03 0.06 0.09];

%Q=[blkdiag(0*eye(6), 1, 0*eye(6), 1, 0*eye(7)) zeros(n, ku); zeros(ku, n) eye(ku)];
Q=[eye(n) zeros(n, ku); zeros(ku, n) eye(ku)];
Q22=Q(n+1:n+ku, n+1:n+ku);
S=[eye(n) zeros(n, ku); zeros(ku, n) eye(ku)];

for k=1:150
    for i=1:3
        S_=0;
        for j=1:3
        sysf.InputDelay = taw(j)+taw(i);
        sysd=c2d(sysf, 0.2, 'zoh');

        phi=sysd.a(1:n, 1:n);
        sigma0=sysd.b(1:n, 1:ku);
        sigma1=sysd.a(1:n, n+1:n+ku);

        G=[phi sigma0 sigma1; zeros(ku, n) eye(ku) zeros(ku, ku)];
        S_=S_+P(j)*G'*S*G;
        end
       
        if(i==1)
            SS=0;
        end
        
        S_21=S_(n+1:n+ku, 1:n);
        S_22=S_(n+1:n+ku, n+1:n+ku);
        S_23=S_(n+1:n+ku, n+ku+1:n+ku+ku);
        
        L=inv(Q22+S_22)*[S_21 S_23];

        if i==1
            L1=L;
        elseif i==2
            L2=L;
        else
            L3=L;
        end
        
        F1=[eye(n) zeros(n, ku); -L];
        F2=[eye(n) zeros(n, ku); -L ;zeros(ku, n) eye(ku)];
        
        SS=SS+P(i)*(F1'*Q*F1+F2'*S_*F2);
    end
    S=SS
end


%% Observer Design
R1=1e-6*eye(n);             %Actuator Noise
R2=(0.01^2)*eye(m);         %Sensor Noise
P0=zeros(n,n);

for i=1:500
    P1=phi*P0*phi'+R1-phi*P0*C'*inv(C*P0*C'+R2)*C*P0*phi';
    K=phi*P1*C'*inv(C*P1*C'+R2);
    K_=P1*C'*inv(C*P1*C'+R2);
%     P2=P1-K_*C*P1;
%     P0=P2;
    P0=P1;
    K'
end
L=K;
L_=K_;  

R3=1e-6*eye(ku);
G=ones(n, ku);
H=ones(m, ku);
sysk=ss(A, [B G], C, [D H], 0.1);


Fl=dlqr(A, B, eye(n), eye(ku));
[Kest, Ll, P, Ml, Z]=kalman(sysk, R3, R2);
