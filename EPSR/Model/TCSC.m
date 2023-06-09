Y69=abs(Y(6, 9));
al69=angle(Y(6, 9));
Y66=abs(Y(6, 6));
al66=angle(Y(6, 6));
Y99=abs(Y(9, 9));
al99=angle(Y(9, 9));
Xc=0;

a=2*Y69*sin(al69);
b=Y69^2;
c=Y69*cos(al69);
d=Y69*sin(al69);

Aa=1+d*Xc;
Bb=c*Xc;
Cc=a+2*b*Xc;
Dd=1+a*Xc+b*Xc^2;

Y69o=(Y69/sqrt(Dd));
al69o=al69+atan(c*Xc/(1+d*Xc));
dY69=-(1/2)*Y69*Cc/(Dd^(3/2));
dal69=c/(Aa^2+Bb^2);

e=Y66*cos(al66)+Y69*cos(al69);
f=Y66*sin(al66)+Y69*sin(al69);

g=e*Dd-c;
h=f*Dd-b*Xc-d;
Ff=a+2*b*Xc;
Gg=f*Ff-b;
Ee=g^2+h^2;

Y66o=sqrt(g^2+h^2)/Dd;
al66o=atan(h/g);
dY66=(Ee^(-1/2)*(g*e*Ff+h*Gg)*Dd-Ff*sqrt(Ee))/Dd^2;
dal66=((f*Ff-b)*g-e*Ff*h)/(g^2+h^2);

e=Y99*cos(al99)+Y69*cos(al69);
f=Y99*sin(al99)+Y69*sin(al69);
 
g=e*Dd-c;
h=f*Dd-b*Xc-d;
Ff=a+2*b*Xc;
Gg=f*Ff-b;
Ee=g^2+h^2;

Y99o=sqrt(g^2+h^2)/Dd;
al99o=atan(h/g);
dY99=(Ee^(-1/2)*(g*e*Ff+h*Gg)*Dd-Ff*sqrt(Ee))/Dd^2;
dal99=((f*Ff-b)*g-e*Ff*h)/(g^2+h^2);
