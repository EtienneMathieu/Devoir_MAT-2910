%% Declaration des parametre globaux

global L T wx coefferr alpha beta

L = 1;
T = 1;
alpha = 1;
beta = 0;
coefferr = 0;
n = 2; %indice du mode
wx = (n*pi)/L; %depend de la partie 1

%% Declaration des autres variables

c =   1;
Nx =   100;
Nt =   95;
theta =  0;
f = @(t) 0;
u0 = @(x)sin(wx.*x);
utilde = @(x)sin(wx.*x);


%% Faire appel a la fonction
[u, erreur] = resout_eq_onde(c,Nt,Nx,theta,f,u0,utilde);