function varargout = KPModel(T, a, b, U0, E)
% KPModel Summary of this function goes here
%{   
    Input: T(2*m0/hbar^2), a(width of Region II), b(width of Region I),
    U0(Potential Energy in Region I), E(Test energy);

    Output: k(wave vector), E(allow band), ind(index vector of allow band).
%}

alpha = sqrt(T*E);
beta = sqrt(T*U0);
Delta = zeros(1,length(E)); % determine that the energy E is in the allow band or not;
gamma = sqrt(alpha.^2-beta^2);

tic
beta_index = find(alpha == beta);
nor_ind = setdiff(1:length(E),[1,beta_index]);
Delta(nor_ind) = cos(gamma(nor_ind)*b).*cos(alpha(nor_ind)*a)-(alpha(nor_ind).^2+gamma(nor_ind).^2).*sin(gamma(nor_ind)*b).*sin(alpha(nor_ind)*a)./(2*alpha(nor_ind).*gamma(nor_ind));
Delta(1) = cosh(beta*b) + beta*a*sinh(beta*b)/2; 
Delta(beta_index) = cos(beta*a) - beta*b*sin(beta*a)/2;
toc

clear beta alpha gamma nor_ind;

ind = find(abs(Delta) <= 1);
k = acos(Delta(ind));

clear Delta;

if nargout > 0
    varargout{1} = k;
    if nargout > 1
        varargout{2} = E(ind);
        if nargout > 2
            varargout{3} = ind;
        end
    end
end

end