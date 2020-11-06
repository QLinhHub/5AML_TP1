clear
% Charger et pr�parer la base de donn�e
load sim_data_set.mat;

X1 = R(R(:,3)==1,1:2);
X2 = R(R(:,3)==2,1:2);
X3 = R(R(:,3)==3,1:2);
X4 = R(R(:,3)==4,1:2);

%% Question b)

% X = R(:, 1:2);
% T = R(:, 3);
% 
% figure;
% hold on;
% scatter(X1(:,1), X1(:,2));
% scatter(X2(:,1), X2(:,2));
% scatter(X3(:,1), X3(:,2));
% scatter(X4(:,1), X4(:,2));

%% Question c)

% X = R(:, 1:2);
% T = R(:, 3);
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);

%% Question f)

% R = R(R(:,3)==1|R(:,3)==2,:); 
% % classification binaire
% X = R(:,1:2);
% T = R(:,3);
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% % Logistic reg fit
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);
% 
% figure;
% hold on;
% scatter(X1(:,1), X1(:,2));
% scatter(X2(:,1), X2(:,2));
% f12 = @(x,y)(W(1,1)-W(1,2) + (W(2,1)-W(2,2))*x + (W(3,1)-W(3,2))*y);
% fcontour(f12,'LevelList', 0);

%% Question g)

% R = R(R(:,3)==1|R(:,3)==2,:); 
% % classification binaire
% X = R(:,1:2);
% T = R(:,3);
% X_new = [0.5*randn(100,1), 0.5*randn(100,1)+5];
% X = [X; X_new];
% T = [T; ones(100,1)];
% X1 = [X1;X_new];
% 
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% % Logistic reg fit
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);
% figure;
% hold on;
% scatter(X1(:,1), X1(:,2));
% scatter(X2(:,1), X2(:,2));
% f12 = @(x,y)(W(1,1)-W(1,2) + (W(2,1)-W(2,2))*x + (W(3,1)-W(3,2))*y);
% fcontour(f12,'LevelList', 0);

%% Question h)

% R = R(R(:,3)==1|R(:,3)==2|R(:,3)==3,:); 
% % K=3
% X = R(:,1:2);
% T = R(:,3);
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);
% figure;
% hold on;
% scatter(X1(:,1), X1(:,2));
% scatter(X2(:,1), X2(:,2));
% f12 = @(x,y)(W(1,1)-W(1,2) + (W(2,1)-W(2,2))*x + (W(3,1)-W(3,2))*y);
% scatter(X2(:,1), X2(:,2));
% scatter(X3(:,1), X3(:,2));
% f23 = @(x,y)(W(1,2)-W(1,3) + (W(2,2)-W(2,3))*x + (W(3,2)-W(3,3))*y);
% fcontour(f12,'LevelList', 0);
% fcontour(f23,'LevelList', 0);

%% Question j)

% X = R(:, 1:2);
% T = R(:, 3);
% 
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);
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
% scatter(X4(:,1), X4(:,2));

%% Question k)

% X = R(:, 1:2);
% T = R(:, 3);
% 
% X_new = [0.5*randn(100,1), 0.5*randn(100,1)+5];
% 
% X1 = [X1; X_new];
% X = [X; X_new];
% T = [T; ones(100,1)];
% 
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);
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
% scatter(X4(:,1), X4(:,2));

%% Question m)

% L0 = [0, 1, 1, 1;...
%       1, 0, 1, 1;...
%       1, 1, 0, 1;...
%       1, 1, 1, 0];
% 
% L1 = [0, 1, 5, 1;... 
%       1, 0, 1, 1;...
%       1, 1, 0, 1;...
%       1, 1, 1, 0];
% 
% L2 = [0, 1, 5, 1;...
%       1, 0, 1, 1;...
%       1, 1, 0, 1;...
%       1, 5, 1, 0];
% 
% X = R(:, 1:2);
% T = R(:, 3);
% 
% ToneofK = classes2oneofK(T);
% optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
% [W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);

% % des valeurs limits de la grille
% minx = min(X(:,1));
% miny = min(X(:,2));
% maxx = max(X(:,1));
% maxy = max(X(:,2));
% nbp = 20; % e nombre de points dans chaque dimension
% 
% % tit = 'Pas de tolérance';
% % tit = 'Plus tolérance pour la classe 1 par rapport à 3';
% tit = 'Plus tolérance pour la classe 1 et 4 par rapport à 3 et 2';
% 
% plotdecr2(W,minx,maxx,miny,maxy,nbp,tit,L2); % plot région de décision
% 
% scatter(X1(:,1), X1(:,2));
% scatter(X2(:,1), X2(:,2));
% scatter(X3(:,1), X3(:,2));
% scatter(X4(:,1), X4(:,2));

%% Question o)

X = R(:, 1:2);
T = R(:, 3);

ToneofK = classes2oneofK(T);
optimStruct = struct('n_iters', 1000, 'alpha', 0.1);
[W, ersub, Loss] = fitclog(X, ToneofK, optimStruct);

lambda = 0.5;
[W_reg, ersub_reg, Loss_reg] = fitcreglog(X, ToneofK,lambda, optimStruct);

figure;
plot(1:optimStruct.n_iters, Loss);
hold on;
plot(1:optimStruct.n_iters, Loss_reg);
legend('non reg', 'reg');
title('descente de gradient avec et sans régularisaation');





