function [ a,b ] = tanteo( p_a,p_b,p_inc,p_pol )
clc;
%p_a es el parametro del punto a de la funcion
%p_b es el parametro del punto b de la funcion
%p_inc es el incremento que utilizamos desde a hasta b
%p_pol es el polinomio
% fx=polyval(p_pol,p_a);%evaluamos el valor de la funcion p_pol en el punto p_a
tic
fx=subs(p_pol,p_a);%Evaluamos la funcion p_pol en el punto p_a
x=p_a:p_inc:p_b;%Definimos el vector X.
a=0;
b=0;
if fx>0%si nuestra funcion tiene valor positivo desde el parametro a
    i=1;
    for j=p_a:p_inc:p_b
%         y(i)=polyval(p_pol,j);
        y(i)=subs(p_pol,j);
        r(i)=0;
        if i>1
        if y(i)<0 && y(i-1)>0%si nuestra funcion en este punto pasa a tener valor negativo y en el punto anterior es positivo
            a=j-p_inc;%guardamos nuestros intervalos obtenidos en el tanteo
            b=j;
        elseif y(i)==0 %Si estamos en una raiz entonces seleccionamos el punto anterior y siguiente como intervalos.
            r(i)=x(i);
            a=j-p_inc;
            b=j+p_inc;
        end
        end
        i=i+1;
    end
elseif fx<0
    i=1;
    for j=p_a:p_inc:p_b
%         y(i)=polyval(p_pol,j);
        y(i)=subs(p_pol,j);
        r(i)=0;
        if i>1
        if y(i)>0 && y(i-1)<0%lo mismo que en el for anterior pero con condiciones inversas
            a=j-p_inc;%guardamos nuestros nuevos intervalos
            b=j;
        elseif y(i)==0%Si estamos en una raiz entonces seleccionamos el punto anterior y siguiente como intervalos.
            r(i)=x(i);
            a=j-p_inc;
            b=j+p_inc;
        end
        end
        i=i+1;
    end
else
    fprintf('Estas sobre una raiz');
end
toc
fprintf('|  i  |    X    |   F(X)   |Raiz|\n');
j=1;
for i=p_a:p_inc:p_b%Recorremos todos los vectores para imprimir.
    fx=subs(p_pol,i);
    fprintf('|%3d  ',j);
    fprintf('|%2.5f |',i);
    fprintf('%4.5f  |',fx);
    if r(j)==0
        fprintf(' NO |\n');
    else
        fprintf(' SI |\n');
    end
    j=j+1;
end
fprintf('El intervalo donde cambian los signos de la funcion son a: %2.4f',a);
fprintf(' y b: %2.4f\n',b);
hold on;
plot(x,y);
y0=x.*0;
plot(x,y0,'r');
title('Grafica del Tanteo');
xlabel('eje x');
ylabel('eje y');
hold off;
grid;
end

