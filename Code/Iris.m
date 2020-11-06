clc
close all;
clear;
load('fisheriris.mat');

X = meas(:,1:2); % données d'apprentissage
N = size(species,1); % nombre de données d'apprentissage
T = zeros(N,1); % des classes

% chercher des indices de l'espèce d'Iris
setosa_idx = find(contains(species, 'setosa'));
versicolor_idx = find(contains(species, 'versicolor'));
virginica_idx = find(contains(species, 'virginica'));

% numériser des classes
T(setosa_idx) = 1;
T(versicolor_idx) = 2;
T(virginica_idx) = 3;
%% Approche 1

% % Visualisation des données
% % Données original
% X1 = X(setosa_idx,:);
% X2 = X(versicolor_idx,:);
% X3 = X(virginica_idx,:);
% 
% figure;
% hold on
% scatter(X1(:,1),X1(:,2),'LineWidth',1.5)
% scatter(X2(:,1),X2(:,2),'LineWidth',1.5)
% scatter(X3(:,1),X3(:,2),'LineWidth',1.5)
% title('Visualisation des données')
% xlabel('Longueur des pétales')
% ylabel('Largeur des pétales')
% 
% % training phase
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 10000, 'alpha', 0.01);
% lambda = 0.5;
% nb_exp = 10;
% 
% ersub = zeros(nb_exp, optimStruct.n_iters);
% ersub_val = zeros(nb_exp, optimStruct.n_iters);
% Loss = zeros(nb_exp, optimStruct.n_iters);
% Loss_val = zeros(nb_exp, optimStruct.n_iters);
% 
% for i=1:nb_exp
%     [W, ersub(i,:), ersub_val(i,:), Loss(i,:), Loss_val(i,:)] = fitcreglog_iris(X, ToneofK,lambda, optimStruct);
% end
% 
% ersub = mean(ersub);
% ersub_val = mean(ersub_val);
% Loss = mean(Loss);
% Loss_val = mean(Loss_val);
% 
% ersub_10 = mean(ersub);
% ersub_val_10 = mean(ersub_val);
% 
% learning_curve(Loss, Loss_val, ersub, ersub_val, optimStruct.n_iters);
% 
% % des valeurs limits de la grille
% minx = min(X(:,1));
% miny = min(X(:,2));
% maxx = max(X(:,1));
% maxy = max(X(:,2));
% nbp = 20; % nombre de points dans chaque dimension
% tit = 'Région de décision';
% 
% plotdecr(W, minx, maxx, miny, maxy, nbp, tit);
% 
% scatter(X1(:,1), X1(:,2));
% scatter(X2(:,1), X2(:,2));
% scatter(X3(:,1), X3(:,2));

%% Approche 2
X = [sin(X(:,1)) sin(X(:,2)) cos(X(:,1)) cos(X(:,2))];

% training phase
ToneofK = classes2oneofK(T);
optimStruct = struct('n_iters', 10000, 'alpha', 0.02);
lambda = 1;
nb_exp = 10;

ersub = zeros(nb_exp, optimStruct.n_iters);
ersub_val = zeros(nb_exp, optimStruct.n_iters);
Loss = zeros(nb_exp, optimStruct.n_iters);
Loss_val = zeros(nb_exp, optimStruct.n_iters);

for i=1:nb_exp
    [W, ersub(i,:), ersub_val(i,:), Loss(i,:), Loss_val(i,:)] = fitcreglog_iris(X, ToneofK,lambda, optimStruct);
end

ersub = mean(ersub);
ersub_val = mean(ersub_val);
Loss = mean(Loss);
Loss_val = mean(Loss_val);

ersub_10 = mean(ersub);
ersub_val_10 = mean(ersub_val);

learning_curve(Loss, Loss_val, ersub, ersub_val, optimStruct.n_iters);

% des valeurs limits de la grille
minx = min(X(:,1));
miny = min(X(:,2));
maxx = max(X(:,1));
maxy = max(X(:,2));
nbp = 20; % nombre de points dans chaque dimension
tit = 'Région de décision';

plotdecr(W, minx, maxx, miny, maxy, nbp, tit);


