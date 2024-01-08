function [t,y] = P2Z42_MSC(a,b,span,n, Y0)
% Projekt 2, zadanie 42
% Marcin Ścisłowski 313937
%
% Rozwiązywanie dowolnego liniowego równania różniczkowego metodą
% Rungego-Kutty rzędu 3-go postaci:
% a_m(x)y_m+a_(m-1)(x)y_(m-1)+...+a_1(x)y_1+a_0(x)y=b(x), 
% gdzie y_m oznacza m-tą pochodną y 
% Wejście:
%   a    - uchwyt do funkcji przyjmującej skalar x i zwracający 
%          wektor postaci [a_0(x); a_1(x),...a_m(x)], gdzie a_m(0)!=0
%   b    - uchwyt do funkcji działającej na skalarach i wektorach 
%          odpowiadającej b
%   span - 2-elementowy wektor liczb rzeczywistych wyznaczający przedział
%          na którym zostanie wyznaczone rozwiązanie (element 1 to lewa
%          granica przedziału, element 2 to prawa granica przedziału)
%   n    - skalar, liczba kroków do wykonania
%   Y0   - pionowy wektor liczb rzeczywistych, warunki początkowe postaci [y0_0; y1_0;...;y{m-1}_0] 
% Wyjście:
%   y    - macierz rozwiązań w chwilach 0,1,...,n
%   t    - wektor chwil w których wyznaczone zostały rozwiązania
t=linspace(span(1), span(2), n);
h=(span(2)-span(1))/n;
y=zeros(length(Y0), n);

for i=1:n
    y(:,i)=Y0;
    %Y0=Ynext(Y0,t(i),a,b,h);
    Y0=Ynext1(Y0,t(i),a,b,h);
end
y(:,n)=Y0;
end


function [y_m] = f(Y,x,a,b)
Apom=a(x);
a_m=Apom(end);

A=Apom(1:end-1);
y_m= (b(x)-sum(A.*Y))/a_m;
end

function [Y_new]=F(Y,x,a,b)
Y_new=[Y(2:end); f(Y,x,a,b)];

%f(Y,a,b);
%Y_new=Y;
end


function [yOut]=Ynext1(y,x,a,b,h)
k1 = h * F(y, x,a,b);
k2 = h * F(y + k1 / 2, x + h / 2,a,b);
k3 = h * F(y - k1 + 2 * k2, x + h,a,b );
yOut = y + (k1 + 4 * k2 + k3) / 6;
end


function [K]=K012(Y,x,a,b,h)
gamma1_0=1/2;
gamma2_0=-1;
gamma2_1=2;


%alfa=
%gamma1_0=1/3;
%gamma2_0=0;
%gamma2_1=2/3;

%gamma1_0=1;
%gamma2_0=0;
%gamma2_1=0;



K0=F(Y,x,a,b);
%K1=F(Y+h*gamma1_0*K0,x,a,b);
%K2=F(Y+h*(gamma2_0*K0+gamma2_1*K1),x,a,b);
K1=F(Y+h*gamma1_0*K0,x+h/2,a,b);
K2=F(Y+h*(gamma2_0*K0+gamma2_1*K1),x+h,a,b);
K=[K0 K1 K2];
end

function [Y_new]=Ynext(Y,x,a,b,h)
c0=1/6;
c1=2/3;
c2=1/6;

%c0=1/4;
%c1=0;
%c2=3/4;

%c0=1/2;
%c1=1/2;
%c2=0;

K=K012(Y,x,a,b,h);
K0=K(:,1);
K1=K(:,2);
K2=K(:,3);
Y_new=Y+h*(c0*K0+c1*K1+c2*K2);
end


