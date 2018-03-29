%% Declaration des parametre globaux

global L T wx alpha coefferr

L=1;
T=1;
alpha=1;
coefferr=1; % 1 si on veut calculer l'erreur par rapport à la solution exacte, 0 sinon.
wx=   ; %depend de la partie 1

%% Declaration des autres variables

c=   ;
Nx=   ;
Nt=   ;
theta=  ;
f=@(x) 0;
u0=@(x)    ;
utilde=@(x)sin(wx*x);


%% Faire appel a la fonction
[u,erreur] = resout_eq_onde_gabarit(c,Nt,Nx,theta,f,u0,utilde);