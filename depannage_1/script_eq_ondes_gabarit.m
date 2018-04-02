%% Declaration des parametre globaux

global L T wx alpha

L=1
T=1
alpha=1
coefferr=0
wx=   ; %depend de la partie 1

%% Declaration des autres variables

c=   ;
Nx=   ;
Nt=   ;
theta=  ;
f=0;
u0=@(x)    ;
utilde=@(x)sin(wx*x);


%% Faire appel a la fonction
[  ,  ] = resout_eq_onde(, , , , , ,);