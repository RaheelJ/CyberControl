close all
clc

N=100;
T=0.2;

%init=[zeros(1, 4) 0 0 0.3 0.35 0];
init=[0.5 zeros(1, 5) 0.3 -1 zeros(1, 5) 0.3 0.5 zeros(1, 6)];

sysf.InputDelay = 0;
sysfd=c2d(sysf, 1e-4, 'zoh');
Ac=sysfd.a;
Bc=sysfd.b;

%System Without Control
tf=0:1e-4:20;
Nf=size(tf);
Nf=Nf(2);
df=zeros(n, Nf);
df(:, 1)=init';

%System With Proposed Control
x=zeros(n, N);
x(:, 1)=init';

x_=zeros(n, N);
xk=zeros(n, N);

dx=zeros(n, Nf);
dx(:, 1)=init';
u=zeros(ku, N);

%System With LQR Control 
xl=zeros(n, N);
xl(:, 1)=init';

xl_=zeros(n, N);
xkl=zeros(n, N);

dxl=zeros(n, Nf);
dxl(:, 1)=init';

ux=zeros(ku, N);

%System Without Control
for i=1:Nf-1
df(:, i+1) = Ac*df(:, i);
end

k=1;
K=1;
d2=0;

for b=1:N    
r1=rand(1, 1);
r2=rand(1, 1);
r_2=rand(1, 1);
v=0*randn(n, 1);
w=0.01*randn(m, 1);

if r1<0.7
    d1=0.03;
    if b>1
        u(:, b)=-L1*[x_(:, b); u(:, b-1)];
    else
        u(:, b)=-L1*[x_(:, b); 0];
    end
elseif r1>=0.7 && r1<0.9
    d1=0.06;
    if b>1
        u(:, b)=-L2*[x_(:, b); u(:, b-1)];
    else
        u(:, b)=-L2*[x_(:, b); 0];
    end
else
    d1=0.09;
    if b>1
        u(:, b)=-L3*[x_(:, b); u(:, b-1)];
    else
        u(:, b)=-L3*[x_(:, b); 0];
    end
end

ux(:, b)=-Fl*[xl_(:, b)];

% if r_2<0.7
%     d2=0.03;
% elseif r_2>=0.7 && r_2<0.9
%     d2=0.06;
% else
%     d2=0.09;
% end

sysf.InputDelay = d1+d2;
sysd=c2d(sysf, T, 'zoh');

phi=sysd.a(1:n, 1:n);
sigma0=sysd.b(1:n, 1:ku);
sigma1=sysd.a(1:n, n+1:n+ku);

if r2<0.7
    d2=0.03;
elseif r2>=0.7 && r2<0.9
    d2=0.06;
else
    d2=0.09;
end

d=d1+d2;

if b>1
    for k=K:1:K+round(d/1e-4)-1
        dx(:, k+1) = Ac*dx(:, k)+Bc*u(:, b-1);
        if(dx(n, k+1)>0.073)
            dx(n, k+1)=0.073;
        elseif(dx(n, k+1)<-0.073)
            dx(n, k+1)=-0.073;
        end
        dxl(:, k+1) = Ac*dxl(:, k)+Bc*ux(:, b-1);
        if(dxl(n, k+1)>0.073)
            dxl(n, k+1)=0.073;
        elseif(dxl(n, k+1)<-0.073)
            dxl(n, k+1)=-0.073;
        end
    end
else
    for k=K:1:K+round(d/1e-4)-1
        dx(:, k+1) = Ac*dx(:, k)+Bc*u(:, b);
        if(dx(n, k+1)>0.073)
            dx(n, k+1)=0.073;
        elseif(dx(n, k+1)<-0.073)
            dx(n, k+1)=-0.073;
        end
        dxl(:, k+1) = Ac*dxl(:, k)+Bc*ux(:, b);
        if(dxl(n, k+1)>0.073)
            dxl(n, k+1)=0.073;
        elseif(dxl(n, k+1)<-0.073)
            dxl(n, k+1)=-0.073;
        end
    end
end
K=K+round(d/1e-4);

for k=K:1:K+round((T-d)/1e-4)-1
    dx(:, k+1) = Ac*dx(:, k)+Bc*u(:, b);
    if(dx(n, k+1)>0.073)
        dx(n, k+1)=0.073;
    elseif(dx(n, k+1)<-0.073)
        dx(n, k+1)=-0.073;
    end
    dxl(:, k+1) = Ac*dxl(:, k)+Bc*ux(:, b);
        if(dxl(n, k+1)>0.073)
            dxl(n, k+1)=0.073;
        elseif(dxl(n, k+1)<-0.073)
            dxl(n, k+1)=-0.073;
        end

end
K=K+round((T-d)/1e-4);

xl(:, b+1)=dxl(:, K-1)+v;
x(:, b+1)=dx(:, K-1)+v;

y=C*x(:, b)+w;

if b>1 
    xk(:, b+1)=phi*x_(:, b)+sigma0*u(:, b)+sigma1*u(:, b-1)+L*(y-C*x_(:, b));
else
    xk(:, b+1)=phi*x_(:, b)+sigma0*u(:, b)+L*(y-C*x_(:, b));
end
y=C*x(:, b+1)+w;
x_(:, b+1)=xk(:, b+1)+L_*(y-C*xk(:, b+1));

yl=C*xl(:, b)+w;
xkl(:,b+1)=A*xkl(:, b)+B*ux(:, b)+Ll*(yl-C*xkl(:, b));
yl=C*xl(:, b+1)+w;
xl_(:, b+1)=xkl(:, b+1)+Ml*(yl-C*xkl(:, b+1));
end

e=x-x_;
t=0:T:(N*T);

%Create figure
figure6 = figure;
% Create axes
axes6 = axes('Parent',figure6,'FontSize',26);
xlim(axes6,[0 6]);
box(axes6,'on');
grid(axes6,'on');
hold(axes6,'all');
% Create title
title('e_{7} vs time(sec)','FontSize',26);
% Create stairs
stairs(t,e(7, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes6,...
     'DisplayName','With Designed Control');
% Create legend
%legend(axes6,'show');

%Create figure
figure8 = figure;
% Create axes
axes8 = axes('Parent',figure8,'FontSize',26);
xlim(axes8,[0 6]);
box(axes8,'on');
grid(axes8,'on');
hold(axes8,'all');
% Create title
title('e_{14} vs time(sec)','FontSize',26);
% Create stairs
stairs(t,e(14, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes8,...
     'DisplayName','With Designed Control');
% Create legend
%legend(axes8,'show');


% Create figure
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1,'FontSize',26);
xlim(axes1,[0 8]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');
% Create title
title('\delta_{21} (rad) vs time(sec)','FontSize',26);
% Create stairs
plot(tf,df(7, :),'LineWidth',3,'Color',[1 0 0],'Parent',axes1,...
    'DisplayName','Without Control');
% Create stairs
plot(tf,dx(7, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes1,...
    'DisplayName','With Designed Control');
plot(tf,dxl(7, :),'LineWidth',3,'Color',[0 1 0],'Parent',axes1,...
     'DisplayName','With LQG Control');
% Create legend
legend(axes1,'show');

% Create figure
figure2 = figure;
% Create axes
axes2 = axes('Parent',figure2,'FontSize',26);
xlim(axes2,[0 8]);
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'all');
% Create title
title('\delta_{31} (rad) vs time(sec)','FontSize',26);
% Create stairs
plot(tf,df(14, :),'LineWidth',3,'Color',[1 0 0],'Parent',axes2,...
    'DisplayName','Without Control');
% Create stairs
plot(tf,dx(14, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes2,...
     'DisplayName','With Designed Control');
plot(tf,dxl(14, :),'LineWidth',3,'Color',[0 1 0],'Parent',axes2,...
     'DisplayName','With LQG Control');
 % Create legend
legend(axes2,'show');

%Create figure
figure5 = figure;
% Create axes
axes5 = axes('Parent',figure5,'FontSize',26);
xlim(axes5,[0 8]);
box(axes5,'on');
grid(axes5,'on');
hold(axes5,'all');
% Create title
title('X_c (p.u.) vs time(sec)','FontSize',26);
% Create stairs
plot(tf,dx(21, :),'LineWidth',3,'Color',[0 0 1],'Parent',axes5,...
     'DisplayName','With Designed Control');
plot(tf,dxl(21, :),'LineWidth',3,'Color',[0 1 0],'Parent',axes5,...
     'DisplayName','With LQG Control');
 % Create legend
legend(axes5,'show');
