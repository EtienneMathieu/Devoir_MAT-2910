%Ce script contiendra l’appel aux 3 méthodes que l’on va voir pour résoudre le problème inverse 
%(sécante/différence finie et recuit simulé) et permettant de trouver cexp. Dans toute la suite, pour toutes les méthodes, on
%prendra les paramètres suivants:
%Réutiliser la fonction résout_équation_ondes (Partie 2)


%% Variables globales à initialiser

global w theta L T Nt Nx g coefferr
w=5;
theta=0.5;
L=1;
T=1;
Nt=500;
Nx=100;
g=@(t)0;
coefferr = 0;

deltat = T/(Nt-1);
f=@(t)cos(w.*t);
u0=@(x)0.1.*(1-x);
u1tilde=@(x)0.1.*cos(w.*deltat).*(1-x);

%% Générer des données expérimentales

c_ex = 10;
u_ex = resout_eq_onde(c_ex,Nt,Nx,theta,f,u0,u1tilde);

%% Exercice 1 
c_intervalle = 7:0.5:30;
trace_fonction_objectif(u_ex,c_intervalle,f,u0,u1tilde)

%% Exercice 2
nmax = 100;
precision = 0.01;

%Premier appel
c0 = 3;
c1 = 3.1;
[cfinal1,ufinal1,tab_err1] = pb_inv_secante(u_ex,nmax,precision,c0,c1,f,u0,u1tilde);

%Deuxième appel
c0 = 15;
c1 = 15.1;
[cfinal2,ufinal2,tab_err2] = pb_inv_secante(u_ex,nmax,precision,c0,c1,f,u0,u1tilde);

%Troisième appel
c0 = 17;
c1 = 17.1;
[cfinal3,ufinal3,tab_err3] = pb_inv_secante(u_ex,nmax,precision,c0,c1,f,u0,u1tilde);

%création du graphique
figure(2)
iteration1 = 0:length(tab_err1)-1;
iteration2 = 0:length(tab_err2)-1;
iteration3 = 0:length(tab_err3)-1;
plot(iteration1, tab_err1); hold on
plot(iteration2, tab_err2); hold on
plot(iteration3, tab_err3)
ylim([0 10])
legend('c0 = 3, c1 = 3.1', 'c0 = 15, c1 = 15.1', 'c0 = 17, c1 = 17.1')
saveas(gcf,'methode_secante','jpeg')

%% Exercice 4

vois=20;
cini_recuit= [3 15 17 21 23];
nbrecuit= 1; 
mxrecuit= zeros(nbrecuit,length(cini_recuit));
%Premier cini
for i=1 : nbrecuit
    mxrecuit(i,1) = pb_inv_recuit_simule(u_ex,cini_recuit(1),vois,nmax,f,u0,u1tilde);
end