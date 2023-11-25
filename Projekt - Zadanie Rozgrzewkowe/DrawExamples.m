% NOTES:

%   maximum matlab value is approx. 1.7977 × 10^308

% TEST 1...
% @(x)exp(x)-2: OK
% @(x)log(x)-sin(x): OK
% @(x)cos(4*acos(x)): OK
% @(x)exp(x/3333)-1/2: OK
% @(x)pi+sin(x)-log(x.^2+1): OK
% @(x)x.*sin(1./x)-1/16: OK

x = linspace(-10000, 10000, 1000000);

subplot(3, 2, 1);
f = @(x)exp(x)-2;
plot(x,f(x));
title('exp(x)-2')

subplot(3, 2, 2);
f = @(x)log(x)-sin(x);
plot(x,f(x));
title('log(x)-sin(x)')

subplot(3, 2, 3);
f = @(x)cos(4*acos(x));
plot(x,f(x));

subplot(3, 2, 4);
f = @(x)exp(x/3333)-1/2;
plot(x,f(x));

subplot(3, 2, 5);
f = @(x)pi+sin(x)-log(x.^2+1);
plot(x,f(x));

subplot(3, 2, 6);
f = @(x)x.*sin(1./x)-1/16;
plot(x,f(x));
