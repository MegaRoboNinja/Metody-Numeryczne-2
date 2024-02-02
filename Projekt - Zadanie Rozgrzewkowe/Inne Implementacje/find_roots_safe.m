function roots = find_roots_safe(func, left, right, intrv_number)

intervals = linspace(left, right, intrv_number);
roots = zeros(2000, 1);

len = length(intervals);
which_intervals = find((func(intervals(1:len-1)).*func(intervals(2:len))<0) & 0==imag(func(intervals(1:len-1))) & 0==imag(func(intervals(2:len))) );

nextInd=1;
for i = which_intervals
    new_root = bisection_classic(func, intervals(i), intervals(i+1));
    roots(nextInd) = new_root;
    nextInd=nextInd+1;
end

roots = roots(1:nextInd-1);
end