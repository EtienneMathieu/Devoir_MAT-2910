function [u,erreur] = resout_equation_onde(c,Nt,Nx,theta,f,u0,u1tilde)
%Cette fonction résout l'équation des ondes
%   Detailed explanation goes here

%% Variables globales
global L T

%% Dicrétisation x et t
x = linspace(0, L, Nx)
deltax = L/Nx
t = linspace(0, T, Nt)
deltat = T/Nt
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
U = zeros(Nx, Nt)
B = zeros(Nx, Nt)

x = linspace(0, L, Nx)
U(:,1) = u0(x) %création de la 1re colonne, u(x,0)
U(:,2) = u1tilde(x) %création de la 2e colonne, u(x, 0 + delta T) = u1

for n = 2:Nt %création de la matrice B, ok mais comment une trouve b^0 ? 
  B(:,n) = B0*U(:,n) + B1*U(:,n-1)
end

%% Modification matrice B
B(1,:) = f(t + deltat) %pas 1, en fait B^n(1) = f(t_n+1)
B(Nx,:) = 1%pas 1 but something, B^Nx(1) = g(tn+1). Mais on a pas g ?
end

