script_eq_ondes_gabarit_modifie
%trace_solution(u, Nt, Nx)

alpha = 1;
beta = 0;
n = 2;
c =   1;
Nx =   100;
Nt =   100;
wx = (n*pi)/L;
uexacte = @(x,t) (alpha.*cos(wx.*sqrt(c).*t) + beta.*sin(wx.*sqrt(c).*t)).*sin(wx.*x);
trace_comparaison_mode(u, Nt, Nx, uexacte)