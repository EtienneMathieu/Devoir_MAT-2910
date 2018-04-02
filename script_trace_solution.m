script_res_eq_onde
n = 2;
c =   1;
Nx =   100;
Nt =   100;
wx = (n*pi)/L;
uexacte = @(x,t) (alpha.*cos(wx.*sqrt(c).*t) + beta.*sin(wx.*sqrt(c).*t)).*sin(wx.*x);
trace_solution(u, Nt, Nx)
%trace_comparaison_mode(u, Nt, Nx, uexacte)