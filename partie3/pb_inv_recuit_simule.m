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

k=0;
y0=f(x0);
x_global=x0; y_global=y0;
n_max=1 % Nombre max d'itérations

while (R > 0.0001 && k <= n_max)
    x1 = x0+v.*(random(0.1)-0.7);
    %calcul de y1 = f(x1);
    if y1 < y0
        xo=x1; y0 = y1;
    else
        p = random(0,1);
        if p < exp(-(y1-y0)/R)
            R=aR;
            x0=x1; y0=y1;
        end
    end
    if y1 < y_global
        y_global = y1; x_global = x_global;
    end
    k=k+1;
end
 