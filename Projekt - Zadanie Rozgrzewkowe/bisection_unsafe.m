function root = bisection_unsafe(f, left, right, fl, fr)
MAXI = 50;
PREC = eps * 1000;
i=0;

while ( i<MAXI )
    middle = (left+right)/2;
    % f_middle=f(middle);
    if((right-left) < PREC * max(1,abs(middle)))
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

root = middle;
