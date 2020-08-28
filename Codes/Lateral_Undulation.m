close all;
clc;
clear;

x0=10;y0=-15; 

n=45;
l=2;

r  = zeros(2,n+1); r(:,1)=[x0;y0]; % position vectors;

figure();
%set(gcf,'WindowState','maximized');


hold on;
grid on;
axis equal;
axis([-40,40,-40,40]);
delT=0.01;
th = zeros(1,n);
a=n;

%initialization

for i=1:length(th)
    th(i) = gait(i);
end

%th(1)=th(1)-5*pi/16;
%th(1)=th(1)-pi/4;
th(1)=th(1)-3*pi/8-pi/64;

for t=0:delT:1.8
    
% co ordinates
for i=2:length(r)
    
    temp =[0;0];
    
    for j=1:i-1
        temp  = temp + l*[cos(sum(th(1:j)));sin(sum(th(1:j)))];     
    end
    
    r(:,i) = r(:,1) + temp;
end

headPos=[r(:,n+1);sum(th)];
% Head Shape
headX = [headPos(1)-4*cos(headPos(3)),...
         headPos(1)-4*cos(headPos(3))+0.2*2*sin(headPos(3)),...
         headPos(1)+1*cos(headPos(3))+0.8*2*sin(headPos(3)),...
         headPos(1)+4*cos(headPos(3)),...
         headPos(1)+1*cos(headPos(3))-0.8*2*sin(headPos(3)),...
         headPos(1)-4*cos(headPos(3))-0.2*2*sin(headPos(3)),...
         headPos(1)-4*cos(headPos(3))];
     
headY = [headPos(2)-4*sin(headPos(3)),...
         headPos(2)-4*sin(headPos(3))-0.2*2*cos(headPos(3)),...
         headPos(2)+1*sin(headPos(3))-0.8*2*cos(headPos(3)),...
         headPos(2)+4*sin(headPos(3)),...
         headPos(2)+1*sin(headPos(3))+0.8*2*cos(headPos(3)),...
         headPos(2)-4*sin(headPos(3))+0.2*2*cos(headPos(3)),...
         headPos(2)-4*sin(headPos(3))];

% draw snake
snake = zeros(n,2);

for i = 1:n-1    
    snake(i,1) = line([r(1,i),r(1,i+1)],[r(2,i),r(2,i+1)],'LineWidth',...
        width(i,l),'color','0,0,0,1.0');
end
for i=ceil(n/4):n
    snake(i,2) = line([r(1,i),r(1,i+1)],[r(2,i),r(2,i+1)],'LineWidth',...
        2,'color','0,1,0,0.5');
end


head = fill(headX,headY,[0,0,0]);


pause(delT);

delete(snake);
delete(head);


r(:,1:n)=r(:,2:n+1);
 
a=mod(a+1,40);
th(1)=th(1)+ th(2);
th(2:n-1)=th(3:n);
th(n)= gait(a);

end


function th = gait(i) % Gait Equation
    n = 40;    
    i = mod(i,n+1);
    
    %phase = 0;
    %phase = 0.05;
    %phase = 0.06;
    phase = 0.07;
    
    %th= 4.5*pi/n*sin(4*pi/(n+1)*(i))+phase;
    %th= 3.5*pi/n*sin(4*pi/(n+1)*(i))+phase;
    th= 5.5*pi/n*sin(4*pi/(n+1)*(i))+phase;
    
end


function w = width(i,l) % Snake Shape Function 
    n = 50;
    a = 16/l;
    b = 0.003;
    t = -1*n*2/3;
    w = a*exp(-b*(i+t)^2);
end