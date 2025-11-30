function t_p = perturbate(N,c,fun)
% Let K be the rank 1 operator Ku = c(u,psi)psi for some L2 function phi
% purtubate(N)  returns t_p the matrix representing the projection of cK onto the standard fourier basis 
% the kl-th entry of t_p should be equal to c(phi_j, psi)(phi_i, psi)
    f = @(x,k) (2*pi)^(-1/2)*exp(-k*1i*x).*fun(x);
    entries = zeros(2*N +1, 1);
    
    
    for k = 1:2*N+1
        entries(k) = integral(@(x) f(x,k-N-1), -pi,pi);
    end
    t_p = c*(entries*entries');
end

