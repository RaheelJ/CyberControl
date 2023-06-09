%System response due to delay
for kk=KK:1:KK+round(d/Ts)-1           
    if(l>1)
        xx(:, kk+1) = Ac*xx(:, kk)+Bc*ux(:, l-1);
    else
        xx(:, kk+1) = Ac*xx(:, kk)+Bc*ux(:, l);
    end
    if(xx(21, kk+1)>0.073)
        xx(21, kk+1)=0.073;
    elseif(xx(21, kk+1)<-0.073)
        xx(21, kk+1)=-0.073;
    end
end
KK=KK+round(d/Ts);