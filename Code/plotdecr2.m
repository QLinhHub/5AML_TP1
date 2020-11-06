function plotdecr2(W, minx, maxx, miny, maxy, nbp, tit, L)
    % function plotdecr() plot région de décision
% Creer une grille
x = linspace(minx,maxx,nbp);
y = linspace(miny,maxy,nbp);
[x_mesh,y_mesh] = meshgrid(x,y);
X = [x_mesh(:),y_mesh(:)]; % distribuer des points, taille N x 2

% Classifier tous les points 
C = predclog2(X, W, L);

figure
hold on
K = size(W,2);
% Plot the scatter of each class in the grid
for j = 1:K
    x_index = find(C==j);
    plot(X(x_index,1),X(x_index,2),'*')
    text(median(X(x_index,1)),median(X(x_index,2)),sprintf('C_%d',j))
end
title(tit)
xlabel('x')
ylabel('y')
end