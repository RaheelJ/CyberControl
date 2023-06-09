
A = [-1 -2 1; 3 2 1; 1 -2 -1];
B = [1; 0; 1];
Q = [1 -1 0; -1 -3 -12; 0 -12 -36];

yalmip('clear')

% Declare variables
X = sdpvar(3);

% Specify LMIs
LMI = blkvar;

LMI(1,1) = A'*X + X*A + Q;
LMI(1,2) = X*B;
LMI(2,2) = -1;

LMI = [sdpvar(LMI) < 0, X < 0];

Obj = trace(X);

% Solve
options = sdpsettings('solver','lmilab');
solvesdp(LMI, Obj, options)

% Extract variable
Obj = double(Obj)
X = double(X)