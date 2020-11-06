function prob = softmax(phi, W)
%UNTITLED5 Résume de la fonction
%   Explication détaillée
    exp_z = exp(phi*W);
    sum_exp = sum(exp_z, 2);
    prob = exp_z ./ sum_exp;
end

