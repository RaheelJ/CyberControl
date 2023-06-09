% clc
% clear

A11=zeros(7, 7);
A11(1, 2)=1;
A11(2, 2)=-0.2025;
A11(2, 3)=-5.353;
A11(3, 3)=-0.1116;
A11(2, 4)=-2.398;
A11(4, 4)=-3.2258;
A11(3, 5)=0.1116;
A11(5, 5)=-3.2490;
A11(6, 5)=-28.75;
A11(7, 5)=0.6571;
A11(5, 6)=3.1847;
A11(6, 6)=-5;
A11(6, 7)=125;
A11(7, 7)=-2.8571;

A12=zeros(7, 7);
A12(1, 2)=1;
A12(2, 2)=-0.1944;
A12(2, 3)=-27.449;
A12(3, 3)=-0.1667;
A12(2, 4)=-37.9808;
A12(4, 4)=-1.8692;
A12(3, 5)=0.1667;
A12(5, 5)=-3.4385;
A12(6, 5)=-28.75;
A12(7, 5)=0.6571;
A12(5, 6)=3.1847;
A12(6, 6)=-5;
A12(6, 7)=125;
A12(7, 7)=-2.8571;

A13=zeros(7, 7);
A13(1, 2)=1;
A13(2, 2)=-0.1628;
A13(2, 3)=-38.777;
A13(3, 3)=-0.1698;
A13(2, 4)=-35.1419;
A13(4, 4)=-1.6667;
A13(3, 5)=0.1698;
A13(5, 5)=-3.3064;
A13(6, 5)=-28.75;
A13(7, 5)=0.6571;
A13(5, 6)=3.1847;
A13(6, 6)=-5;
A13(6, 7)=125;
A13(7, 7)=-2.8571;

A1=blkdiag(A11, A12, A13);

A21=zeros(7, 2);
A21(2, 1)=-0.1932;
A21(3, 1)=-0.0095;
A21(2, 2)=-8.4223;
A21(4, 2)=0.1165;

A22=zeros(7, 2);
A22(2, 1)=-20.4420;
A22(3, 1)=-0.1293;
A22(2, 2)=-23.2278;
A22(4, 2)=1.392;

A23=zeros(7, 2);
A23(2, 1)=-41.7434;
A23(3, 1)=-0.1921;
A23(2, 2)=-48.1373;
A23(4, 2)=1.7942;

A2=blkdiag(A21, A22, A23);

A31=zeros(7, 2);
A31(6, 2)=-125;

A32=A31;

A33=A31;

A3=blkdiag(A31, A32, A33);

E1=zeros(7, 2);
E1(2, 1)=7.9738;
E1(6, 2)=125;

E2=zeros(7, 2);
E2(2, 1)=29.4531;
E2(6, 2)=125;

E3=zeros(7, 2);
E3(2, 1)=62.6246;
E3(6, 2)=125;

E=blkdiag(E1, E2, E3);

B11=zeros(2, 7);
B11(1, 1)=-1.0380;
B11(2, 1)=0.0651;
B11(2, 3)=1;
B11(1, 4)=1;

B12=zeros(2, 7);
B12(1, 1)=-0.6341;
B12(2, 1)=0.8057;
B12(2, 3)=1;
B12(1, 4)=1;

B13=zeros(2, 7);
B13(1, 1)=-0.6669;
B13(2, 1)=0.7788;
B13(2, 3)=1;
B13(1, 4)=1;

B1=blkdiag(B11, B12, B13);

B2=zeros(6, 6);
B2(2, 1)=-0.0608;
B2(1, 2)=0.0608;
B2(4, 3)=-0.1198;
B2(3, 4)=0.1198;
B2(6, 5)=-0.1813;
B2(5, 6)=0.1813;

B3=zeros(6, 6);
B3(1, 1)=1.0380;
B3(2, 1)=-0.0651;
B3(1, 2)=-0.0625;
B3(2, 2)=-0.9980;
B3(3, 3)=0.6341;
B3(4, 3)=-0.8057;
B3(3, 4)=-0.7858;
B3(4, 4)=-0.6185;
B3(5, 5)=0.6669;
B3(6, 5)=-0.7788;
B3(5, 6)=-0.7596;
B3(6, 6)=-0.6504;

C11=zeros(2, 7);
C11(1, 1)=0.2685;
C11(2, 1)=-0.7164;

C12=zeros(2, 7);
C12(1, 1)=0.0669;
C12(2, 1)=-1.63;

C13=zeros(2, 7);
C13(1, 1)=-0.1080;
C13(2, 1)=-0.85;

C1=blkdiag(C11, C12, C13);

C2=zeros(6, 6);
C2(1, 1)=0.0651;
C2(2, 1)=1.0380;
C2(1, 2)=1.0380;
C2(2, 2)=-0.0651;
C2(3, 3)=0.8057;
C2(4, 3)=0.6341;
C2(3, 4)=0.6341;
C2(4, 4)=-0.8057;
C2(5, 5)=0.7788;
C2(6, 5)=0.6669;
C2(5, 6)=0.6669;
C2(6, 6)=-0.7788;

C3=zeros(6, 6);
C3(1, 1)=-18.7778;
C3(2, 1)=0;
C3(1, 2)=0;
C3(2, 2)=-18.0556;
C3(3, 3)=-16.8208;
C3(4, 3)=0;
C3(3, 4)=0;
C3(4, 4)=-16.4053;
C3(5, 5)=-17.9414;
C3(6, 5)=0;
C3(5, 6)=0;
C3(6, 6)=-17.4976;

C4=zeros(6, 12);
C4(1, 1)=18.5093;
C4(2, 1)=0.7164;
C4(1, 2)=-0.6983;
C4(2, 2)=18.0420;
C4(3, 7)=16.754;
C4(4, 7)=1.63;
C4(3, 8)=-1.5886;
C4(4, 8)=16.3283;
C4(5, 11)=18.0493;
C4(6, 11)=0.85;
C4(5, 12)=-0.8231;
C4(6, 12)=17.4782;

D1=zeros(12, 6);
D1(1, 1)=18.5093;
D1(2, 1)=-0.7164;
D1(1, 2)=0.6888;
D1(2, 2)=17.7974;
D1(7, 3)=16.754;
D1(8, 3)=-1.63;
D1(7, 4)=1.5897;
D1(8, 4)=16.3401;
D1(11, 5)=18.0493;
D1(12, 5)=-0.85;
D1(11, 6)=0.829;
D1(12, 6)=17.6029;

D11=D1(1:2, :);
D12=D1(3:4, :);
D13=D1(5:6, :);
D14=D1(7:8, :);
D15=D1(9:10, :);
D16=D1(11:12, :);

D2=zeros(12, 12);
D2(1:6, 1)=[-41.3713 3.4809 11.8061 -1.7606 10.866 -2.2978];
D2(1:6, 2)=[-3.393 -40.3269 1.7162 11.5081 2.2398 10.5917];
D2([1:4 7:8], 3)=[11.8923 -1.0274 -17.6937 3.7815 6.2129 -0.3842];
D2([1:4 7:8], 4)=[1.0317 11.9422 -1.2869 -16.7637 0.3858 6.239];
D2([1:2 5:6 11:12], 5)=[10.9696 -1.7371 -16.5506 4.2076 5.9486 -0.759];
D2([1:2 5:6 11:12], 6)=[1.715 10.8305 -2.377 -15.7483 0.7493 5.8731];
D2([3:4 7:10], 7)=[5.8876 -2.0209 -37.3183 2.9529 14.1755 -2.429];
D2([3:4 7:10], 8)=[1.9695 5.738 -2.8779 -36.3699 2.3673 13.8153];
D2(7:12, 9)=[14.3515 -0.9387 -24.4147 3.8628 10.2915 -0.99];
D2(7:12, 10)=[0.9238 14.1226 -1.8331 -23.3365 0.9742 10.1274];
D2([5:6 9:12], 11)=[5.6846 -1.9098 10.2391 -1.4338 -34.2895 2.599];
D2([5:6 9:12], 12)=[1.8494 5.5047 1.3884 9.9151 -2.5167 -33.2045];

D21=D2(1:2, :);
D22=D2(3:4, :);
D23=D2(5:6, :);
D24=D2(7:8, :);
D25=D2(9:10, :);
D26=D2(11:12, :);

D1=[D11; D12; D13; D14; D15; D16];
D2=[D21; D22; D23; D24; D25; D26];