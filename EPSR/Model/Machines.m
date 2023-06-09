%Machine 1 Dynamics
A11=zeros(7, 7);
A11(1, 2)=1;
A11(2, 2)=-D_1/M1;
A11(2, 3)=-Iq1o/M1;
A11(3, 3)=-1/T_do1;
A11(2, 4)=-Id1o/M1;
A11(4, 4)=-1/T_qo1;
A11(3, 5)=1/T_do1;
A11(5, 5)=fs_Efd1o;
A11(6, 5)=-Ka*Kf/(Ta*Tf);
A11(7, 5)=Kf/(Tf*Tf);
A11(5, 6)=1/Te;
A11(6, 6)=-1/Ta;
A11(6, 7)=Ka/Ta;
A11(7, 7)=-1/Tf;

A21=zeros(7, 2);
A21(2, 1)=(Iq1o*(X_d1-X_q1)-E_d1o)/M1;
A21(3, 1)=-(Xd1-X_d1)/T_do1;
A21(2, 2)=(Id1o*(X_d1-X_q1)-E_q1o)/M1;
A21(4, 2)=(Xq1-X_q1)/T_qo1;

A31=zeros(7, 2);
A31(6, 2)=-Ka/Ta;

E1=zeros(7, 2);
E1(2, 1)=1/M1;
E1(6, 2)=Ka/Ta;

%Machine 2 Dynamics
A12=zeros(7, 7);
A12(1, 2)=1;
A12(2, 2)=-D_2/M2;
A12(2, 3)=-Iq2o/M2;
A12(3, 3)=-1/T_do2;
A12(2, 4)=-Id2o/M2;
A12(4, 4)=-1/T_qo2;
A12(3, 5)=1/T_do2;
A12(5, 5)=fs_Efd2o;
A12(6, 5)=-Ka*Kf/(Ta*Tf);
A12(7, 5)=Kf/(Tf*Tf);
A12(5, 6)=1/Te;
A12(6, 6)=-1/Ta;
A12(6, 7)=Ka/Ta;
A12(7, 7)=-1/Tf;

A22=zeros(7, 2);
A22(2, 1)=(Iq2o*(X_d2-X_q2)-E_d2o)/M2;
A22(3, 1)=-(Xd2-X_d2)/T_do2;
A22(2, 2)=(Id2o*(X_d2-X_q2)-E_q2o)/M2;
A22(4, 2)=(Xq2-X_q2)/T_qo2;

A32=zeros(7, 2);
A32(6, 2)=-Ka/Ta;

E2=zeros(7, 2);
E2(2, 1)=1/M2;
E2(6, 2)=Ka/Ta;

%Machine 3 Dynamics
A13=zeros(7, 7);
A13(1, 2)=1;
A13(2, 2)=-D_3/M3;
A13(2, 3)=-Iq3o/M3;
A13(3, 3)=-1/T_do3;
A13(2, 4)=-Id3o/M3;
A13(4, 4)=-1/T_qo3;
A13(3, 5)=1/T_do3;
A13(5, 5)=fs_Efd3o;
A13(6, 5)=-Ka*Kf/(Ta*Tf);
A13(7, 5)=Kf/(Tf*Tf);
A13(5, 6)=1/Te;
A13(6, 6)=-1/Ta;
A13(6, 7)=Ka/Ta;
A13(7, 7)=-1/Tf;

A23=zeros(7, 2);
A23(2, 1)=(Iq3o*(X_d3-X_q3)-E_d3o)/M3;
A23(3, 1)=-(Xd3-X_d3)/T_do3;
A23(2, 2)=(Id3o*(X_d3-X_q3)-E_q3o)/M3;
A23(4, 2)=(Xq3-X_q3)/T_qo3;

A33=zeros(7, 2);
A33(6, 2)=-Ka/Ta;

E3=zeros(7, 2);
E3(2, 1)=1/M3;
E3(6, 2)=Ka/Ta;

A1=blkdiag(A11, A12, A13);
A2=blkdiag(A21, A22, A23);
A3=blkdiag(A31, A32, A33);
E=blkdiag(E1, E2, E3);






