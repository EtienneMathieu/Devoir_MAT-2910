script_res_eq_onde
uexacte = @(x,t) (alpha.*cos(wx.*sqrt(c).*t) + beta.*sin(wx.*sqrt(c).*t)).*sin(wx.*x);
%trace_solution(u, Nt, Nx)
trace_comparaison_mode(u, Nt, Nx, uexacte)

figure(2)
t = 0:deltat:T;
plot(t, erreur)
xlabel('Temps')
ylabel('Erreur')