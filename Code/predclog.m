function [C] = predclog(X, W)
%UNTITLED8 Résume de la fonction
%   Explication détaillée
    N = size(X, 1);
    X = [ones(N, 1) X];
    Y = softmax(X, W);
    [~, C] = max(Y, [], 2);
end

