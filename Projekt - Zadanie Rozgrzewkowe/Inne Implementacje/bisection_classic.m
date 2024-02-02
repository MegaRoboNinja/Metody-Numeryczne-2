function [root] = bisection_classic(f, left, right)
% finds one root in given interval
% assumes there must be one (otherwise it gives right bound)
MAXI = 50;
PREC = eps * 800;
i=0;
root = NaN;

while ( i < MAXI )
    middle = (left+right)/2;
    if(f(middle) == 0 || ((right-left) < PREC) )
        root = middle;
        i = MAXI;
    else
        if (f(middle)*f(left)<0) 
            right = middle;
        else 
            left = middle; 
        end
    end
    i=i+1;
end
end