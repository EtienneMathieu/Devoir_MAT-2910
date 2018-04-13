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
 