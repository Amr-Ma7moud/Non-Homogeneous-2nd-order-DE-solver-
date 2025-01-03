
function [Ycf ,y1 ,y2] = get_ycf(a ,b ,c ,eqtype)
    syms x;

    d = sqrt(b^2 - (4*a*c));
    if eqtype == 1
        if d > 0 % Different real roots
            root1 = (-b + d) / (2*a);
            root2 = (-b - d) / (2*a);
            Ycf = sprintf('c1*exp(%s*x) + c2*exp(%s*x)', root1, root2);
            y1 = str2sym(sprintf('exp(%d*x)', root1));
            y2 = str2sym(sprintf('exp(%d*x)', root2));
        elseif d == 0 % Equal real roots
            root1 = -b / (2*a);
            root2 = root1;
            Ycf = sprintf('c1*exp(%s*x) + c2*x*exp(%s*x)', root1, root2);
            y1 = str2sym(sprintf('exp(%d*x)', root1));
            y2 = str2sym(sprintf('x*exp(%d*x)', root2));
        else % Complex roots
            alpha = -b / (2*a);
            beta = sqrt(abs(d)) / (2*a);
            Ycf = sprintf('exp(%s*x)*(c1*cos(%s*x) + c2*sin(%s*x))', alpha, beta, beta);
            y1 = str2sym(sprintf('exp(%d*x)*cos(%d*x)', alpha, beta));
            y2 = str2sym(sprintf('exp(%d*x)*sin(%d*x)', alpha, beta));
        end
    else
        if d > 0 % Different real roots
            root1 = (-b + d) / (2*a);
            root2 = (-b - d) / (2*a);
            Ycf = sprintf('c1*x^%d + c2*x^%d', root1, root2);
            y1 = str2sym(sprintf('x^%d', root1));
            y2 = str2sym(sprintf('x^%d', root2));
        elseif d == 0 % Equal real roots
            root1 = -b / (2*a);
            root2 = root1;
            Ycf = sprintf('c1*x^(%d) + c2*x^(%d)*log(x)', root1, root2);
            y1 = str2sym(sprintf('x^%d', root1));
            y2 = str2sym(sprintf('x^%d*log(x)', root2));
        else % Complex roots
            alpha = -b / (2*a);
            beta = sqrt(abs(d)) / (2*a);
            Ycf = sprintf('x^(%d)*(c1*cos(%d*log(x)) + c2*sin(%d*log(x)))', alpha, beta, beta);
            y1 = str2sym(sprintf('x^(%d)*cos(%d*log(x))', alpha, beta));
            y2 = str2sym(sprintf('x^(%d)*sin(%d*log(x))', alpha, beta));
        end
    end
end
