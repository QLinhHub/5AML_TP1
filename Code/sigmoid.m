function prob = sigmoid(phi, W)
%UNTITLED6 Résume de la fonction
%   Explication détaillée
    z = phi*W;
    prob = 1 ./ (1+exp(-z));
end

