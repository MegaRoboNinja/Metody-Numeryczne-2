fprintf("============================== EKSPERYMENT NUMERYCZNY 2" + ...
        " ===============================\n\n");
fprintf("Porównanie błędu dla różnych wartości n\n");

fprintf("Obszar całkowania" + ...
        " - trójkąt o wierzchołkach (0,0), (2,0), (2,2)\n");
p = [ 0,0 ; 2,0 ; 2,2 ];
tic
nspan = 1:10:300;
errPerc = zeros(length(nspan),1);
func = @(x,y) sin(x)*sin(y);
for i = 1:length(nspan)
    fprintf("dla n = %d\n\n", nspan(i));
    [~, errPerc(i)] = ...
        compare(func, p, nspan(i), 'sin(x)*sin(y)', 2*sin(1)^4);
end
figure(2)
loglog(nspan, errPerc, LineWidth=2);
xlabel('n') 
ylabel('Błąd') 
toc

% %Funkcja f(x,y) = x^3 + y^4
% func = @(x,y) x^3 + y^4;
% for i = 1:length(nspan)
%     fprintf("dla n = %d\n\n", nspan(i));
%     [~, errPerc(i)] = ...
%         compare(func, p, nspan(i), 'x^3 + y^4', 8.5 + 1/30);
% end
% figure(1)
% % loglog(nspan, errPerc, LineWidth=2);
% % xlabel('n') 
% % ylabel('Błąd') 
% toc

% func = @(x,y) x^41 + y^37;
% for i = 1:length(nspan)
%     fprintf("dla n = %d\n\n", nspan(i));
%     [~, errPerc(i)] = ...
%         compare(func, p, nspan(i), 'x^41 + y^37', 6529724679454720/31863);
% end
% figure(2)
% loglog(nspan, errPerc, LineWidth=2);
% xlabel('n') 
% ylabel('Błąd') 
% toc

% func = @(x,y) x^7 + 2*x^6 + 3*x^5 + 4*x^4 + 5*x^3 + 6*x^2 + 7*x + 8;
% for i = 1:length(nspan)
%     fprintf("dla n = %d\n\n", nspan(i));
%     [~, errPerc(i)] = ...
%         compare(func, p, nspan(i), 'x^7 + 2*x^6 + 3*x^5 + 4*x^4 + 5*x^3 + 6*x^2 + 7*x + 8', 19472/63);
% end
% figure(2)
% loglog(nspan, errPerc, LineWidth=2);
% xlabel('n') 
% ylabel('Błąd') 
% toc

% func = @(x,y) exp(x^2+y^2) ;
% for i = 1:length(nspan)
%     fprintf("dla n = %d\n\n", nspan(i));
%     [~, errPerc(i)] = ...
%         compare(func, p, nspan(i), 'exp(x^2+y^2)', 135.344480195169717691373998979355126965813662166);
% end
% figure(2)
% loglog(nspan, errPerc, LineWidth=2);
% xlabel('n') 
% ylabel('Błąd') 
% toc

% func = @(x,y) exp(x) + y ;
% for i = 1:length(nspan)
%     fprintf("dla n = %d\n\n", nspan(i));
%     [~, errPerc(i)] = ...
%         compare(func, p, nspan(i), 'exp(x) + y ', 7/3 + exp(2));
% end
% figure(2)
% loglog(nspan, errPerc, LineWidth=2);
% xlabel('n') 
% ylabel('Błąd') 
% hold on
% toc
% 
% func = @(x,y) exp(x) + x*sin(y) ;
% for i = 1:length(nspan)
%     fprintf("dla n = %d\n\n", nspan(i));
%     [~, errPerc(i)] = ...
%         compare(func, p, nspan(i), 'exp(x) + x*sin(y)', 4 + exp(4) - 2*sin(2) - cos(2));
% end
% figure(2)
% loglog(nspan, errPerc, LineWidth=2);
% xlabel('n') 
% ylabel('Błąd')
% toc
