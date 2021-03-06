function [u, erreur] = resout_eq_onde(c,Nt,Nx,theta,f,u0,utilde)
% R�sout l'�quation des ondes

%% Utilisation des variables globales
global coefferr T L alpha beta
erreur = [];

%% Dicretisation de l intervalle

deltax = L/(Nx-1);
deltat = T/(Nt-1);

xinter = 0:deltax:L;

%% Creation des deux premiere colonne de u

u = zeros(Nx,Nt);

u(:,1) = u0(xinter);
u(:,2) = utilde(xinter);

%% Definition des matrices:
C = c*(deltat)^2/(deltax)^2;
A = toeplitz([1+2*theta*C, -theta*C, zeros(1, Nx-2)]);
B0 = toeplitz([2 - 2*(1-2*theta)*C, (1-2*theta)*C, zeros(1, Nx-2)]);
B1 = toeplitz([-1 - 2*theta*C, theta*C, zeros(1, Nx-2)]);

%Rectification de A pour satisfaire aux conditon limites

A(1,1) = 1;
A(1,2) = 0;
A(Nx,Nx) = 1;
A(Nx,Nx-1) = 0;

%% Creation de la boucle pour resoudre les systemes

for i = 3:Nt
    %Ajustement du temps
    n = i - 1; %Ge : i repr�sente le temps n+1
    
    % construction second membre (b=B_0U^n+B_1U^(n-1))
    b = B0*u(:,n) + B1*u(:,n-1);
    
    % application CL (modification du vecteur b)
    b(1) = f(n+1);
    b(Nx) = 0;
    
    % Resolution systeme (AU=b)
    u(:,i) = A\b; 
end

%% Calcul de l'erreur si voulu
if coefferr==0
    erreur=[];
elseif coefferr==1
    global wx;
    %Creation de la fonction anonyme solution exacte
    uexacte = @(x,t) (alpha.*cos(wx.*sqrt(c).*t) + beta.*sin(wx.*sqrt(c).*t)).*sin(wx.*x);
    
    %Dicretisation des intervalles 
    xinter =  (0:deltax:L).' ;% doit etre un vecteur colonne
    tinter = 0:deltat:T; %doit etre un vecteur ligne
    
    %Creation de la matrice matsolexacte (dim. Nx x Nt);
    matsolexacte = uexacte(xinter, tinter);
    
    %Calcul de la norme 2 des colonnes de matsolexacte-u;
    erreur = zeros(1,Nt);
    for i = 1:Nt
    erreur(i) = norm(u(:,i) - matsolexacte(:,i));
    end
    
end

