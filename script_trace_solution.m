script_res_eq_onde_question2_2_f
uexacte = @(x,t) (alpha.*cos(wx.*sqrt(c).*t) + beta.*sin(wx.*sqrt(c).*t)).*sin(wx.*x);
%trace_solution(u, Nt, Nx)
trace_comparaison_mode(u, Nt, Nx, uexacte)