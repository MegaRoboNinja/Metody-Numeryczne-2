function isIt = isInTriangle(pt ,p)

d1 = sign([pt;p(1,:);p(2,:)]);
d2 = sign([pt;p(2,:);p(3,:)]);
d3 = sign([pt;p(3,:);p(1,:)]);

has_neg = (d1 < 0) || (d2 < 0) || (d3 < 0);
has_pos = (d1 > 0) || (d2 > 0) || (d3 > 0);

isIt = ~(has_neg && has_pos);
end %function isInTriangle

function r = sign(p)
    r = ...
    ((p(1,1) - p(3,1)) * (p(2,2) - p(3,2))...
    - (p(2,1) - p(3,1)) * (p(1,2) - p(3,2)));
end %function sign
