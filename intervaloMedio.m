function [ a,b ] = intervaloMedio( p_a,p_b,p_e,p_pol )
%p_a parametro del extremo a
%p_b parametro del extremo b
%p_e parametro de error deseado
%p_pol parametro del polinimio
tic
a=p_a;
b=p_b;
iteraciones=round(log2((p_b-p_a)/p_e));%Calculamos la cantidad de iteraciones
fx=subs(p_pol,p_a);%Valuamos la funcion p_pol en el punto p_a
x(1)=round((a+b)/2,5);%Obtenemos los primeros valores
y(1)=subs(p_pol,x(1));
r(1)=0;
e(1)=abs(p_e-y(1));
if fx>0
    if y(1)>0 && x(1)>a%Verificamos en que extremos reemplazamos nuestra nueva X
        a=x(1); 
    elseif y(1)<0 && x(1)<b
        b=x(1);
    elseif y(1)==0
        r(1)=x(1);
    end
elseif fx<0
    if y(1)<0 && x(1)>a%Verificamos en que extremos reemplazamos nuestra nueva X
        a=x(1); 
    elseif y(1)>0 && x(1)<b
        b=x(1);
    elseif y(1)==0
        r(1)=x(1);
    end
else
    
end
if fx>0%si nuestra funcion tiene valor positivo desde el parametro a
    i=1;
    while i<=iteraciones && p_e<abs(y(i))%Condiciones para terminar la iteracion
        i=i+1;
        x(i)=round((a+b)/2,5);
        y(i)=subs(p_pol,x(i));
        r(i)=0;
        e(i)=abs(p_e-y(i));
        if y(i)>0 && x(i)>a%Verificamos en que extremos reemplazamos nuestra nueva X
            a=x(i); 
        elseif y(i)<0 && x(i)<b
            b=x(i);
        elseif y(i)==0
            r(i)=x(i);
        end  
    end
elseif fx<0
    i=1;
    while i<=iteraciones && p_e<abs(y(i))%Condiciones para terminar la iteracion
        i=i+1;
        x(i)=round((a+b)/2,5);
        y(i)=subs(p_pol,x(i));
        r(i)=0;
        e(i)=abs(p_e-y(i));
        if y(i)<0 && x(i)>a%Verificamos en que extremos reemplazamos nuestra nueva X
            a=x(i);
        elseif y(i)>0 && x(i)<b
            b=x(i);
        elseif y(i)==0
            r(i)=x(i);
        end
    end
else
    fprintf('Estas sobre una raiz');
end
toc
fprintf('|  i  |    X    |   F(X)   |Raiz| Error |\n');
for i=1:length(x)%Recorremos los vectores para realizar la impresion
   fprintf('| %2d  |',i);
   fprintf('%2.5f |',x(i));
   fprintf('%2.5f |',y(i));
   if r(i)==0
        fprintf(' NO |');
    else
        fprintf(' SI |');
   end
   fprintf('%1.5f |\n',e(i));
end
fprintf('La funcion se aproxima hasta el punto %2.5f en el intervalo A',a);
fprintf(' y hasta el punto %2.5f en el intervalo B\n',b);
plot(x,y,'*r');
title('Aproximacion por Intervalo Medio');
xlabel('eje x');
ylabel('eje y');
grid;
end

