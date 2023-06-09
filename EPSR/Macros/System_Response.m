%Normal system reponse
for k=K:1:K+round((T-d)/Ts)-1       
        dsys(:, k+1) = Ac*dsys(:, k)+Bc*u(:, l);
    if(dsys(21, k+1)>0.073)
        dsys(21, k+1)=0.073;
    elseif(dsys(21, k+1)<-0.073)
        dsys(21, k+1)=-0.073;
    end
end
K=K+round((T-d)/Ts);