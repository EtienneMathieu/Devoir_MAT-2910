function [] = trace_comparaison_mode(u,Nt,Nx,uexacte)
% trace la solution obtenu numériquement et la solution exacte

%% Variable globale
global L T

%% Parametre a calculer
deltax = L/(Nx-1);
deltat = T/(Nt-1);

x = (0:deltax:L).';
t = 0:deltat:T;

matsolexacte = uexacte(x,t);

%% Video
video_sol = VideoWriter('video.mp4','MPEG-4');
open(video_sol);
h = plot(x, u(:,1), '-ob', x, matsolexacte(:,1), '-or'); % graphique initial
xlabel('Position');
ylabel('Déplacement de la corde');
legend('Position de la corde approximative', 'Position exacte de la corde'); % légende fixe pour tous les graphiques
axis([0  L -1 1]) % axes fixes pour tous les graphiques
for i = 1:Nt
    set(h(1),'xdata', x, 'ydata', u(:,i));
    set(h(2),'xdata', x, 'ydata', matsolexacte(:,i));
    drawnow;
    f = getframe(gcf);
    writeVideo(video_sol,f);
end
close(video_sol);

end