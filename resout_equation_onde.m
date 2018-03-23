function [u,erreur] = resout_equation_onde(c,Nt,Nx,theta,f,u0,u1tilde)
%Cette fonction résout l'équation des ondes
%   Detailed explanation goes here

%% Création de la matrice A
A = toeplitz([1+2*theta*c, -theta*c ,zeros(1, Nx-2)]);
%lien utile : https://math.stackexchange.com/questions/763909/creating-a-tridiagonal-matrix-in-matlab

%% modification de la matrice A
A(1,1) = 1; 
for k = 2:Nx
   A(1,k) = 0;
end
A(Nx, Nx) = 1
for k = 1:Nx-1
   A(Nx,k) = 0
end

%% Cération des matrices B0, B1, U et B

B0 = toeplitz([2 - 2*(1-2*theta)*c, (1-2*theta)*c ,zeros(1, Nx-2)])
B1 = toeplitz([-1 - 2*theta*c, theta*c ,zeros(1, Nx-2)])
U = zeros(Nx, Nt) %création de la matrice U

for j = 1:Nx %création de la première colonne de U
    U(j,1) = 1 %something, u(x, tn)
end

for j = 1:Nx
    U(j, 2) = 1 %something u(x, tn+1)
end
B = B0*U + B1*U

%% Modification matrice B
B(1,:) = 1 %pas 1 but something = f(tn+1)
B(Nx,:) = 1%pas 1 but something, = g(tn+1)
end

