close all
clear
clc

load('Workspace/Observer_Workspace')

N=100;
T=0.2;
t=zeros(1, N);
t(1)=0;
e=zeros(n, N);
e(:, 1)=[1 zeros(1, 5) 2 1 zeros(1, 5) 1 1 zeros(1, 6)]';

for j=1:N-1
    r=rand(1, 1);
    
    if(r<=0.6)
        i=1;
        e(:, j+1)=((A^i)-(A^(i-1))*L1*C)*e(:, j);
    elseif(r>0.6 && r<=0.7)
        i=2;
        e(:, j+1)=((A^i)-(A^(i-1))*L2*C)*e(:, j);
    elseif(r>0.7 && r<=0.85)
        i=3;
        e(:, j+1)=((A^i)-(A^(i-1))*L3*C)*e(:, j);
    elseif(r>0.85 && r<=0.95)
        i=4;
        e(:, j+1)=((A^i)-(A^(i-1))*L4*C)*e(:, j);
    elseif(r>0.95 && r<=1)
        i=5;
        e(:, j+1)=((A^i)-(A^(i-1))*L5*C)*e(:, j);
    end
    t(j+1)=t(j)+i*T;
    
end

figure1=figure;
axes1 = axes('Parent',figure1,'FontSize',26);
xlim(axes1,[0 10]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');
% Create plot
stairs(t,e(7, :),'Color',[1 0 0],'LineWidth',3);
% Create title
ylabel('e_{7} (rad)')
xlabel('Time (sec)')
title('Error between Actual and Observed \delta_{21}','FontSize',20);


figure2=figure;
axes2 = axes('Parent',figure2,'FontSize',26);
xlim(axes2,[0 10]);
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'all');
% Create plot
stairs(t,e(14, :),'LineWidth',3,'Color',[1 0 0]);
% Create title
ylabel('e_{14} (rad)')
xlabel('Time (sec)')
title('Error between Actual and Observed \delta_{31}','FontSize',20);

figure4=figure;
axes4 = axes('Parent',figure4,'FontSize',26);
xlim(axes4,[0 10]);
box(axes4,'on');
grid(axes4,'on');
hold(axes4,'all');
% Create plot
stairs(t,e(21, :),'LineWidth',3,'Color',[1 0 0]);
% Create title
ylabel('e_{21} (p.u.)')
xlabel('Time (sec)')
title('Error between Actual and Observed Xc','FontSize',20);
