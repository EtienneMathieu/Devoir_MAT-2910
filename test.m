global L T;
L = 30;
T = 10;

u0 = @(x) x*3
u1tilde = @(x) x*2
f = @(t) t*4

resout_equation_onde(1,4,4,1,f,u0,u1tilde)
%U = zeros(3,3);
%x = linspace(1,10,3)
%U(:,1) = u0(x) 