function t2n = t2_finite(N)
% simply enters the kl entries into a matrix
    
t2n = zeros(2*N + 1);
for k = -N:N
    for l = -N:N
        t2n(N+k+1,N+l+1) = A2_kl(k,l);
    end
end


    function Q = A2_kl(k, l)
    %   computes the kl-th entry of the L_n = P_n L|V (P_n)^(-1)
    %   we start by simply defining the integrand then we approximate then
    %   integral using the inbuilt quadrature integral()
        ker1 = @(x) ((-3/2) + (1/2)*cos((sqrt(5))*x)).^2;
        ker2 = @(x) ((2) + cos((sqrt(2))*x)).^2;
        f_1 = @(x) (1/(2*pi)).*ker1(x).*exp((1i*k).*x).*exp((-1i*l).*x);
        f_2 = @(x) (1/(2*pi)).*ker2(x).*exp((1i*k).*x).*exp((-1i*l).*x);
        Q = integral(f_1,-pi,0) + integral(f_2, 0,pi);
    end

end

