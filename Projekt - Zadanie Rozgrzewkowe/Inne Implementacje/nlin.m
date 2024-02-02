function roots = nlin(func)
% nlin finds roots of the given function
roots = zeros(15000,1);
next_ind=1;

bounds_vctr = [logspace(-2, 10, 13) 10^18];
bounds_vctr = [-1*bounds_vctr(length(bounds_vctr):-1:1) bounds_vctr];
intrv_nums = 200000;

for i = 1:length(bounds_vctr)-1
    new_roots = find_roots_2(func, bounds_vctr(i), bounds_vctr(i+1), intrv_nums);
    roots(next_ind:next_ind+length(new_roots)-1) = new_roots;
    next_ind = next_ind + length(new_roots);
end
roots = roots(1:next_ind-1);
end