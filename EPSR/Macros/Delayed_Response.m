%System response due to delay
for k=K:1:K+round(d/Ts)-1           
    if(l>1)
        dsys(:, k+1) = Ac*dsys(:, k)+Bc*u(:, l-1);
    else
        dsys(:, k+1) = Ac*dsys(:, k)+Bc*u(:, l);
    end
    if(dsys(21, k+1)>0.073)
        dsys(21, k+1)=0.073;
    elseif(dsys(21, k+1)<-0.073)
        dsys(21, k+1)=-0.073;
    end
end
K=K+round(d/Ts);