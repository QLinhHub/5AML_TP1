function [W, ersub, Loss] = fitclog(X, T, optimStruct)
%fonction fitclog() qui ajuste les paramètres d une régression logistique multiclasse. 
%ersub désigne l'erreur de resubstitution, c'est-à-dire le proportion 
%de mauvaise classification dans la base d'apprentissage
    n_iters = optimStruct.n_iters;
    alpha = optimStruct.alpha;
    
    N = size(X, 1);
    X = [ones(N, 1) X];
    M = size(X, 2);
    K = size(T, 2);
    
    Loss = zeros(n_iters, 1);
    W = ones(M, K);
    
    for i = 1:n_iters
        Y = softmax(X, W);
        W = W - (alpha/N)*X'*(Y-T);
        Loss(i, 1) = (1/N)*sum(sum(-T.*log(Y)));
    end
    
    Loss = Loss';
    figure;
    plot(1:n_iters, Loss, '-*', 'MarkerEdgeColor', 'r');
    xlabel('iterations');
    ylabel('loss');
    
    Y = softmax(X,W);
    [~, Y_pred] = max(Y, [], 2);
    Y_onehot = classes2oneofK(Y_pred);
    
    ersub = sum(sum(abs(Y_onehot-T))) / sum(sum(T));
end

