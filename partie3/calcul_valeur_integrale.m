function [ J ] = calcul_valeur_integrale(u_c, u_ex)
%Fonction permettant de calculer l'intégrale de J(u_c)
%   Permet de trouver c_exp. u_c est la solution de l'équation des ondes
%   pour le paramètre c et u_exp sont les valeurs expérimentales. J(u_c)
%   est minimale lorsque c=c_exp.

global T Nt

h = T/(Nt-1);
f_t = (u_c(4,1:Nt-1) - u_ex(4,1:Nt-1)).^2; %Vecteur des f_i
f_t1 = (u_c(4,2:Nt) - u_ex(4,2:Nt)).^2; %Vecteur des f_i+1
J = (h/2)*sum(f_t + f_t1);
end

