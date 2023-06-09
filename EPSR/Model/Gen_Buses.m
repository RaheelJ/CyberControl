%Network Equations

%Machine 1
C11=zeros(2, 7);
C11(1, 1)=Id1o*V1o*cos(d1o-O1o)-Iq1o*V1o*sin(d1o-O1o);
C11(2, 1)=-Id1o*V1o*sin(d1o-O1o)-Iq1o*V1o*cos(d1o-O1o);

C21=zeros(2, 2);
C21(1, 1)=V1o*sin(d1o-O1o);
C21(1, 2)=V1o*cos(d1o-O1o);
C21(2, 1)=V1o*cos(d1o-O1o);
C21(2, 2)=-V1o*sin(d1o-O1o);

C31=zeros(2, 6);
VYS=abs(V).*abs(Y(1, :)).*sin(O1o*ones(1, 9)-angle(V)-angle(Y(1, :)));
VYSS=sum(VYS(2:9));
VYC=abs(V).*abs(Y(1, :)).*cos(O1o*ones(1, 9)-angle(V)-angle(Y(1, :)));
VYCS=sum(VYC);
YC=abs(Y(1, :)).*cos(O1o*ones(1, 9)-angle(V)-angle(Y(1, :)));
YS=abs(Y(1, :)).*sin(O1o*ones(1, 9)-angle(V)-angle(Y(1, :)));
C31(1, 1)=-Id1o*V1o*cos(d1o-O1o)+Iq1o*V1o*sin(d1o-O1o)+V1o*VYSS;
C31(1, 2)=Id1o*sin(d1o-O1o)+Iq1o*cos(d1o-O1o)-VYCS-V1o*abs(Y(1, 1))*cos(angle(Y(1,1)));
C31(2, 1)=Id1o*V1o*sin(d1o-O1o)+Iq1o*V1o*cos(d1o-O1o)-V1o*sum(VYC(2:9));
C31(2, 2)=Id1o*cos(d1o-O1o)-Iq1o*sin(d1o-O1o)-sum(VYS)+V1o*abs(Y(1, 1))*sin(angle(Y(1, 1)));

C31(1, [3 5])=-V1o*VYS(2:3);
C31(1, [4 6])=-V1o*YC(2:3);
C31(2, [3 5])=V1o*VYC(2:3);
C31(2, [4 6])=-V1o*YS(2:3);

C41=zeros(2, 12);
C41(1, 1:2:11)=-V1o*VYS(4:9);
C41(1, 2:2:12)=-V1o*YC(4:9);
C41(2, 1:2:11)=V1o*VYC(4:9);
C41(2, 2:2:12)=-V1o*YS(4:9);

%Machine 2
C12=zeros(2, 7);
C12(1, 1)=Id2o*V2o*cos(d2o-O2o)-Iq2o*V2o*sin(d2o-O2o);
C12(2, 1)=-Id2o*V2o*sin(d2o-O2o)-Iq2o*V2o*cos(d2o-O2o);

C22=zeros(2, 2);
C22(1, 1)=V2o*sin(d2o-O2o);
C22(1, 2)=V2o*cos(d2o-O2o);
C22(2, 1)=V2o*cos(d2o-O2o);
C22(2, 2)=-V2o*sin(d2o-O2o);

C32=zeros(2, 6);
VYS=abs(V).*abs(Y(2, :)).*sin(O2o*ones(1, 9)-angle(V)-angle(Y(2, :)));
VYSS=sum(VYS([1 3:9]));
VYC=abs(V).*abs(Y(2, :)).*cos(O2o*ones(1, 9)-angle(V)-angle(Y(2, :)));
VYCS=sum(VYC);
YC=abs(Y(2, :)).*cos(O2o*ones(1, 9)-angle(V)-angle(Y(2, :)));
YS=abs(Y(2, :)).*sin(O2o*ones(1, 9)-angle(V)-angle(Y(2, :)));
C32(1, 3)=-Id2o*V2o*cos(d2o-O2o)+Iq2o*V2o*sin(d2o-O2o)+V2o*VYSS;
C32(1, 4)=Id2o*sin(d2o-O2o)+Iq2o*cos(d2o-O2o)-VYCS-V2o*abs(Y(2, 2))*cos(angle(Y(2, 2)));
C32(2, 3)=Id2o*V2o*sin(d2o-O2o)+Iq2o*V2o*cos(d2o-O2o)-V2o*sum(VYC([1 3:9]));
C32(2, 4)=Id2o*cos(d2o-O2o)-Iq2o*sin(d2o-O2o)-sum(VYS)+V2o*abs(Y(2, 2))*sin(angle(Y(2, 2)));
C32(1, [1 5])=-V2o*VYS([1 3]);
C32(1, [2 6])=-V2o*YC([1 3]);
C32(2, [1 5])=V2o*VYC([1 3]);
C32(2, [2 6])=-V2o*YS([1 3]);

C42=zeros(2, 12);
C42(1, 1:2:11)=-V2o*VYS(4:9);
C42(1, 2:2:12)=-V2o*YC(4:9);
C42(2, 1:2:11)=V2o*VYC(4:9);
C42(2, 2:2:12)=-V2o*YS(4:9);

%Machine 3
C13=zeros(2, 7);
C13(1, 1)=Id3o*V3o*cos(d3o-O3o)-Iq3o*V3o*sin(d3o-O3o);
C13(2, 1)=-Id3o*V3o*sin(d3o-O3o)-Iq3o*V3o*cos(d3o-O3o);

C23=zeros(2, 2);
C23(1, 1)=V3o*sin(d3o-O3o);
C23(1, 2)=V3o*cos(d3o-O3o);
C23(2, 1)=V3o*cos(d3o-O3o);
C23(2, 2)=-V3o*sin(d3o-O3o);

C33=zeros(2, 6);
VYS=abs(V).*abs(Y(3, :)).*sin(O3o*ones(1, 9)-angle(V)-angle(Y(3, :)));
VYSS=sum(VYS([1 2 4:9]));
VYC=abs(V).*abs(Y(3, :)).*cos(O3o*ones(1, 9)-angle(V)-angle(Y(3, :)));
VYCS=sum(VYC);
YC=abs(Y(3, :)).*cos(O3o*ones(1, 9)-angle(V)-angle(Y(3, :)));
YS=abs(Y(3, :)).*sin(O3o*ones(1, 9)-angle(V)-angle(Y(3, :)));
C33(1, 5)=-Id3o*V3o*cos(d3o-O3o)+Iq3o*V3o*sin(d3o-O3o)+V3o*VYSS;
C33(1, 6)=Id3o*sin(d3o-O3o)+Iq3o*cos(d3o-O3o)-VYCS-V3o*abs(Y(3, 3))*cos(angle(Y(3, 3)));
C33(2, 5)=Id3o*V3o*sin(d3o-O3o)+Iq3o*V3o*cos(d3o-O3o)-V3o*sum(VYC([1 2 4:9]));
C33(2, 6)=Id3o*cos(d3o-O3o)-Iq3o*sin(d3o-O3o)-sum(VYS)+V3o*abs(Y(3, 3))*sin(angle(Y(3, 3)));

C33(1, [1 3])=-V3o*VYS([1 2]);
C33(1, [2 4])=-V3o*YC([1 2]);
C33(2, [1 3])=V3o*VYC([1 2]);
C33(2, [2 4])=-V3o*YS([1 2]);

C43=zeros(2, 12);
C43(1, 1:2:11)=-V3o*VYS(4:9);
C43(1, 2:2:12)=-V3o*YC(4:9);
C43(2, 1:2:11)=V3o*VYC(4:9);
C43(2, 2:2:12)=-V3o*YS(4:9);

C1=blkdiag(C11, C12, C13);
C2=blkdiag(C21, C22, C23);
C3=[C31; C32; C33];
C4=[C41; C42; C43];

