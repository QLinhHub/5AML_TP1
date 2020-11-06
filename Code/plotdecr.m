function plotdecr(W, minx, maxx, miny, maxy, nbp, tit)
    % function plotdecr() plot région de décision
% Creer une grille
x = linspace(minx,maxx,nbp);
y = linspace(miny,maxy,nbp);
[x_mesh,y_mesh] = meshgrid(x,y);
X = [x_mesh(:),y_mesh(:)]; % distribuer des points, taille N x 2

% % décommenter ça pour la question 2, approche 2
% X = [sin(X(:,1)) sin(X(:,2)) cos(X(:,1)) cos(X(:,2))];

% Classifier tous les points 
C = predclog(X, W);

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