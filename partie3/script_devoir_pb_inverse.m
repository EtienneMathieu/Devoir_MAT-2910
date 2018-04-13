%Ce script contiendra l’appel aux 3 méthodes que l’on va voir pour résoudre le problème inverse 
%(sécante/différence finie et recuit simulé) et permettant de trouver cexp. Dans toute la suite, pour toutes les méthodes, on
%prendra les paramètres suivants:
%Réutiliser la fonction résout_équation_ondes (Partie 2)


%% Variables globales à initialiser

global w theta L T Nt Nx g f u0 u1tilde
w=5;
theta=0.5;
L=1;
T=1;
Nt=500;
Nx=100;
g=@(t)0;
f=@(t)cos(w.*t);
u0=@(x)0.1.*(1-x);
u1tilde=@(x)0.1.*cos(w.*deltat).*(1-x);

%% Générer des données 

%% Exercice 1 a)
% Méthode des trapèzes

[u, erreur] = resout_eq_onde(c,Nt,Nx,theta,f,u0,utilde)

u_c= u(4,:); %4ème ligne de la matrice résultante de la fonction resout_eq_onde

%Il faut comprendre comment fixer c_exp=10
u_ex= resout_eq_onde(c,Nt,Nx,theta,f,u0,utilde);

if (c > 0) & (c < 100)
    [ J ] = calcul_valeur_integrale( u_c,u_ex )
elseif (c > 100)
    disp('c est plus grand que 100')
else
    disp("La valeur de c n'est pas plus grande que 0")
end
