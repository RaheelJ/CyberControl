
clear all; clc

A = [-1 1; 0 -1];
B = [10 0 0; 0 10 0];
C = [1 -1];

% alpha = 85;
% beta = 34;
% K = 1;
% 
% sys1=tf([1], [1 beta K*alpha])
% 
% [A, B, C, D] = tf2ss([1], [1 beta K*alpha])
% eig(A)

%[A,B,C,D] = tf2ss(1, [5 1])
% n = 3;
% m = 2;
% p = 2;
% 
% A = (-10)*rand(n,n)
% B = rand(n, m);
% C = rand(p, n);

Xc = lyap(A,B*B')
sqrt(trace(C*Xc*C'))

%sys2 = ltisys('tf',[1], [5 1])
%sys = ltisys('tf',[1], [1 beta K*alpha]);
sys = pck(A,B,C,zeros(1,3));
h2norm(sys)

setlmis([]);

Q = lmivar(1, [2 1]);
%Q = lmivar(1, [1, 1]);

lmiterm([1 1 1 Q],A,1,'s');
lmiterm([1 1 1 0], B*B');

lmiterm([-2 1 1 Q], 1,1)
% lmiterm([-2 1 1 Q], 1,1);
% lmiterm([-2 1 2 P], C,1);
% lmiterm([-2 2 1 P], 1, C');
% lmiterm([-2 2 2 P],1,1);

% get the LMI system
LMIsys = getlmis;

%c = [0; 0; 0; 1; 0; 1];

n = decnbr(LMIsys); 
c = zeros(n,1);

for j=1:n, 
 [Qj] = defcx(LMIsys,j,Q); 
 c(j) = trace(C*Qj*C'); 
end
c
% Solve
[copt, xopt] = mincx(LMIsys, c)

Q = dec2mat(LMIsys, xopt, Q)

sqrt(copt)
