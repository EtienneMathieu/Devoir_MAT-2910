function [] = trace_solution(u,Nt,Nx)
% trace la solution sur un graphique

%% Variable globale
global L T

%% Parametre a calculer
deltax = L/(Nx-1);
deltat = T/(Nt-1);

%% Video
video_sol = VideoWriter('video.mp4','MPEG-4');
open(video_sol);

x = 0:deltax:L;
t = 0:deltat:T;


h = plot(x, u(:,1),'-o','LineWidth',1.5) ; % graphique initial
legend('Position de la corde'); % légende fixe pour tous les graphiques
axis([0  L -1 1]) % axes fixes pour tous les graphiques
for i = 1:Nt
    set(h(1),'xdata', x, 'ydata', u(:,i));
    drawnow;
    f = getframe;
    writeVideo(video_sol,f);
end
close(video_sol);

end

