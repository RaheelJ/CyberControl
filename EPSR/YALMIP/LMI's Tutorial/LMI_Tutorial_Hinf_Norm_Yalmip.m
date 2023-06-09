
A = [-4 -3 0 -1; -3 -7 0 -3; 0 0 -13 -1; -1 -3 -1 -10];
B = [0; -4; 2; 5];
C = [0 0 4 0];
D = 0;

yalmip('clear')

% Declare variables
gam = sdpvar(1);
P = sdpvar(4);

% Specify LMIs
LMI = [[A*P+P*A' P*B C'; B'*P -gam D'; C D -gam] < 0, P > 0];

% Solve
options = sdpsettings('solver','lmilab');
sol = solvesdp(LMI, gam, options)

% Extrace variable
double(gam)


norm(ss(A,B,C,D),'inf')
