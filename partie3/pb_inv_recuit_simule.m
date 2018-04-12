function [cfinal, iter] = pb_inv_recuit_simule(u_ex,cini,vois,nmax,f,u0,u1tilde)
%% Algorithme 1: algorithme de Recuit-Simul�, pseudo-code
%Donn�es:
%- Une fonction f, dont on cherche le min global, et un point de d�part x0.
%- Un param�tre R "grand" (entre 100 et 500), 0 < a < 1, v >0 (on le prend
%entre 5 et 25.
%- Un nombre max d'it�rations n_max.
%- R�sultat: une approximation x_global de la solution du probl�me:
%min_x(f(x)) o� x appartient aux r�els.

k=0;
y0=f(x0);
x_global=x0; y_global=y0;
n_max=1 % Nombre max d'it�rations

while R > 0.0001 & k <= n_max
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
        