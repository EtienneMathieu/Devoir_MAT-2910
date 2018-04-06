%Ce script contiendra l’appel aux 3 méthodes
%que l’on va voir pour résoudre le problème inverse (sécante/différence finie et recuit
%simulé) et permettant de trouver cexp. Dans toute la suite, pour toutes les méthodes, on
%prendra les paramètres suivants:

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
while (c > 0) & (c < 100) %Intégrale de la fonction (11)
    