function [ J ] = calcul_valeur_integrale( u_c,u_ex )
%Fonction permettant de calculer l'int�grale de J(u_c)
%   Permet de trouver c_exp. u_c est la solution de l'�quation des ondes
%   pour le param�tre c et u_exp sont les valeurs exp�rimentales. (J(u_c)
%   est minimale lorsque c=c_exp.

c=10;
c=c_ex;
u_c= ;
u_ex= ;
f=u_c-u_ex

n=norm(f)
%% On approche l'int�grale sur chaque sous intervalle [x_i,x_i+1]
%Avec un m�thode � la mitaine

x_i= ;
a= ;
b= ;
h=x_i+1 - xi;
h=(b-a)./2;

J=@(f) h.*(sum(f)-0.5.*(f(1)+f(length(f))))
%ou
J=@(f)(sum(f)-0.5.*(f(1)+f(length(f)))).*h

%% Utilisation du programme int_trapezes.m du cours programm� par A. Lioret (21 juin 1996)

J=int_trapezes
end

