function root = bisection_imprvd(f, left, right)
% finds a couple roots in the interval
% if there aren't any it will return NaN (we only added a safety check)
MAXI = 10000;
PREC = eps * 5000;
i=0;
root = NaN;

if (f(left)*f(right)<0) 
    while ( i<MAXI )
        middle = (left+right)/2;
        if(f(middle) == 0 || (right-left) < PREC)
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