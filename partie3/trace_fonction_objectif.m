function [] = trace_fonction_objectif(u_exp,c_intervalle,f,u0,u1tilde)
% Trace un graphique des valeurs de J selon chaque valeur de c
global Nt Nx theta
J = zeros(1, length(c_intervalle));
for i = 1:length(c_intervalle)
    u_ci = resout_eq_onde(c_intervalle(i),Nt,Nx,theta,f,u0,u1tilde);
    J(i) = calcul_valeur_integrale(u_ci, u_exp);
end
figure(1)
plot(c_intervalle, J)
xlabel('Valeur de c')
ylabel('Valeur de J')
xlim([c_intervalle(1) c_intervalle(end)])
ylim([0 0.005])
saveas(gcf,'fonction_objectif','jpeg')
end

