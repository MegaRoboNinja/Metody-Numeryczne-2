function drawTriangle(p, colour, lineWidth)
if nargin == 1 
    colour = 'r';
else 
    if nargin == 2
        lineWidth = 2;
    end
end
% narysujmy trójkąt - obszar całkowania
line(p(1:2,1), p(1:2,2), 'Color', colour, 'LineWidth', lineWidth);
line(p(2:3,1), p(2:3,2), 'Color', colour, 'LineWidth', lineWidth);
line(p(1:2:3,1),p(1:2:3,2), 'Color', colour, 'LineWidth', lineWidth);

end