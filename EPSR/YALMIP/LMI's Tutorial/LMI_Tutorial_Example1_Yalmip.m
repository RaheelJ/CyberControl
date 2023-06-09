
A = [-1 2; 1 -3];

yalmip('clear')

% Declare variables
P = sdpvar(2,2,'symmetric');

% Specify LMIs
LMI = [-P zeros(2); zeros(2) A'*P + P*A]<0;

% Solve
options = sdpsettings('solver','lmilab');
solvesdp(LMI, [], options)

% Extrace variable
P = double(P)

