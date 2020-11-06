function [C] = predclog2(X, W, L)
%UNTITLED Résume de la fonction
%    Explication détaillée
    N = size(X, 1);
    X = [ones(N, 1) X];
    Y = softmax(X, W);
    Y = Y * L;
    [~, C] = min(Y, [], 2);
end