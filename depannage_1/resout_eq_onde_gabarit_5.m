function [u,erreur] = resout_eq_onde_gabarit(c,Nt,Nx,theta,f,u0,utilde)

%% Utilisation des variables global
global coefferr;
global L;
global T;
erreur=[];



%% Dicretisation de l intervalle

deltax=L/(Nx-1);
deltat=           ;

xinter= : :       ; 

%% Creation des deux premiere colonne de u

u=zeros(Nx,Nt);

u(:,1)=
u(:,2)=utilde(xinter);

U_0=u(:,1);
U_1=u(:,2);
%% Definition des matrices:
coef=c*(deltat)^2/(deltax)^2;

A=toeplitz([1+2*theta*coef,-theta*coef, zeros(1, Nx-2)]);
Bzero =                  ;
B1=                 ;

%Rectification de A pour satisfaire aux conditon limites

A(1,1)=1;
A(1,2)=  ;

A(Nx,Nx-1)=0;
A(Nx,Nx)= ;

%% Creation de la boucle pour resoudre les systemes

for i=3:Nt
    %Ajustement du temps
   
    
    % construction second membre (b=B_0U^n+B_1U^(n-1))
    
    
    % application CL (modification du vecteur b)

    
    % Resolution systeme (AU=b)
    
    %Decalage de U0 et de U1 (U0 devient U1 et U1 devient le nouveau U)  
    U_0=;
    U_1=;
    
    %Declaration de la colonne de u 
    
    u(:,i)=;
end

%% Calcul de l erreur si voulue
if coefferr==0
    erreur=[];
elseif coefferr==1
    global wx;
    %Creation de la fonction anonyme solution exacte
    uexacte=@(x,t)     ;
    
    %Dicretisation des intervalles 
    xinter= ( : : )'       ; % doit etre un vecteur colonne
    tinter= : :   ;%doit etre un vecteur ligne
    
    %Creation de la matrice matsolexacte (dim. Nx x Nt);
    
    
    %Calcul de la norme 2 des colonnes de matsolexacte-u;
    
    
end

