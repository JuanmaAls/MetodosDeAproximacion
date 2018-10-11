clear variables;
clc;
syms x;%Declaramos a X como variable de la funcion
f=input('Ingrese la funcion f(x)= ');
desde=input('Ingrese el valor desde el cual quiere graficar: ');
hasta=input('Ingrese el valor hasta el cual quiere graficar: ');
inc=input('Ingrese el incremento: ');
[inta,intb]=tanteo(desde,hasta,inc,f);%realizamos un tanteo automatico de la funcion.
%OPCIONES
disp('');
resp=input('¿Desea ver continuar y ver OPCIONES? 1=SI 0=NO...');%si desea contuniar, mostramos las opciones.
while resp~=0
fprintf('OPCIONES\n');
fprintf('Metodos de aproximacion hacia la raiz de la funcion:\n');
fprintf('1) Metodo del intervalo medio.\n');
fprintf('2) Metodo de interpolacion lineal.\n');
fprintf('3) Metodo de Newton-Raphson.\n');
fprintf('4) Metodo de Newton de  2do Orden.\n');
fprintf('5) Tanteo.\n');
opc=input('Ingrese que metodo de aproximacion desea usar para acercarse a la raiz: ');
hold on;
plot([inta intb],[0 0],'k');%Graficamos el eje x con nuestros sub-intervalos
switch opc
    case 1
        err=input('Ingrese el error que desea como referencia: ');
        intervaloMedio(inta,intb,err,f);
    case 2
        err=input('Ingrese el error que desea como referencia: ');
        interpolacionLineal(inta,intb,err,f);
    case 3
        err=input('Ingrese el error que desea como referencia: ');
        newtonRaphson(inta,intb,err,f);
    case 4
        err=input('Ingrese el error que desea como referencia: ');
        newton2doOrden(inta,intb,err,f);
    case 5
        desde=input('Ingrese el valor desde el cual quiere graficar: ');
        hasta=input('Ingrese el valor hasta el cual quiere graficar: ');
        inc=input('Ingrese el incremento: ');
        [inta,intb]=tanteo(desde,hasta,inc,f);
end 
resp=input('¿Desea ver continuar y ver OPCIONES? 1=SI 0=NO...');
end