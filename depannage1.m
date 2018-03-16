x=linspace(-5,5,50);
f=(-1+x+x.^2)./(2 + x.^3)./(6 + x.^4)./24;
plot(x,f)
title('Fonction anonyme de Matlab')
xlabel('x')	
ylabel('f(x)')
grid minor

