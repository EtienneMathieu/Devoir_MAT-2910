%% Declaration des parametre globaux

global L T coefferr

L = 1;
T = 5;
coefferr = 0;

%% Declaration des autres variables

c =   10;
Nx =   100;
Nt =   500;
theta =  1/2;
deltat = T/(Nt-1);
f = @(t) 0.1.*cos(2.*pi.*sqrt(10).*t);
u0 = @(x) 0.1.*(1-x);
utilde = @(x) 0.1.*cos(2.*pi.*sqrt(10).*deltat).*(1-x);


%% Faire appel a la fonction
[u, erreur] = resout_eq_onde(c,Nt,Nx,theta,f,u0,utilde);