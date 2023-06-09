T=10;
Kp=5;
Tp=0.3;

K1=C3-C2*inv(B2)*B3;
K2=C1-C2*inv(B2)*B1;
K3=A1-A2*inv(B2)*B1;
K4=A3-A2*inv(B2)*B3;

% TCSC=zeros(12, 1);
T1=K1-C4*inv(D2)*D1;
T2=C4*inv(D2)*TCSC;

sK3=size(K3);
A=[K3-K4*inv(T1)*K2 -K4*inv(T1)*T2; zeros(1, sK3(2)) -T];

% eig(A(1:21, 1:21))

% K1=C3-C2*inv(B2)*B3;
% K2=C1-C2*inv(B2)*B1;
% K3=A1-A2*inv(B2)*B1;
% K4=A3-A2*inv(B2)*B3;
% 
% T1=-inv(D2)*D1;
% T2=-inv(K1+C4*T1)*K2;

% A=[K3+K4*T2];
Af=A(2:22, 2:22);
Af(8, 1)=-1;
Af(15, 1)=-1;
eig(Af)

Bf=zeros(21, 1);
Bf(21, 1)=T;

% K2=K2(:, 2:21);
% sK2=size(K2);
% K2=[K2 zeros(sK2(1), 1)];
% P691=abs(V(6))*abs(V(9))*(dY69*cos(angle(V(6))-angle(V(9))-al69o));
% P692=abs(V(6))*abs(V(9))*(Y69o*dal69*sin(angle(V(6))-angle(V(9))-al69o));
% P693=-abs(V(6))*abs(V(9))*(Y69o*sin(angle(V(6))-angle(V(9))-al69o));
% P694=abs(V(9))*(Y69o*cos(angle(V(6))-angle(V(9))-al69o));
% P695=abs(V(6))*abs(V(9))*(Y69o*sin(angle(V(6))-angle(V(9))-al69o));
% P696=abs(V(6))*(Y69o*cos(angle(V(6))-angle(V(9))-al69o));
% 
% Temp1=[zeros(1, 21) P691+P692];
% Temp2=[zeros(1, 4) P693 P694 zeros(1, 4) P695 P696];
% % sTCSC=size(TCSC);
% % Temp=[zeros(sTCSC(1), 20*sTCSC(2)) TCSC];
% Temp3=inv(-D1*inv(K1)*C4+D2)*([D1*inv(K1)*K2 TCSC]);
% Temp4=Temp2*Temp3;
% 
% Cf=[Temp4+Temp1];
% Cf=Cf(1, 2:22);
Cf=[zeros(1, 6) 1 zeros(1, 14); zeros(1, 13) 1 zeros(1, 7)];

sysf=ss(Af, Bf, Cf, zeros(2, 1));

% Afilt=-1/Tp;
% Bfilt=Kp/Tp;
% Cfilt=1;
% 
% 
% Acomp=[Af zeros(21, 1); Bfilt*Cf Afilt];
% Bcomp=[Bf; 0];
% Ccomp=[zeros(1, 21) Cfilt];
% 
% sys=ss(Acomp, Bcomp, Ccomp, zeros(1, 1));
