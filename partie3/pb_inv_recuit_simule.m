function [cfinal, iter] = pb_inv_recuit_simule(u_ex,cini,vois,nmax,f,u0,u1tilde)
%% Algorithme 1: algorithme de Recuit-Simulé, pseudo-code
%Données:
%- Une fonction f, dont on cherche le min global, et un point de départ x0.
%- Un paramètre R "grand" (entre 100 et 500), 0 < a < 1, v >0 (on le prend
%entre 5 et 25.
%- Un nombre max d'itérations n_max.
%- Résultat: une approximation x_global de la solution du problème:
%min_x(f(x)) où x appartient aux réels.

%a) Implémenter l’algorithme de recuit simulé présent dans l’annexe en question. La signature
%de la fonction sera la suivante
%function[cfinal,iter]=pb_inv_recuit_simule(u_ex,cini,vois,nmax,f,u0,u1tilde)
%vois représente «la distance» à laquelle on va chercher un voisin (cf. algorithme), on
%pourra prendre une valeur entre 15 et 20. Le nombre d’itérations est donné par nmax.
%Pour les paramètres du recuit simulé définis dans l’annexe 3, on propose d’utiliser les
%valeurs suivantes a = 0.8, R = 100, vois= 20 Lancer l’algorithme à partir des valeurs
%de c suivantes c = 3; 15; 17; 21; 23. Que pouvez-vous dire quand à la précision et le coût
%de cette méthode ?
%Attention, comme mentionné dans l’annexe, s’agissant d’un algorithme stochastique,
%pour chaque valeur de c on fera plusieurs lancements pour garantir le résultat !

%b) Comment pourrait-on coupler les différentes méthodes afin d’assurer une convergence
%vers cexp avec une bonne précision (en partant de n’importe quel cini)?
global Nt Nx theta 
k=0;
u_c0 = resout_eq_onde(cini,Nt,Nx,theta,f,u0,u1tilde);
J0= calcul_valeur_integrale(u_c0, u_ex);
y0=J0;
x0=cini;
x_global=x0; y_global=y0;
R=100;
a=0.8;

while (R > 0.0001 && k <= nmax)
    x1 = x0+vois*(rand-0.7);
    %calcul de y1 = f(x1);
    u_c1 = resout_eq_onde(x1,Nt,Nx,theta,f,u0,u1tilde);
    J1 = calcul_valeur_integrale(u_c1, u_ex);
    y1 = J1;
    if y1 < y0
        xo=x1; y0 = y1;
    else
        p = rand;
        if p < exp(-(y1-y0)/R)
            R=a*R;
            x0=x1; y0=y1;
        end
    end
    if y1 < y_global
        y_global = y1; x_global = x1;
    end
    k=k+1;
end
cfinal = x_global;
iter = k-1;
end
 