function [cfinal,ufinal,tab_err]=pb_inv_secante(u_ex,nmax,precision,c0,c1,f,u0,u1tilde)
% Méthode de la sécante pour trouver c
global Nt Nx theta
tab_err = zeros(1, nmax);
tab_err(1) = abs(c0 - c1);

c_vecteur = zeros(1, nmax);
c_vecteur(1) = c0;
c_vecteur(2) = c1;

n = 2;
diverge = 0;
erreur = tab_err(1);
while (n < nmax && erreur > precision && diverge == 0)
    u_cn = resout_eq_onde(c_vecteur(n),Nt,Nx,theta,f,u0,u1tilde); %générer la fonction f(xn)
    Jn = calcul_valeur_integrale(u_cn, u_ex); %générer la fonction f(xn)
    
    u_cn1 = resout_eq_onde(c_vecteur(n-1),Nt,Nx,theta,f,u0,u1tilde); %générer la fonction f(xn-1)
    Jn1 = calcul_valeur_integrale(u_cn1, u_ex); %générer la fonction f(xn-1)
    
    c_n = c_vecteur(n) - Jn.*((c_vecteur(n) - c_vecteur(n-1))./(Jn - Jn1));
    if (c_n < 0)
        c_n = 0;
    elseif (c_n > 100)
            diverge = 1;
    end
    c_vecteur(n+1) = c_n;
    erreur = abs(c_vecteur(n+1) - c_vecteur(n));
    tab_err(n) = erreur;
    n = n+1;
end
% on racourrci les vecteurs si on est sorti avant de nmax
tab_err(n+1:end) = [];
c_vecteur(n+1:end) = [];

if (diverge == 0)
    cfinal = c_vecteur(end);
    ufinal = resout_eq_onde(cfinal,Nt,Nx,theta,f,u0,u1tilde);
else
    cfinal = 'Diverge';
    ufinal = 'Diverge';
end

end

