
clear all; clc;

A = [-1 2; 1 -3];

% Initialize LMI system
setlmis([]);

% Declare variables
P = lmivar(1, [2 1]);

% Specify LMIs
LMI1=newlmi;
lmiterm([-LMI1 1 1 P],1,1);
lmiterm([LMI1 2 2 P],1, A);
lmiterm([LMI1 2 2 P], A',1)

% get the LMI system
LMIsys = getlmis;

% Solve
[tmin, xfeas] = feasp(LMIsys);

% Extract variable
P = dec2mat(LMIsys,xfeas,P)

% Validate results
evals = evallmi(LMIsys, xfeas);
[lhs, rhs]=showlmi(evals,LMI1);
eig(lhs - rhs)


