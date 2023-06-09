%Machine 1
H1=23.64;
Xd1=0.146;
X_d1=0.0608;
Xq1=0.0969;
X_q1=0.0608;
T_do1=8.96;
T_qo1=0.31;
ws1=2*pi*60;
% M1=2*H1/ws1;
% D_1=0;
D1=0.0254;
Rs1=0;

%Machine 2
H2=6.4;
Xd2=0.8958;
X_d2=0.1198;
Xq2=0.8645;
X_q2=0.1198;
T_do2=6;
T_qo2=0.535;
% D_M2=0.2;
ws2=2*pi*60;
% M2=2*H2/ws2;
%D_2=0;
D2=0.0066;
Rs2=0;

%Machine 3
H3=3.01;
Xd3=1.3125;
X_d3=0.1813;
Xq3=1.2578;
X_q3=0.1813;
T_do3=5.89;
T_qo3=0.6;
% D_M3=0.3;
ws3=2*pi*60;
% M3=2*H3/ws3;
% %D_3=0;
% D_3=0.3*M3;
D3=0.0026;
Rs3=0;

%Exciter 1, 2, 3
KA3=25;
TA3=0.2;
KE3=1;
TE3=0.314;
KF3=0.0805;
TF3=0.35;
% Se_Efd=0.0039*exp(1.555*Efd);
Ax=0.0016;
Bx=1.465;
% 
% %Initial Conditions Machine 1  
% V1o=abs(V(1));
% O1o=0;
% d1o=deg2rad(3.58);    %Degrees
% Id1o=0.302;
% Iq1o=0.671;
% Vd1o=0.065;
% Vq1o=1.038;
% E_d1o=0;
% E_q1o=1.056;
% Efd1o=1.082;
% Vr1o=1.105;
% Rf1o=-.195;
% Vref1o=1.095;
% Tm1=0.716;
% fs_Efd1o=(Ke+(Efd1o*0.0061*exp(1.555*Efd1o))+0.0039*exp(1.555*Efd1o))/Te;
% 
% %Initial Conditions Machine 2  
% V2o=abs(V(2));
% O2o=angle(V(2));
% d2o=deg2rad(61.1);    %Degrees
% Id2o=1.29;
% Iq2o=0.931;
% Vd2o=0.805;
% Vq2o=0.634;
% E_d2o=0.622;
% E_q2o=0.788;
% Efd2o=1.789;
% Vr2o=1.902;
% Rf2o=0.322;
% Vref2o=1.12;
% Tm2=1.63;
% fs_Efd2o=(Ke+(Efd2o*0.0061*exp(1.555*Efd2o))+0.0039*exp(1.555*Efd2o))/Te;
% 
% %Initial Conditions Machine 3  
% V3o=abs(V(3));
% O3o=angle(V(3));
% d3o=deg2rad(54.2);    %Degrees
% Id3o=0.562;
% Iq3o=0.619;
% Vd3o=0.779;
% Vq3o=0.666;
% E_d3o=0.624;
% E_q3o=0.768;
% Efd3o=1.403;
% Vr3o=1.453;
% Rf3o=0.252;
% Vref3o=1.09;
% Tm3=0.85;
% fs_Efd3o=(Ke+(Efd3o*0.0061*exp(1.555*Efd3o))+0.0039*exp(1.555*Efd3o))/Te;
