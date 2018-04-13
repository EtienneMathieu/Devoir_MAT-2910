function [cfinal, iter] = pb_inv_recuit_simule(u_ex,cini,vois,nmax,f,u0,u1tilde)
%% Algorithme 1: algorithme de Recuit-Simul�, pseudo-code
%Donn�es:
%- Une fonction f, dont on cherche le min global, et un point de d�part x0.
%- Un param�tre R "grand" (entre 100 et 500), 0 < a < 1, v >0 (on le prend
%entre 5 et 25.
%- Un nombre max d'it�rations n_max.
%- R�sultat: une approximation x_global de la solution du probl�me:
%min_x(f(x)) o� x appartient aux r�els.

%a) Impl�menter l�algorithme de recuit simul� pr�sent dans l�annexe en question. La signature
%de la fonction sera la suivante
%function[cfinal,iter]=pb_inv_recuit_simule(u_ex,cini,vois,nmax,f,u0,u1tilde)
%vois repr�sente �la distance� � laquelle on va chercher un voisin (cf. algorithme), on
%pourra prendre une valeur entre 15 et 20. Le nombre d�it�rations est donn� par nmax.
%Pour les param�tres du recuit simul� d�finis dans l�annexe 3, on propose d�utiliser les
%valeurs suivantes a = 0.8, R = 100, vois= 20 Lancer l�algorithme � partir des valeurs
%de c suivantes c = 3; 15; 17; 21; 23. Que pouvez-vous dire quand � la pr�cision et le co�t
%de cette m�thode ?
%Attention, comme mentionn� dans l�annexe, s�agissant d�un algorithme stochastique,
%pour chaque valeur de c on fera plusieurs lancements pour garantir le r�sultat !

%b) Comment pourrait-on coupler les diff�rentes m�thodes afin d�assurer une convergence
%vers cexp avec une bonne pr�cision (en partant de n�importe quel cini)?

k=0;
y0=f(x0);
x_global=x0; y_global=y0;
n_max=1 % Nombre max d'it�rations

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
 