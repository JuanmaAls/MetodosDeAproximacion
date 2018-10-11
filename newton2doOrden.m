function [ X,Y ] = newton2doOrden( p_a,p_b,p_e,p_pol )
tic
x(1)=p_b;%X1
y(1)=subs(p_pol,x(1));%Y1
if y(1)==0
    r(1)=x(1);
else
    r(1)=0; 
end
fx=diff(p_pol);%f'(X1)
fxx=diff(p_pol);%f''(X1)
yx=subs(fx,x(1));%y'
yxx=subs(fxx,x(1));%y''
x(2)=x(1)-(y(1)/(yx-(yxx*y(1)/(2*yx))));%X2
X=x(2);
y(2)=subs(p_pol,x(2));%Y2
Y=y(2);
if y(2)==0
    r(2)=x(2);
else
    r(2)=0; 
end
i=2;
while p_e<=abs(y(i)-y(i-1))
    yx=subs(fx,x(i));
    yxx=subs(fxx,x(i));
    x(i+1)=x(i)-(y(i)/(yx-(yxx*y(i)/(2*yx))));%Xi+1;
    X=x(i+1);
    y(i+1)=subs(p_pol,x(i));%Yi+1
    Y=y(i+1);
    if y(i+1)==0
        r(i+1)=x(i+1);
    else
        r(i+1)=0; 
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
plot(x,y,'y*');
title('Aproximacion por Newton de 2do orden');
xlabel('eje x');
ylabel('eje y');
grid;
end

