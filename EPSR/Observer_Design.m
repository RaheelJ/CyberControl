clear
clc
close all

load('Workspace/Model_Workspace.mat')

%% Discretization
n=21;
m=2;
ku=1;
T=0.2;
[sysd, Gd]=c2d(sysf, T, 'zoh');     
A=sysd.a;
B=sysd.b;
C=sysd.c;
D=sysd.d;

%% LMI Variables
yalmip('clear')

P1=sdpvar(n);
P2=sdpvar(n);
P3=sdpvar(n);
P4=sdpvar(n);
P5=sdpvar(n);

S1=sdpvar(n);
S2=sdpvar(n);
S3=sdpvar(n);
S4=sdpvar(n);
S5=sdpvar(n);

L1=sdpvar(n, m);
L2=sdpvar(n, m);
L3=sdpvar(n, m);
L4=sdpvar(n, m);
L5=sdpvar(n, m);

%% LMIs

% Jump from mode 1
LMI1 = blkvar;
LMI1(1,1) = P1;
LMI1(1,2) = (A'-C'*L1');
LMI1(2,2) = S1;

LMI2 = blkvar;
LMI2(1,1) = P1;
LMI2(1,2) = (A^2)'-C'*L2'*A';
LMI2(2,2) = S2;

LMI3 = blkvar;
LMI3(1,1) = P1;
LMI3(1,2) = (A^3)'-C'*L3'*(A^2)';
LMI3(2,2) = S3;

LMI4 = blkvar;
LMI4(1,1) = P1;
LMI4(1,2) = (A^4)'-C'*L4'*(A^3)';
LMI4(2,2) = S4;

LMI5 = blkvar;
LMI5(1,1) = P1;
LMI5(1,2) = (A^5)'-C'*L5'*(A^4)';
LMI5(2,2) = S5;

%Jump from mode 2
LMI6 = blkvar;
LMI6(1,1) = P2;
LMI6(1,2) = A'-C'*L1';
LMI6(2,2) = S1;

LMI7 = blkvar;
LMI7(1,1) = P2;
LMI7(1,2) = (A^2)'-C'*L2'*A';
LMI7(2,2) = S2;

LMI8 = blkvar;
LMI8(1,1) = P2;
LMI8(1,2) = (A^3)'-C'*L3'*(A^2)';
LMI8(2,2) = S3;

LMI9 = blkvar;
LMI9(1,1) = P2;
LMI9(1,2) = (A^4)'-C'*L4'*(A^3)';
LMI9(2,2) = S4;

LMI10 = blkvar;
LMI10(1,1) = P2;
LMI10(1,2) = (A^5)'-C'*L5'*(A^4)';
LMI10(2,2) = S5;

%Jump from mode 3
LMI11 = blkvar;
LMI11(1,1) = P3;
LMI11(1,2) = A'-C'*L1';
LMI11(2,2) = S1;

LMI12 = blkvar;
LMI12(1,1) = P3;
LMI12(1,2) = (A^2)'-C'*L2'*A';
LMI12(2,2) = S2;

LMI13 = blkvar;
LMI13(1,1) = P3;
LMI13(1,2) = (A^3)'-C'*L3'*(A^2)';
LMI13(2,2) = S3;

LMI14 = blkvar;
LMI14(1,1) = P3;
LMI14(1,2) = (A^4)'-C'*L4'*(A^3)';
LMI14(2,2) = S4;

LMI15 = blkvar;
LMI15(1,1) = P3;
LMI15(1,2) = (A^5)'-C'*L5'*(A^4)';
LMI15(2,2) = S5;

%Jump from mode 4
LMI16 = blkvar;
LMI16(1,1) = P4;
LMI16(1,2) = A'-C'*L1';
LMI16(2,2) = S1;

LMI17 = blkvar;
LMI17(1,1) = P4;
LMI17(1,2) = (A^2)'-C'*L2'*A';
LMI17(2,2) = S2;

LMI18 = blkvar;
LMI18(1,1) = P4;
LMI18(1,2) = (A^3)'-C'*L3'*(A^2)';
LMI18(2,2) = S3;

LMI19 = blkvar;
LMI19(1,1) = P4;
LMI19(1,2) = (A^4)'-C'*L4'*(A^3)';
LMI19(2,2) = S4;

LMI20 = blkvar;
LMI20(1,1) = P4;
LMI20(1,2) = (A^5)'-C'*L5'*(A^4)';
LMI20(2,2) = S5;

%Jump from mode 5
LMI21 = blkvar;
LMI21(1,1) = P5;
LMI21(1,2) = A'-C'*L1';
LMI21(2,2) = S1;

LMI22 = blkvar;
LMI22(1,1) = P5;
LMI22(1,2) = (A^2)'-C'*L2'*A';
LMI22(2,2) = S2;

LMI23 = blkvar;
LMI23(1,1) = P5;
LMI23(1,2) = (A^3)'-C'*L3'*(A^2)';
LMI23(2,2) = S3;

LMI24 = blkvar;
LMI24(1,1) = P5;
LMI24(1,2) = (A^4)'-C'*L4'*(A^3)';
LMI24(2,2) = S4;

LMI25 = blkvar;
LMI25(1,1) = P5;
LMI25(1,2) = (A^5)'-C'*L5'*(A^4)';
LMI25(2,2) = S5;

%LMIs for the inverse condition
LMI26 = blkvar;
LMI26(1, 1)=P1;
LMI26(1, 2)=eye(n);
LMI26(2, 2)=S1;

LMI27 = blkvar;
LMI27(1, 1)=P2;
LMI27(1, 2)=eye(n);
LMI27(2, 2)=S2;

LMI28 = blkvar;
LMI28(1, 1)=P3;
LMI28(1, 2)=eye(n);
LMI28(2, 2)=S3;

LMI29 = blkvar;
LMI29(1, 1)=P4;
LMI29(1, 2)=eye(n);
LMI29(2, 2)=S4;

LMI30 = blkvar;
LMI30(1, 1)=P5;
LMI30(1, 2)=eye(n);
LMI30(2, 2)=S5;

%Constraint
LMI = [sdpvar(LMI1) > 0, sdpvar(LMI2) > 0, sdpvar(LMI3) > 0, sdpvar(LMI4)>0, sdpvar(LMI5)>0, sdpvar(LMI6)>0,
       sdpvar(LMI7) > 0, sdpvar(LMI8) > 0, sdpvar(LMI9) > 0, sdpvar(LMI10)>0, sdpvar(LMI11)>0, sdpvar(LMI12)>0,
       sdpvar(LMI13) > 0, sdpvar(LMI14) > 0, sdpvar(LMI15) > 0, sdpvar(LMI16) > 0, sdpvar(LMI17) > 0, sdpvar(LMI18) > 0,
       sdpvar(LMI19) > 0, sdpvar(LMI20) > 0, sdpvar(LMI21) > 0, sdpvar(LMI22) > 0, sdpvar(LMI23) > 0, sdpvar(LMI24) > 0,
       sdpvar(LMI25) > 0, sdpvar(LMI26) > 0, sdpvar(LMI27) > 0, sdpvar(LMI28) > 0, sdpvar(LMI29) > 0, sdpvar(LMI30) > 0] ;

% Solve
options = sdpsettings('solver','sdpt3');
optimize(LMI, [], options)
ob=zeros(1, 10);
for i=1:10
    
    P1o = double(P1);
    P2o = double(P2);
    P3o = double(P3);
    P4o = double(P4);
    P5o = double(P5);
    S1o = double(S1);
    S2o = double(S2);
    S3o = double(S3);
    S4o = double(S4);
    S5o = double(S5);
    
    obj=trace(S1o*P1+P1o*S1)+trace(S2o*P2+P2o*S2)+trace(S3o*P3+P3o*S3)+trace(S4o*P4+P4o*S4)+trace(S5o*P5+P5o*S5);
    optimize(LMI, obj, options)
    ob(i) = double(obj);
    
end

P1 = double(P1);
P2 = double(P2);
P3 = double(P3);
P4 = double(P4);
P5 = double(P5);

S1 = double(S1);
S2 = double(S2);
S3 = double(S3);
S4 = double(S4);
S5 = double(S5);

ob

L1 = double(L1);
L2 = double(L2);
L3 = double(L3);
L4 = double(L4);
L5 = double(L5);

% Absolute eigenvalues
e5=abs(eig(A^5-A^4*L5*C))           % Mode 5 (5T) 
e4=abs(eig(A^4-A^4*L4*C))           % Mode 4 (4T) 
e3=abs(eig(A^3-A^2*L3*C))           % Mode 3 (3T) 
e2=abs(eig(A^2-A*L2*C))             % Mode 2 (2T)
e1=abs(eig(A-L1*C))                 % Mode 1 (T)

L=dlqr(A', C', eye(n), eye(m))';    %LQR observer
e=abs(eig(A-L*C))                   %Corresponding eigenvalues
