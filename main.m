% Froud L MMATH 2024/25 numerical approximation of spectrum by linear
% projection 
% algorithm from Levitin/Shargorodsky 2008
N = 100;
% ker1 = @(x) (-3/2) + (1/2)*cos((sqrt(5))*x);
% ker2 = @(x) (2) + cos((sqrt(2))*x);
% f_1_pi2pi = @(x) (-3/(2*pi)).*ker1(x).*exp((1i*k).*x).*exp((-1i*l).*x);
% f_1_0pi = @(x) (1/(2*pi)).*ker2(x).*exp((1i*k).*x).*exp((-1i*l).*x);

c_1 = -3; c_2 = 1;
% t_n = t_finite(N);
%t_n(N,N) = t_n(N,N) -3; t_n(N+3, N+3) = t_n(N+3,N+3) + 1;
t_n = t_finite(N) + perturbate(N, c_1, @(x) (2*pi)^(-1/2)*exp(-1i*x)) + perturbate(N, c_2, @(x)  (2*pi)^(-1/2)*exp(2i*x));
spec_81 = eig(t_n);
scatter(real(spec_81), 0*spec_81)
% z = zeros(2*N+1,1);
% scatter(spec_81,z,'.')
 