
A = [-1 -2 1; 3 2 1; 1 -2 -1];
B = [1; 0; 1];
Q = [1 -1 0; -1 -3 -12; 0 -12 -36];

% Initialize LMI system
setlmis([]);

% Declare variables
X = lmivar(1, [3 1]);

% Specify LMIs
LMI1=newlmi;
lmiterm([LMI1 1 1 X],1,A, 's');
lmiterm([LMI1 1 1 0], Q)
lmiterm([LMI1 1 2 X],1,B)
lmiterm([LMI1 2 2 0], -1)

LMI2=newlmi;
lmiterm([LMI2 1 1 X],1,1);


% get the LMI system
LMIsys = getlmis;

c = mat2dec(LMIsys, eye(3));
%options = [1e-5, 0, 0, 0, 0];

% Solve
[copt, xopt] = mincx(LMIsys, c)
X = dec2mat(LMIsys, xopt, X)

% Validate
evals = evallmi(LMIsys, xopt);

[lhs, rhs] = showlmi(evals,1);
eig(lhs - rhs)
