function [u,erreur] = resout_equation_onde(c,Nt,Nx,theta,f,u0,u1tilde)
%Cette fonction résout l'équation des ondes
%   Detailed explanation goes here
A = toeplitz([1+2*theta*c, -theta*c ,zeros(1, Nx-2)])
%lien utile : https://math.stackexchange.com/questions/763909/creating-a-tridiagonal-matrix-in-matlab
A(1,1) = 1
for k = 2:Nx
   A(1,k) = 0
end
A(Nx, Nx) = 1
for k = 1:Nx-1
   A(Nx,k) = 0
end
B0 = 
end

