function [ X,Y ] = newtonRaphson( p_a,p_b,p_e,p_pol )
tic
x(1)=p_a;
y(1)=subs(p_pol,p_a);%Valuamos la funcion p_pol en el punto p_a
e(1)=y(1);
if y(1)==0%verificamos si la funcion es raiz en el punto a
   r(1)=x(1);
else
    r(1)=0;
end
x(2)=p_b;
y(2)=subs(p_pol,p_b);%Valuamos la funcion p_pol en el punto p_b
e(2)=abs(y(1)-y(2));
if y(2)==0%verificamos si la funcion es raiz en el punto b
   r(2)=x(2);
else
    r(2)=0;
end
%Derivada de primer orden de la funcion
fx=diff(p_pol);
%Derivada de segundo orden de la funcion
fxx=diff(p_pol);
%Verificamos condiciones
if  y(1)*y(2)<0
    if y(1)==0 && y(2)==0%Verificamos si los puntos son raices
        fprintf('Ambos puntos son raices. Imposible aproximar');
    elseif y(1)*subs(fxx,x(1))>0%Verificamos la condicion de convergencia
        x(2)=x(1)-(y(1)/subs(fx,x(1)));
        y(2)=subs(p_pol,x(2));
        if y(2)==0%verificamos si la funcion es raiz en el punto
            r(2)=x(2);
        else
           r(2)=0; 
        end
        i=2;
        while p_e<abs(y(i)-y(i-1))%Condicion para terminar la iteracion
            x(i+1)=x(i)-(y(i)/subs(fx,x(i)));
            y(i+1)=subs(p_pol,x(i+1));
            r(i+1)=0;
            e(i+1)=abs(y(i+1)-y(i));
            X=x(i+1);
            Y=y(i+1);
            if y(i+1)==0%verificamos si la funcion es raiz en el punto
                r(i+1)=x(i+1);
            end
            i=i+1;
        end
    elseif y(2)*subs(fxx,x(2))>0%Verificamos la condicion de convergencia
        x(1)=x(2);%Cambiamos los valores de los vectores una posicion atras.
        y(1)=y(2);
        r(1)=r(2);
        e(1)=y(2);
        x(2)=x(1)-(y(1)/subs(fx,x(1)));
        y(2)=subs(p_pol,x(2));
        e(2)=abs(y(1)-y(2));
        if y(2)==0%verificamos si la funcion es raiz en el punto
            r(2)=x(2);
        else
           r(2)=0; 
        end
        i=2;
        while p_e<abs(y(i)-y(i-1))%Condicion para terminar la iteracion
            x(i+1)=x(i)-(y(i)/subs(fx,x(i)));
            y(i+1)=subs(p_pol,x(i+1));
            r(i+1)=0;
            e(i+1)=abs(y(i+1)-y(i));
            X=x(i+1);
            Y=y(i+1);
            if y(i+1)==0%verificamos si la funcion es raiz en el punto
                r(i+1)=x(i+1);
            end
            i=i+1;
        end
    else
        fprintf('No se puede converger hacia a la raiz');
    end
else
    fprintf('No se puede converger hacia a la raiz');
end
toc
fprintf('|  i  |    X    |   F(X)   |Raiz| Error |\n');
for i=1:length(x)%Recorremos los vectores para imprimir.
   fprintf('| %2d  |',(i-1));
   fprintf('%2.5f |',x(i));
   fprintf('%2.5f |',y(i));
   if r(i)==0
        fprintf(' NO |');
    else
        fprintf(' SI |');
   end
    fprintf('%1.5f |\n',e(i));
end
plot(x,y,'g*');
title('Aproximacion por Newton-Raphson');
xlabel('eje x');
ylabel('eje y');
grid;
end

