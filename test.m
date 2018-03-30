alpha = 1;

u = @(x,t) (alpha.*cos(wx.*sqrt(c).*t) + beta.*sin(wx.*sqrt(c).*t)).*sin(wx.*x);

x = (0:2:10).'
t = 0:1:10

A = u(x,t);

%on peut ajouter la sortie de matsolexacte pour comparer ? 