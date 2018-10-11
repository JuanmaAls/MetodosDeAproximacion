function [ Xn,FXn ] = interpolacionLineal( p_a,p_b,p_e,p_pol )
tic
x(1)=p_a;
% y(1)=polyval(p_pol,p_a);
y(1)=subs(p_pol,p_a);
r(1)=0;
x(2)=p_b;
% y(2)=polyval(p_pol,p_b);
y(2)=subs(p_pol,p_b);
r(2)=0;
i=2;
while p_e<abs(y(i)-y(i-1))
    x(i+1)=(x(i-1)*y(i)-x(i)*y(i-1))/(y(i)-y(i-1));
%     y(i+1)=round(polyval(p_pol,x(i+1)),5);
    y(i+1)=subs(p_pol,x(i+1));
    r(i+1)=0;
    Xn=x(i+1);
    FXn=y(i+1);
    if y(i+1)==0
       r(i+1)=x(i+1); 
    end
    i=i+1;
end
toc
fprintf('|  i  |    X    |   F(X)   |Raiz|\n');
for i=1:length(x)
   fprintf('| %2d  |',i);
   fprintf('%2.5f |',x(i));
   fprintf('%2.5f |',y(i));
   if r(i)==0
        fprintf(' NO |\n');
    else
        fprintf(' SI |\n');
    end
end
plot(x,y,'b*');
title('Aproximacion por Interpolacion Lineal');
xlabel('eje x');
ylabel('eje y');
grid;
end

