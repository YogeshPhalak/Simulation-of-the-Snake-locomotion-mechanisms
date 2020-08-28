close all;
clc;
clear;

x0=15;y0=0;

n=40;
l=1;

r  = zeros(2,n+1); r(:,1)=[x0;y0];

figure();
hold on;
grid on;
axis equal;
axis([-40,40,-40,40]);

delT=0.01;

a = 0;
pth=0;



for t=0:delT:20

th = inputs(n,a);    
th(1)=th(1)+ pth;

for i=2:length(r)
    
    temp =[0;0];
    
    for j=1:i-1
        temp  = temp + l*[cos(sum(th(1:j)));sin(sum(th(1:j)))];     
    end
    
    r(:,i) = r(:,1) + temp;
end

snake = zeros();

for i = 1:n-1    
    snake(i) = line([r(1,i),r(1,i+1)],[r(2,i),r(2,i+1)],'LineWidth',width(i,n,l),'color','0,0,0,0.8');
end

pause(delT);
 
 delete(snake);
 
 r(:,1:n)=r(:,2:n+1);
 a=a+1;
 pth = th(1);
 
end


function th = inputs(n,a)

    th = zeros(1,n);
    
    phase = 0.03;
    
    for i=1:length(th)
        th(i)= 4.5*pi/n*sin(4*pi/(n+1)*(i+a))+phase;
    end
    
    
end

function w = width(i,n,l)
    a = 3*1.8/l;
    b = 0.00205;
    t = -1*n*2/3;
    w = a*exp(-b*(i+t)^2);
end
