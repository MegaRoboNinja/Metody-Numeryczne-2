clear;
% test 1
tspan=[0 10];
H=tspan(2)-tspan(1);
y0 = [1];
n_max=16;
f_rozw=@(x)1./(exp(x));
pkt=2.^(1:n_max);
bledy=zeros(1,n_max);
%for i=1:n_max
%    [t1, y1]=P2Z42_MSC(@(x) [1;1], @(x) 0, tspan, pkt(i), y0);
%    bledy(i)=max(abs(y1-f_rozw(t1)));
%end
[t1, y1]=P2Z42_MSC(@(x) [1;1], @(x) 0, tspan, 2048, y0);
blad1=max(abs(y1-f_rozw(t1)));
[t1, y1]=P2Z42_MSC(@(x) [1;1], @(x) 0, tspan, 4096, y0);
blad2=max(abs(y1-f_rozw(t1)));
disp(blad1/blad2);

% [t1, y1]=RKtest(@(x) [1;1], @(x) 0, tspan, 2048, y0);
% blad1=max(abs(y1-f_rozw(t1)));
% [t1, y1]=RKtest(@(x) [1;1], @(x) 0, tspan, 4096, y0);
% blad2=max(abs(y1-f_rozw(t1)));
% disp(blad1/blad2);



%h=H./pkt;
%disp(bledy(1:end-1)./bledy(2:end));
%disp(size(h));
%disp(size(bledy));
%loglog(h,bledy);







%[t, y] = ode45(@(t, y) -y, tspan, 1);


[t,y]=P2Z42_MSC(@(x) [1;1], @(x) 0, tspan, 1000, y0);
dydx = @(x, y) [y(2); x - y(1) - y(2)];
%[t, y] = ode45(dydx, tspan, y0);

plot(t,y);
hold on
%plot(t1, y1);
fplot(@(x)1./(exp(x)),tspan );