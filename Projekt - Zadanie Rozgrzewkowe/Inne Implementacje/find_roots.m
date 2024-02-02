function roots = find_roots(func, left, right, intrv_number)
roots=zeros(2000,1);
intervals = linspace(left, right, intrv_number);
f_bounds = func(intervals);
nextInd=1;
for i = 1:intrv_number-1
    new_root = bisection_safe(func, intervals(i),intervals(i+1), f_bounds(i), f_bounds(i+1));
    if(~isnan(new_root))
        roots(nextInd) = new_root;
        nextInd = nextInd+1;
    end
end

roots = roots(1:nextInd-1);
end