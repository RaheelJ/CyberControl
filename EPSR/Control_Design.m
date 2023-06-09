clear
clc 
close all

load('Workspace/Model_Workspace.mat')
load('Workspace/Observer_Workspace.mat')

%Probabilities
p1=0.55;
p2=0.2;
p3=0.1;
p4=0.1;
p5=0.05;

%j=1;
A1=[A zeros(n, 4*n); eye(4*n) zeros(4*n, n)];
B1=[B zeros(n, 4*ku); zeros(4*n, 5*ku)];

%j=2;
A2=[zeros(n, n) A^2 zeros(n, 3*n); eye(4*n) zeros(4*n, n)];
B2=[B A*B zeros(n, 3*ku); zeros(4*n, 5*ku)];

%j=3;
A3=[zeros(n, 2*n) A^3 zeros(n, 2*n); eye(4*n) zeros(4*n, n)];
B3=[B A*B A^2*B zeros(n, 2*ku); zeros(4*n, 5*ku)];

%j=4;
A4=[zeros(n, 3*n) A^4 zeros(n, n); eye(4*n) zeros(4*n, n)];
B4=[B A*B A^2*B A^3*B zeros(n, ku); zeros(4*n, 5*ku)];

%j=5;
A5=[zeros(n, 4*n) A^5; eye(4*n) zeros(4*n, n)];
B5=[B A*B A^2*B A^3*B A^4*B; zeros(4*n, 5*ku)];

%LMI Variables
yalmip('clear')

x1=sdpvar(ku, n);
x2=sdpvar(ku, n);
x3=sdpvar(ku, n);
x4=sdpvar(ku, n);
x5=sdpvar(ku, n);

X11=blkdiag(x1, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X12=blkdiag(x1, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X13=blkdiag(x1, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X14=blkdiag(x1, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X15=blkdiag(x1, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));

X21=blkdiag(x2, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X22=blkdiag(x2, x1, zeros(ku, n), zeros(ku, n), zeros(ku, n));
X23=blkdiag(x2, x1, zeros(ku, n), zeros(ku, n), zeros(ku, n));
X24=blkdiag(x2, x1, zeros(ku, n), zeros(ku, n), zeros(ku, n));
X25=blkdiag(x2, x1, zeros(ku, n), zeros(ku, n), zeros(ku, n));

X31=blkdiag(x3, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X32=blkdiag(x3, x2, zeros(ku, n), zeros(ku, n), zeros(ku, n));
X33=blkdiag(x3, x2, x1, zeros(ku, n), zeros(ku, n));
X34=blkdiag(x3, x2, x1, zeros(ku, n), zeros(ku, n));
X35=blkdiag(x3, x2, x1, zeros(ku, n), zeros(ku, n));

X41=blkdiag(x4, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X42=blkdiag(x4, x3, zeros(ku, n), zeros(ku, n), zeros(ku, n));
X43=blkdiag(x4, x3, x2, zeros(ku, n), zeros(ku, n));
X44=blkdiag(x4, x3, x2, x1, zeros(ku, n));
X45=blkdiag(x4, x3, x2, x1, zeros(ku, n));

X51=blkdiag(x5, zeros(ku, n), zeros(ku, n), zeros(ku, n), zeros(ku, n));
X52=blkdiag(x5, x4, zeros(ku, n), zeros(ku, n), zeros(ku, n));
X53=blkdiag(x5, x4, x3, zeros(ku, n), zeros(ku, n));
X54=blkdiag(x5, x4, x3, x2, zeros(ku, n));
X55=blkdiag(x5, x4, x3, x2, x1);

s=sdpvar(n);

S1=blkdiag(s, zeros(4*n, 4*n));
S2=blkdiag(s, s, zeros(3*n, 3*n));
S3=blkdiag(s, s, s, zeros(2*n, 2*n));
S4=blkdiag(s, s, s, s, zeros(n, n));
S5=blkdiag(s, s, s, s, s);

%LMIs
LMI1=blkvar;
LMI1(1, 1)=S1;
LMI1(1, 2)=S1*A1'+X11'*B1';
LMI1(1, 3)=S1*A2'+X21'*B2';
LMI1(1, 4)=S1*A3'+X31'*B3';
LMI1(1, 5)=S1*A4'+X41'*B4';
LMI1(1, 6)=S1*A5'+X51'*B5';
LMI1(2, 2)=inv(p1)*S1;
LMI1(2, 3)=zeros(5*n, 5*n);
LMI1(2, 4)=zeros(5*n, 5*n);
LMI1(2, 5)=zeros(5*n, 5*n);
LMI1(2, 6)=zeros(5*n, 5*n);
LMI1(3, 3)=inv(p2)*S2;
LMI1(3, 4)=zeros(5*n, 5*n);
LMI1(3, 5)=zeros(5*n, 5*n);
LMI1(3, 6)=zeros(5*n, 5*n);
LMI1(4, 4)=inv(p3)*S3;
LMI1(4, 5)=zeros(5*n, 5*n);
LMI1(4, 6)=zeros(5*n, 5*n);
LMI1(5, 5)=inv(p4)*S4;
LMI1(5, 6)=zeros(5*n, 5*n);
LMI1(6, 6)=inv(p5)*S5;


LMI2=blkvar;
LMI2(1, 1)=S2;
LMI2(1, 2)=S2*A1'+X12'*B1';
LMI2(1, 3)=S2*A2'+X22'*B2';
LMI2(1, 4)=S2*A3'+X32'*B3';
LMI2(1, 5)=S2*A4'+X42'*B4';
LMI2(1, 6)=S2*A5'+X52'*B5';
LMI2(2, 2)=inv(p1)*S1;
LMI2(2, 3)=zeros(5*n, 5*n);
LMI2(2, 4)=zeros(5*n, 5*n);
LMI2(2, 5)=zeros(5*n, 5*n);
LMI2(2, 6)=zeros(5*n, 5*n);
LMI2(3, 3)=inv(p2)*S2;
LMI2(3, 4)=zeros(5*n, 5*n);
LMI2(3, 5)=zeros(5*n, 5*n);
LMI2(3, 6)=zeros(5*n, 5*n);
LMI2(4, 4)=inv(p3)*S3;
LMI2(4, 5)=zeros(5*n, 5*n);
LMI2(4, 6)=zeros(5*n, 5*n);
LMI2(5, 5)=inv(p4)*S4;
LMI2(5, 6)=zeros(5*n, 5*n);
LMI2(6, 6)=inv(p5)*S5;

LMI3=blkvar;
LMI3(1, 1)=S3;
LMI3(1, 2)=S3*A1'+X13'*B1';
LMI3(1, 3)=S3*A2'+X23'*B2';
LMI3(1, 4)=S3*A3'+X33'*B3';
LMI3(1, 5)=S3*A4'+X43'*B4';
LMI3(1, 6)=S3*A5'+X53'*B5';
LMI3(2, 2)=inv(p1)*S1;
LMI3(2, 3)=zeros(5*n, 5*n);
LMI3(2, 4)=zeros(5*n, 5*n);
LMI3(2, 5)=zeros(5*n, 5*n);
LMI3(2, 6)=zeros(5*n, 5*n);
LMI3(3, 3)=inv(p2)*S2;
LMI3(3, 4)=zeros(5*n, 5*n);
LMI3(3, 5)=zeros(5*n, 5*n);
LMI3(3, 6)=zeros(5*n, 5*n);
LMI3(4, 4)=inv(p3)*S3;
LMI3(4, 5)=zeros(5*n, 5*n);
LMI3(4, 6)=zeros(5*n, 5*n);
LMI3(5, 5)=inv(p4)*S4;
LMI3(5, 6)=zeros(5*n, 5*n);
LMI3(6, 6)=inv(p5)*S5;

LMI4=blkvar;
LMI4(1, 1)=S4;
LMI4(1, 2)=S4*A1'+X14'*B1';
LMI4(1, 3)=S4*A2'+X24'*B2';
LMI4(1, 4)=S4*A3'+X34'*B3';
LMI4(1, 5)=S4*A4'+X44'*B4';
LMI4(1, 6)=S4*A5'+X54'*B5';
LMI4(2, 2)=inv(p1)*S1;
LMI4(2, 3)=zeros(5*n, 5*n);
LMI4(2, 4)=zeros(5*n, 5*n);
LMI4(2, 5)=zeros(5*n, 5*n);
LMI4(2, 6)=zeros(5*n, 5*n);
LMI4(3, 3)=inv(p2)*S2;
LMI4(3, 4)=zeros(5*n, 5*n);
LMI4(3, 5)=zeros(5*n, 5*n);
LMI4(3, 6)=zeros(5*n, 5*n);
LMI4(4, 4)=inv(p3)*S3;
LMI4(4, 5)=zeros(5*n, 5*n);
LMI4(4, 6)=zeros(5*n, 5*n);
LMI4(5, 5)=inv(p4)*S4;
LMI4(5, 6)=zeros(5*n, 5*n);
LMI4(6, 6)=inv(p5)*S5;

LMI5=blkvar;
LMI5(1, 1)=S5;
LMI5(1, 2)=S5*A1'+X15'*B1';
LMI5(1, 3)=S5*A2'+X25'*B2';
LMI5(1, 4)=S5*A3'+X35'*B3';
LMI5(1, 5)=S5*A4'+X45'*B4';
LMI5(1, 6)=S5*A5'+X55'*B5';
LMI5(2, 2)=inv(p1)*S1;
LMI5(2, 3)=zeros(5*n, 5*n);
LMI5(2, 4)=zeros(5*n, 5*n);
LMI5(2, 5)=zeros(5*n, 5*n);
LMI5(2, 6)=zeros(5*n, 5*n);
LMI5(3, 3)=inv(p2)*S2;
LMI5(3, 4)=zeros(5*n, 5*n);
LMI5(3, 5)=zeros(5*n, 5*n);
LMI5(3, 6)=zeros(5*n, 5*n);
LMI5(4, 4)=inv(p3)*S3;
LMI5(4, 5)=zeros(5*n, 5*n);
LMI5(4, 6)=zeros(5*n, 5*n);
LMI5(5, 5)=inv(p4)*S4;
LMI5(5, 6)=zeros(5*n, 5*n);
LMI5(6, 6)=inv(p5)*S5;

LMI = [sdpvar(LMI1)>0, sdpvar(LMI2)>0, sdpvar(LMI3)>0, sdpvar(LMI4)>0, sdpvar(LMI5)>0,
       s>0];

% Solve
options = sdpsettings('solver','sdpt3');
optimize(LMI, [], options)

%% Extract variable
s1= double(s);
s2= double(s);
s3= double(s);
s4= double(s);
s5= double(s);

x1= double(x1);
x2= double(x2);
x3= double(x3);
x4= double(x4);
x5= double(x5);

F1= x1*inv(s1);
F2= x2*inv(s2);
F3= x3*inv(s3);
F4= x4*inv(s4);
F5= x5*inv(s5);

e5=abs(eig([B*F5 A*B*F4 A^2*B*F3 A^3*B*F2 A^5+A^4*B*F1; eye(4*n) zeros(4*n, n)]))
e4=abs(eig([B*F4 A*B*F3 A^2*B*F2 A^4+A^3*B*F1 ; eye(3*n) zeros(3*n, n)]))
e3=abs(eig([B*F3 A*B*F2 A^3+A^2*B*F1 ; eye(2*n) zeros(2*n, n)]))
e2=abs(eig([B*F2 A^2+A*B*F1; eye(n) zeros(n, n)]))
e1=abs(eig(A+B*F1))

F=dlqr(A, B, eye(n), eye(ku));
e=abs(eig(A-B*F))