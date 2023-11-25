function root = Dekkers_method(f, a, b)
PREC = eps * 500;
MAXI = 30;
c = a; % początkowo a ale potem poprzednia wartość b
i = 0;

while i < MAXI
    if abs(b-a) < PREC
        root = b;
        %fprintf('Metoda Dekkera zrobiła %d kroków\ni znalazła zero w %d', i, root);
        return;
    end

    % b to ma być better guess (swap z a<->b)
    if abs(f(a)) < abs(f(b))
        c = b;
        b = a;
        a = c;
    end

    % obliczamy przecięcie siecznej z OX (wzór z metody siecznych)
    s = b - f(b) * (b-c)/(f(b)-f(c)); 
    if isnan(s)
        root = NaN;
        return;
    end
    % środek przedziału - potrzebny w razie bisekcji
    m = (a+b)/2;

    % Pierwsze dwie opcje to wykorzystanie metody siecznych
    % w zależności po której stronie znajduje się root
    if between_intrv(a,b,s) && sign(f(s)) ~= sign(f(a))
        a = s;
    elseif between_intrv(a,b,s) && sign(f(s)) == sign(f(a))
        b = s;
    % Kolejne dwie opcje to bisekcja
    elseif sign(f(m)) ~= sign(f(a))
        a = m;
    else % sign(f(m)) ~= sign(f(b))
        b = m;
    end

    c = b; % c to poprzednia wartość a? a miało być b
    i = i + 1; % tak dla fun'u liczymy kroki
end
% Jeśli wywaliło nas z pętli bo metoda okazała się rozbieżna
root = NaN;
end