%Ce script contiendra l�appel aux 3 m�thodes
%que l�on va voir pour r�soudre le probl�me inverse (s�cante/diff�rence finie et recuit
%simul�) et permettant de trouver cexp. Dans toute la suite, pour toutes les m�thodes, on
%prendra les param�tres suivants:

global omega theta L T Nt Nx g f u0 u1tilde
omega=5
theta=0.5
L=1
T=1
Nt=500
Nx=100
g=@(t)0
f=@(t)cos(omegat)
u0=@(x)0.1.*(1-x)
u1tilde=@(x)0.1.*cos(omega.*deltat).*(1-x)

c=1
while (c > 0) & (c < 100) %Int�grale de la fonction (11)
    