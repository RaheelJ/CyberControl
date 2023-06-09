%Stator Equations 1
B11=zeros(2, 7);
B11(1, 1)=-V1o*cos(d1o-O1o);
B11(1, 4)=1;
B11(2, 1)=V1o*sin(d1o-O1o);
B11(2, 3)=1;

B21=zeros(2, 2);
B21(1, 1)=-Rs1;
B21(1, 2)=X_q1;
B21(2, 1)=-X_d1;
B21(2, 2)=-Rs1;

B31=zeros(2, 2);
B31(1, 1)=V1o*cos(d1o-O1o);
B31(1, 2)=-sin(d1o-O1o);
B31(2, 1)=-V1o*sin(d1o-O1o);
B31(2, 2)=-cos(d1o-O1o);

%Stator Equations 2
B12=zeros(2, 7);
B12(1, 1)=-V2o*cos(d2o-O2o);
B12(1, 4)=1;
B12(2, 1)=V2o*sin(d2o-O2o);
B12(2, 3)=1;

B22=zeros(2, 2);
B22(1, 1)=-Rs2;
B22(1, 2)=X_q2;
B22(2, 1)=-X_d2;
B22(2, 2)=-Rs2;

B32=zeros(2, 2);
B32(1, 1)=V2o*cos(d2o-O2o);
B32(1, 2)=-sin(d2o-O2o);
B32(2, 1)=-V2o*sin(d2o-O2o);
B32(2, 2)=-cos(d2o-O2o);

%Stator Equations 3
B13=zeros(2, 7);
B13(1, 1)=-V3o*cos(d3o-O3o);
B13(1, 4)=1;
B13(2, 1)=V3o*sin(d3o-O3o);
B13(2, 3)=1;

B23=zeros(2, 2);
B23(1, 1)=-Rs3;
B23(1, 2)=X_q3;
B23(2, 1)=-X_d3;
B23(2, 2)=-Rs3;

B33=zeros(2, 2);
B33(1, 1)=V3o*cos(d3o-O3o);
B33(1, 2)=-sin(d3o-O3o);
B33(2, 1)=-V3o*sin(d3o-O3o);
B33(2, 2)=-cos(d3o-O3o);

B1=blkdiag(B11, B12, B13);
B2=blkdiag(B21, B22, B23);
B3=blkdiag(B31, B32, B33);


