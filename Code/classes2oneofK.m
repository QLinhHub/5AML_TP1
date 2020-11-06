function ToneofK = classes2oneofK(T)
%fonction classe2oneofK() qui permet de passer d'un vecteur de labels 
%dans { 1, . . . , K } vers la représentation 1 parmi K vue en cours
    K = max(T);
    N = size(T,1);
    
    ToneofK = zeros(N,K);
    for i = 1:K
        ToneofK(:,i) = (T==i);
    end
end

