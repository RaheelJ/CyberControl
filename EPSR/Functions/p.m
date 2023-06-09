function DP=p(d)
D=0:0.01:0.2;
P=[(0.6/4)*ones(1, 4)  (0.1/4)*ones(1, 4) (0.15/4)*ones(1, 4) (0.1/4)*ones(1, 4) (0.05/5)*ones(1, 5)];
DP=P(abs(D-d)<1e-10);
end

        