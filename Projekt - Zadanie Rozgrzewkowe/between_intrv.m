function result = between_intrv(a, b, x)
% if x is between a and b then returns 1 else returns 0
    if(a <= b)
        result = x >= a && x <= b;
    else
        result = x <= a && x >= b;
    end
end