%Normal system reponse
for kk=KK:1:KK+round((T-d)/Ts)-1       
        xx(:, kk+1) = Ac*xx(:, kk)+Bc*ux(:, l);
    if(xx(21, kk+1)>0.073)
        xx(21, kk+1)=0.073;
    elseif(xx(21, kk+1)<-0.073)
        xx(21, kk+1)=-0.073;
    end
end
KK=KK+round((T-d)/Ts);