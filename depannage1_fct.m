function [ u, erreur ] = untitled2( c, Nx, Nt, theta, f, u0, ut )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

outputArg1 = inputArg1

%% Discréditation de l'intervalles

deltax=1/(Nx-1);
deltat=/(Nt-1);
xinter=0:deltax:L

%%Initialisation de de u

u=zeros(Nx,Nt)

u(1,:)=u0(xinter)
u(2,:)=utilde(xinter)

%% Définition des matrices

coeff=c'(deltax)^2/(deltat)^2
A=toepliz((1+2*theta*coeff 1+2*theta*coeff zeros(1, Nx*2))
.us1=
end

