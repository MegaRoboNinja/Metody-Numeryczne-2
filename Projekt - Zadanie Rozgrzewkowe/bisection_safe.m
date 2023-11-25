function root = bisection_safe(f, left, right, fl, fr)
% finds at most one root in the interval
% if there isn't one it will return NaN (we only added a safety check)
% otherwise it's identical to bisection_classic
MAXI = 50;
PREC = eps * 1000;
i=0;
root = NaN;
%sign(f(left))~=sign(f(right)) bez sensu

%wywalić ten warunek poza funkcję!!!
if (fl*fr<0 && isreal(fl) && isreal(fr)) 
    while ( i<MAXI )
        middle = (left+right)/2;
        f_middle = f(middle);
        if(f_middle == 0 || (right-left) < PREC)
            i = MAXI;
        else
            if (f_middle*f(left)<0) 
                right = middle;
            else 
                left = middle; 
            end
        end
        i=i+1;
    end
    root = middle;
end