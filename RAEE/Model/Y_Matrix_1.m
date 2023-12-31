clear
clc

%Admittance Matrix
Y=zeros(9, 9);
Y(1, 1)=-17.361j;
Y(4, 1)=17.361j;
Y(2, 2)=-16j;
Y(7, 2)=16j;
Y(3, 3)=-17.065j;
Y(9, 3)=17.065j;
Y(1, 4)=17.361j;
Y(4, 4)=3.307-39.309j;
Y(5, 4)=-1.365+11.604j;
Y(6, 4)=-1.942+10.511j;
Y(4, 5)=-1.365+11.604j;
Y(5, 5)=2.553-17.338j;
Y(7, 5)=-1.188+5.975j;
Y(4, 6)=-1.942+10.511j;
Y(6, 6)=3.224-15.841j;
Y(9, 6)=-1.282+5.588j;
Y(2, 7)=16j;
Y(5, 7)=-1.188+5.975j;
Y(7, 7)=2.805-35.4460j;
Y(8, 7)=-1.617+13.698j;
Y(7, 8)=-1.617+13.698j;
Y(8, 8)=2.772-23.303j;
Y(9, 8)=-1.155+9.784j;
Y(3, 9)=17.065j;
Y(6, 9)=-1.282+5.588j;
Y(8, 9)=-1.155+9.784j;
Y(9, 9)=2.437-32.1540j;

%Load Flow Analysis
V=zeros(1, 9);
V(1)=1.04;
V(2)=1.025*exp(deg2rad(9.3)*1j);
V(3)=1.025*exp(deg2rad(4.7)*1j);
V(4)=1.026*exp(deg2rad(-2.2)*1j);
V(5)=0.996*exp(deg2rad(-4)*1j);
V(6)=1.013*exp(deg2rad(-3.7)*1j);
V(7)=1.026*exp(deg2rad(3.7)*1j);
V(8)=1.016*exp(deg2rad(0.7)*1j);
V(9)=1.032*exp(deg2rad(2)*1j);

V1=V(1);
V2=V(2);
V3=V(3);
V4=V(4);
V5=V(5);
V6=V(6);
V7=V(7);
V8=V(8);
V9=V(9);

PG1=0.716;
QG1=1j*0.27;
PG2=1.63;
QG2=1j*0.067;
PG3=0.85;
QG3=-1j*0.109;

PL5=1.25+1j*0.5;
PL6=0.9+1j*0.3;
PL8=1+1j*0.35;
