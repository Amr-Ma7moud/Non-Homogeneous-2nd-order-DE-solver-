
clc; clearvars;
syms x;

fprintf('Choose the type of differential equation:\n');
fprintf('1. ay'''' + by'' + cy = f(x)\n');
fprintf('2. a*x^2*y'''' + b*x*y'' + c*y = f(x)\n');
eqType = input('Enter 1 or 2: ');

if eqType == 1 % Constant coefficients
    a = input('Enter coefficient a: ');
    b = input('Enter coefficient b: ');
    c = input('Enter coefficient c: ');
elseif eqType == 2 % Variable coefficients
    a = input('Enter coefficient a (of x^2*y''): ');
    b = input('Enter coefficient b (of x*y''): ') - 1;
    c = input('Enter coefficient c (of y): ');
else
    error('Invalid choice. Please choose 1 or 2.');
end
 

f_str = input('Enter f(x): ', 's');
f_str = strrep(f_str, 'ln', 'log'); % Replace ln with log for MATLAB compatibility
f = str2sym(f_str);

if eqType == 2
    f = f / x^2;
end

[Ycf, y1, y2] = get_ycf(a, b, c, eqType);
Ypi = get_ypi(y1, y2, f);

fprintf("=======================================")

fprintf('The complementary function Ycf is: \n');
disp(Ycf);
fprintf("=======================================\n")

fprintf('The particular integral ypi is: \n');
disp(Ypi);
fprintf("=======================================\n")

fprintf("The final solution is\n")

combined_output = strcat(Ycf, ' + ', Ypi);
disp(combined_output)