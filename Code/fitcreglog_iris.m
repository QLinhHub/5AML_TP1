function [W, ersub, ersub_val, Loss, Loss_val] = fitcreglog_iris(X, T, lambda, optimStruct)
%fonction fitclog() qui ajuste les paramètres d une régression logistique multiclasse. 
%ersub désigne l'erreur de resubstitution, c'est-à-dire le proportion 
%de mauvaise classification dans la base d'apprentissage
    n_iters = optimStruct.n_iters;
    alpha = optimStruct.alpha;
    
    N = size(X, 1);
    X = [ones(N, 1) X];
    M = size(X, 2);
    K = size(T, 2);
    
    split = round(0.8*N);
    ridx = randperm(N);
    X_val = X(ridx(split+1:end), :);
    T_val = T(ridx(split+1:end), :);
    X = X(ridx(1:split), :);
    T = T(ridx(1:split), :);
    
    Loss = zeros(n_iters, 1);
    Loss_val = zeros(n_iters, 1);
    W = ones(M, K);
    grad = ones(size(W));
    
    for i = 1:n_iters
        Y = softmax(X, W);
        grad(1,:) = (1/N)*(X(:,1)'*(Y-T));
        grad(2:end, :) = (1/N)*(X(:,2:end)'*(Y-T)) + lambda/N*W(2:end,:);
        W = W - alpha*grad;
        Loss(i, 1) = (1/N)*sum(sum(-T.*log(Y))) + (lambda/(2*N))*sum(W(2:end).^2);
        
        Y_val = softmax(X_val, W);
        Loss_val(i, 1) = (1/size(X_val,1))*sum(sum(-T_val.*log(Y_val))) + (lambda/(2*size(X_val,1)))*sum(W(2:end).^2);
    end
    
    Loss = Loss';
    Loss_val = Loss_val';
%     figure;
%     plot(1:n_iters, Loss, 1:n_iters, Loss_val);
%     xlabel('iterations');
%     ylabel('loss');
    
    Y = softmax(X,W);
    [~, Y_pred] = max(Y, [], 2);
    [~,T_classes] = max(T,[],2);
    difference = Y_pred - T_classes;
    ersub = size(find(difference),1) / size(T,1);
    
    Y_val = softmax(X_val,W);
    [~, Y_pred_val] = max(Y_val, [], 2);
    [~,T_classes_val] = max(T_val,[],2);
    difference = Y_pred_val - T_classes_val;
    ersub_val = size(find(difference),1) / size(T_val,1);
end