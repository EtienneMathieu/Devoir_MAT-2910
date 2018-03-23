function [u,erreur] = resout_equation_onde(c,Nt,Nx,theta,f,u0,u1tilde)
%Cette fonction r�sout l'�quation des ondes
%   Detailed explanation goes here
A = toeplitz([1+2*theta*c, -theta*c ,zeros(1, Nx-2)]);
%lien utile : https://math.stackexchange.com/questions/763909/creating-a-tridiagonal-matrix-in-matlab
A(1,1) = 1;
for k = 2:Nx
   A(1,k) = 0;
end
A(Nx, Nx) = 1
for k = 1:Nx-1
   A(Nx,k) = 0
end
B0 = toeplitz([2 - 2*(1-2*theta)*c, (1-2*theta)*c ,zeros(1, Nx-2)])
B1 = toeplitz([-1 - 2*theta*c, theta*c ,zeros(1, Nx-2)])
U = zeros(Nx, Nt) %cr�ation de la matrice U
for j = 1:Nx %cr�ation de la premi�re colonne de U
    U(j,1) = 1 %something
end

for j = 1:Nx
    U(j, 2) = 1 %something
end
    
end

