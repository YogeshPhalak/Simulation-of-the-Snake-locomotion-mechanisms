close all;
clc;
clear;

x0=0;y0=0;

l=1;
n=5;

r  = zeros(2,n+1); r(:,1)=[x0;y0];
dr = zeros(2,n+1);
rdot=zeros(2,n+1);

vtan=zeros(2,n+1);
vnor=zeros(2,n+1);

fric=zeros(2,n+1);
mu = 0;

rddot=zeros(2,n+1);

figure();
hold on;
grid on;
axis equal;
axis([-20,20,-20,20]);


rdot(:,1)=[0;0];
rddot(:,1)=[0;0];

rddotcm=[0;0];
alphacm=0;
omegacm=0;
thetacm=0;
m=1;
Icm=0;

th = zeros(1,n);

delT=0.005;

for t=0:delT:20

    [th,thdot,thddot] = inputs(t,n,th(1));
    
    dr(:,1)=[-cos(th(1));-sin(th(1))];
    
for i=2:length(r)
    
    temp =[0;0];
    temp1=[0;0];
    temp2=[0;0];
    
    for j=1:i-1
        temp  = temp+l*[cos(sum(th(1:j)));sin(sum(th(1:j)))];
        temp1 = temp1+l*[-sin(sum(th(1:j)));cos(sum(th(1:j)))]*sum(thdot(1:j));
        temp2 = temp2+ l*[-cos(sum(th(1:j)));-sin(sum(th(1:j)))]*sum(thdot(1:j))^2 ...
        + l*[-sin(sum(th(1:j)));cos(sum(th(1:j)))]*sum(thddot(1:j));     
    end
    
    r(:,i)   = r(:,1)+temp;
    rdot(:,i)= rdot(:,1)+temp1;
    rddot(:,i)=rddot(:,1)+temp2;
    dr(:,i)=(r(:,i-1)-r(:,i))/norm((r(:,i-1)-r(:,i)));
end

for i=1:length(rdot)
    vtan(:,i)= dot(rdot(:,i),dr(:,i))*dr(:,i);
    vnor(:,i)= rdot(:,i)- vtan(:,i);
    
    for j=1:length(r)
        r(:,j)= r(:,j)-vnor(:,i)*delT;
    end
end


    
fric = -mu*vnor;

Icm=0;
trq=0;
for i=1:length(r)
    Icm=Icm+m*norm(r)^2;
    temp = cross([r(:,i)-r(:,1);0],[fric(:,i);0]);
    trq=trq+temp(3);
end

% alphacm = trq/Icm;
% rddotcm = 1/n*sum(transpose(fric))';
% 
% rcm1= r(:,1)-1/n*sum(transpose(r))';
% 
% temp = cross([rcm1;0],[0,0,alphacm]);
% rddot(:,1)=rddotcm+[temp(1);temp(2)];
% 
% rdot(:,1)= rdot(:,1)+rddot(:,1)*delT;
% r(:,1)= r(:,1)+rdot(:,1)*delT;
% a = r(:,2)-r(:,1);
% th(1)= atan2(a(2),a(1));

snake = plot(r(1,:),r(2,:),'-o','MarkerSize',1,'MarkerFaceColor','green',...
    'LineWidth',2,'color','0,0,0');


%fig=zeros(length(rdot),4);

%     for i=1:length(rdot)
%          fig(i,1) = line([r(1,i),0.5*rdot(1,i)+r(1,i)],[r(2,i),0.5*rdot(2,i)+r(2,i)],...
%      'LineWidth',1,'color','1,0,0');
% %          fig1(i) = line([r(1,i),0.5*dr(1,i)+r(1,i)],[r(2,i),0.5*dr(2,i)+r(2,i)],...
% %      'LineWidth',1,'color','0,1,0');
%          fig(i,2) = line([r(1,i),0.5*vtan(1,i)+r(1,i)],[r(2,i),0.5*vtan(2,i)+r(2,i)],...
%      'LineWidth',1,'color','0,1,0');
%          fig(i,3) = line([r(1,i),0.5*vnor(1,i)+r(1,i)],[r(2,i),0.5*vnor(2,i)+r(2,i)],...
%      'LineWidth',1,'color','0,0,1');
%          fig(i,4) = line([r(1,i),fric(1,i)+r(1,i)],[r(2,i),fric(2,i)+r(2,i)],...
%      'LineWidth',1,'color','1,0.5,1');
%     end

 

 pause(0.001);
 %delete(fig);
 
 delete(snake);
 
end

function [th,thdot,thddot] = inputs(t,n,th0)

    th = zeros(1,n); th(1)=th0;
    thdot = zeros(1,n);
    thddot= zeros(1,n);
    
    for i=2:length(th)
        th(i)= pi/3*sin(4*pi/(n+1)*i+3*t);
    end
    
    for i=2:length(thdot)
        thdot(i)= 3*pi/3*cos(4*pi/(n+1)*i+3*t);
    end
    
    for i=2:length(thddot)
        thddot(i)= -9*pi/3*sin(4*pi/(n+1)*i+3*t);
    end
end
