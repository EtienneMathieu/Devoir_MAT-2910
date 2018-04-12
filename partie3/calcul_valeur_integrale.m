function [ J ] = calcul_valeur_integrale( u_c,u_ex )
%Fonction permettant de calculer l'int�grale de J(u_c)
%   Permet de trouver c_exp. u_c est la solution de l'�quation des ondes
%   pour le param�tre c et u_exp sont les valeurs exp�rimentales. J(u_c)
%   est minimale lorsque c=c_exp.


f=u_c-u_ex
g=norm(f)
%% On approche l'int�grale sur chaque sous intervalle [x_i,x_i+1]
%Avec une m�thode � la mitaine

a=0
T=1
b=T
n=1
%x_i= 1;
%h=x_i+1 - x_i;
%h=(b-a)./2;

%J=@(f) h.*(sum(f)-0.5.*(f(1)+f(length(f))))
%ou
%J=@(f)(sum(f)-0.5.*(f(1)+f(length(f)))).*h

%% Utilisation du programme int_trapezes.m du cours programm� par A. Lioret (21 juin 1996)

J = int_trapezes(g, a, b, n)

