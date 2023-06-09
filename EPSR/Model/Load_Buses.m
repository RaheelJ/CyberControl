% %Load Bus Bar 4
% VYS=abs(V).*abs(Y(4, :)).*sin(angle(V(4))*ones(1, 9)-angle(V)-angle(Y(4, :)));
% VYC=abs(V).*abs(Y(4, :)).*cos(angle(V(4))*ones(1, 9)-angle(V)-angle(Y(4, :)));
% YC=abs(Y(4, :)).*cos(angle(V(4))*ones(1, 9)-angle(V)-angle(Y(4, :)));
% YS=abs(Y(4, :)).*sin(angle(V(4))*ones(1, 9)-angle(V)-angle(Y(4, :)));
% 
% D11=zeros(2, 6);
% D11(1, 1:2:5)=-abs(V(4))*VYS(1:3);
% D11(1, 2:2:6)=-abs(V(4))*YC(1:3);
% D11(2, 1:2:5)=abs(V(4))*VYC(1:3);
% D11(2, 2:2:6)=-abs(V(4))*YS(1:3);
% 
% D21=zeros(2, 12);
% D21(1, 1)=abs(V(4))*sum(VYS([1:3 5:9]));
% D21(1, 2)=-sum(VYC)-abs(V(4))*abs(Y(4, 4))*cos(angle(Y(4, 4)));
% D21(1, 3:2:11)=-abs(V(4))*VYS(5:9);
% D21(1, 4:2:12)=-abs(V(4))*YC(5:9);
% D21(2, 1)=-abs(V(4))*sum(VYC([1:3 5:9]));
% D21(2, 2)=-sum(VYS)+abs(V(4))*abs(Y(4, 4))*sin(angle(Y(4, 4)));
% D21(2, 3:2:11)=abs(V(4))*VYC(5:9);
% D21(2, 4:2:12)=-abs(V(4))*YS(5:9);
% % 
% %Load Bus Bar 5
% VYS=abs(V).*abs(Y(5, :)).*sin(angle(V(5))*ones(1, 9)-angle(V)-angle(Y(5, :)));
% VYC=abs(V).*abs(Y(5, :)).*cos(angle(V(5))*ones(1, 9)-angle(V)-angle(Y(5, :)));
% YC=abs(Y(5, :)).*cos(angle(V(5))*ones(1, 9)-angle(V)-angle(Y(5, :)));
% YS=abs(Y(5, :)).*sin(angle(V(5))*ones(1, 9)-angle(V)-angle(Y(5, :)));
% 
% D12=zeros(2, 6);
% D12(1, 1:2:5)=-abs(V(5))*VYS(1:3);
% D12(1, 2:2:6)=-abs(V(5))*YC(1:3);
% D12(2, 1:2:5)=abs(V(5))*VYC(1:3);
% D12(2, 2:2:6)=-abs(V(5))*YS(1:3);
% 
% D22=zeros(2, 12);
% D22(1, 3)=abs(V(5))*sum(VYS([1:4 6:9]));
% D22(1, 4)=-sum(VYC)-abs(V(5))*abs(Y(5, 5))*cos(angle(Y(5, 5)));
% D22(1, [1 5:2:11])=-abs(V(5))*VYS([4 6:9]);
% D22(1, [2 6:2:12])=-abs(V(5))*YC([4 6:9]);
% D22(2, 3)=-abs(V(5))*sum(VYC([1:4 6:9]));
% D22(2, 4)=-sum(VYS)+abs(V(5))*abs(Y(5, 5))*sin(angle(Y(5, 5)));
% D22(2, [1 5:2:11])=abs(V(5))*VYC([4 6:9]);
% D22(2, [2 6:2:12])=-abs(V(5))*YS([4 6:9]);

% %Load Bus Bar 6
% VYS=abs(V).*abs(Y(6, :)).*sin(angle(V(6))*ones(1, 9)-angle(V)-angle(Y(6, :)));
% VYC=abs(V).*abs(Y(6, :)).*cos(angle(V(6))*ones(1, 9)-angle(V)-angle(Y(6, :)));
% YC=abs(Y(6, :)).*cos(angle(V(6))*ones(1, 9)-angle(V)-angle(Y(6, :)));
% YS=abs(Y(6, :)).*sin(angle(V(6))*ones(1, 9)-angle(V)-angle(Y(6, :)));
% 
% D13=zeros(2, 6);
% D13(1, 1:2:5)=-abs(V(6))*VYS(1:3);
% D13(1, 2:2:6)=-abs(V(6))*YC(1:3);
% 
% D13(2, 1:2:5)=abs(V(6))*VYC(1:3);
% D13(2, 2:2:6)=-abs(V(6))*YS(1:3);
% 
% D23=zeros(2, 12);
% D23(1, 5)=abs(V(6))*(sum(VYS([1:5 7:8]))+abs(V(9))*Y69o*sin(angle(V(6))-angle(V(9))-al69o));
% D23(1, 6)=-sum(VYC([1:5 7:8]))-2*abs(V(6))*Y66o*cos(al66o)-abs(V(9))*Y69o*cos(angle(V(6))-angle(V(9))-al69o);
% D23(1, 11)=-abs(V(6))*abs(V(9))*Y69o*sin(angle(V(6))-angle(V(9))-al69o);
% D23(1, 12)=-abs(V(6))*Y69o*cos(angle(V(6))-angle(V(9))-al69o);
% D23(1, [1:2:3 7:2:9])=-abs(V(6))*VYS([4:5 7:8]);
% D23(1, [2:2:4 8:2:10])=-abs(V(6))*YC([4:5 7:8]);
% 
% D23(2, 5)=abs(V(6))*(-sum(VYC([1:5 7:8]))-abs(V(9))*Y69o*cos(angle(V(6))-angle(V(9))-al69o));
% D23(2, 6)=-sum(VYS([1:5 7:8]))-2*abs(V(6))*Y66o*sin(-al66o)-abs(V(9))*Y69o*sin(angle(V(6))-angle(V(9))-al69o);
% D23(2, 11)=abs(V(6))*abs(V(9))*Y69o*cos(angle(V(6))-angle(V(9))-al69o);
% D23(2, 12)=-abs(V(6))*Y69o*sin(angle(V(6))-angle(V(9))-al69o);
% D23(2, [1:2:3 7:2:9])=abs(V(6))*VYC([4:5 7:8]);
% D23(2, [2:2:4 8:2:10])=-abs(V(6))*YS([4:5 7:8]);
% % 
% %Load Bus Bar 7
% VYS=abs(V).*abs(Y(7, :)).*sin(angle(V(7))*ones(1, 9)-angle(V)-angle(Y(7, :)));
% VYC=abs(V).*abs(Y(7, :)).*cos(angle(V(7))*ones(1, 9)-angle(V)-angle(Y(7, :)));
% YC=abs(Y(7, :)).*cos(angle(V(7))*ones(1, 9)-angle(V)-angle(Y(7, :)));
% YS=abs(Y(7, :)).*sin(angle(V(7))*ones(1, 9)-angle(V)-angle(Y(7, :)));
% 
% D14=zeros(2, 6);
% D14(1, 1:2:5)=-abs(V(7))*VYS(1:3);
% D14(1, 2:2:6)=-abs(V(7))*YC(1:3);
% D14(2, 1:2:5)=abs(V(7))*VYC(1:3);
% D14(2, 2:2:6)=-abs(V(7))*YS(1:3);
% 
% D24=zeros(2, 12);
% D24(1, 7)=abs(V(7))*sum(VYS([1:6 8:9]));
% D24(1, 8)=-sum(VYC)-abs(V(7))*abs(Y(7, 7))*cos(angle(Y(7, 7)));
% D24(1, [1:2:5 9:2:11])=-abs(V(7))*VYS([4:6 8:9]);
% D24(1, [2:2:6 10:2:12])=-abs(V(7))*YC([4:6 8:9]);
% D24(2, 7)=-abs(V(7))*sum(VYC([1:6 8:9]));
% D24(2, 8)=-sum(VYS)+abs(V(7))*abs(Y(7, 7))*sin(angle(Y(7, 7)));
% D24(2, [1:2:5 9:2:11])=abs(V(7))*VYC([4:6 8:9]);
% D24(2, [2:2:6 10:2:12])=-abs(V(7))*YS([4:6 8:9]);
% % 
% %Load Bus Bar 8
% VYS=abs(V).*abs(Y(8, :)).*sin(angle(V(8))*ones(1, 9)-angle(V)-angle(Y(8, :)));
% VYC=abs(V).*abs(Y(8, :)).*cos(angle(V(8))*ones(1, 9)-angle(V)-angle(Y(8, :)));
% YC=abs(Y(8, :)).*cos(angle(V(8))*ones(1, 9)-angle(V)-angle(Y(8, :)));
% YS=abs(Y(8, :)).*sin(angle(V(8))*ones(1, 9)-angle(V)-angle(Y(8, :)));
% 
% D15=zeros(2, 6);
% D15(1, 1:2:6)=-abs(V(8))*VYS(1:3);
% D15(1, 2:2:6)=-abs(V(8))*YC(1:3);
% D15(2, 1:2:6)=abs(V(8))*VYC(1:3);
% D15(2, 2:2:6)=-abs(V(8))*YS(1:3);
% 
% D25=zeros(2, 12);
% D25(1, 9)=abs(V(8))*sum(VYS([1:7 9]));
% D25(1, 10)=-sum(VYC)-abs(V(8))*abs(Y(8, 8))*cos(angle(Y(8, 8)));
% D25(1, [1:2:7 11])=-abs(V(8))*VYS([4:7 9]);
% D25(1, [2:2:8 12])=-abs(V(8))*YC([4:7 9]);
% D25(2, 9)=-abs(V(8))*sum(VYC([1:7 9]));
% D25(2, 10)=-sum(VYS)+abs(V(8))*abs(Y(8, 8))*sin(angle(Y(8, 8)));
% D25(2, [1:2:7 11])=abs(V(8))*VYC([4:7 9]);
% D25(2, [2:2:8 12])=-abs(V(8))*YS([4:7 9]);
% 
% 
% %Load Bus Bar 9
% VYS=abs(V).*abs(Y(9, :)).*sin(angle(V(9))*ones(1, 9)-angle(V)-angle(Y(9, :)));
% VYC=abs(V).*abs(Y(9, :)).*cos(angle(V(9))*ones(1, 9)-angle(V)-angle(Y(9, :)));
% YC=abs(Y(9, :)).*cos(angle(V(9))*ones(1, 9)-angle(V)-angle(Y(9, :)));
% YS=abs(Y(9, :)).*sin(angle(V(9))*ones(1, 9)-angle(V)-angle(Y(9, :)));
% 
% D16=zeros(2, 6);
% D16(1, 1:2:5)=-abs(V(9))*VYS(1:3);
% D16(1, 2:2:6)=-abs(V(9))*YC(1:3);
% 
% D16(2, 1:2:5)=abs(V(9))*VYC(1:3);
% D16(2, 2:2:6)=-abs(V(9))*YS(1:3);
% 
% D26=zeros(2, 12);
% D26(1, 5)=-abs(V(9))*abs(V(6))*Y69o*sin(angle(V(9))-angle(V(6))-al69o);
% D26(1, 6)=-abs(V(9))*Y69o*cos(angle(V(9))-angle(V(6))-al69o);
% D26(1, 11)=abs(V(9))*(sum(VYS([1:5 7:8]))+abs(V(6))*Y69o*sin(angle(V(9))-angle(V(6))-al69o));
% D26(1, 12)=-sum(VYC([1:5 7:8]))-2*abs(V(9))*Y99o*cos(al99o)-abs(V(6))*Y69o*cos(angle(V(9))-angle(V(6))-al69o);
% D26(1, [1:2:3 7:2:9])=-abs(V(9))*VYS([4:5 7:8]);
% D26(1, [2:2:4 8:2:10])=-abs(V(9))*YC([4:5 7:8]);
% 
% D26(2, 5)=abs(V(9))*abs(V(6))*Y69o*cos(angle(V(9))-angle(V(6))-al69o);
% D26(2, 6)=-abs(V(9))*Y69o*sin(angle(V(9))-angle(V(6))-al69o);
% D26(2, 11)=abs(V(9))*(-sum(VYC([1:5 7:8]))-abs(V(6))*Y69o*cos(angle(V(9))-angle(V(6))-al69o));
% D26(2, 12)=-sum(VYS([1:5 7:8]))-2*abs(V(9))*Y99o*sin(-al99o)-abs(V(6))*Y69o*sin(angle(V(9))-angle(V(6))-al69o);
% D26(2, [1:2:3 7:2:9])=abs(V(9))*VYC([4:5 7:8]);
% D26(2, [2:2:4 8:2:10])=-abs(V(9))*YS([4:5 7:8]);
% % 
% D1=[D11; D12; D13; D14; D15; D16];
% D2=[D21; D22; D23; D24; D25; D26];

Temp1=-(abs(V(6))^2)*(dY66*cos(al66o)-Y66o*sin(al66o)*dal66);
Temp2=-abs(V(6))*abs(V(9))*(dY69*cos(angle(V(6))-angle(V(9))-al69o)+Y69o*sin(angle(V(6))-angle(V(9))-al69o)*dal69);
TCSC1(1, 1)=Temp1+Temp2;

%TCSC3=Temp2;

Temp3=(abs(V(6))^2)*(dY66*sin(al66o)+Y66o*cos(al66o)*dal66);
Temp4=abs(V(6))*abs(V(9))*(-dY69*sin(angle(V(6))-angle(V(9))-al69o)+Y69o*cos(angle(V(6))-angle(V(9))-al69o)*dal69);
TCSC1(2, 1)=Temp3+Temp4;

Temp1=-(abs(V(9))^2)*(dY99*cos(al99o)-Y99o*sin(al99o)*dal99);
Temp2=-abs(V(9))*abs(V(6))*(dY69*cos(angle(V(9))-angle(V(6))-al69o)+Y69o*sin(angle(V(9))-angle(V(6))-al69o)*dal69);
TCSC2(1, 1)=Temp1+Temp2;

Temp3=(abs(V(9))^2)*(dY99*sin(al99o)+Y99o*cos(al99o)*dal99);
Temp4=abs(V(9))*abs(V(6))*(-dY69*sin(angle(V(9))-angle(V(6))-al69o)+Y69o*cos(angle(V(9))-angle(V(6))-al69o)*dal69);
TCSC2(2, 1)=Temp3+Temp4;

TCSC=[zeros(2, 1); zeros(2, 1); -TCSC1; zeros(2, 1); zeros(2, 1); -TCSC2];
% 
% Temp1=-abs(V(6))*abs(V(9))*Y69o*sin(angle(V(6))-angle(V(9))-al69o);
% Temp2=abs(V(9))*Y69o*cos(angle(V(6))-angle(V(9))-al69o);
% Temp3=abs(V(6))*abs(V(9))*Y69o*sin(angle(V(6))-angle(V(9))-al69o);
% Temp4=abs(V(6))*Y69o*cos(angle(V(6))-angle(V(9))-al69o);
% 
% Temp5=[zeros(1, 4) Temp1 Temp2 zeros(1, 4) Temp3 Temp4];
% 
% D1=[D1; zeros(1, 6)];
% D2=[D2; -Temp5];