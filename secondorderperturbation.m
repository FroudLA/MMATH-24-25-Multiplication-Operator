% Froud L MMATH 2024/25 numerical approximation of spectrum by linear
% projection 
% algorithm from Levitin/Shargorodsky 2008
N = 50;
% ker1 = @(x) (-3/2) + (1/2)*cos((sqrt(5))*x);
% ker2 = @(x) (2) + cos((sqrt(2))*x);
% f_1_pi2pi = @(x) (-3/(2*pi)).*ker1(x).*exp((1i*k).*x).*exp((-1i*l).*x);
% f_1_0pi = @(x) (1/(2*pi)).*ker2(x).*exp((1i*k).*x).*exp((-1i*l).*x);

c_1 = -3; c_2 = 1;

A = t_finite(N) + perturbate(N, c_1, @(x) (2*pi)^(-1/2)*exp(-1i*x)) + perturbate(N, c_2, @(x)  (2*pi)^(-1/2)*exp(2i*x));
B = t2_finite(N) + (perturbate2(N, c_1, @(x) (2*pi)^(-1/2)* exp(-1i*x)) + perturbate2(N, c_2, @(x) (2*pi)^(-1/2)* exp(3i*x))) + perturbate(N, c_1, @(x) (2*pi)^(-1/2)*exp(-1i*x)) + perturbate(N, c_2, @(x)  (2*pi)^(-1/2)*exp(2i*x)); 
bigA = [zeros(2*N + 1) eye(2*N + 1); B zeros(2*N + 1)];
bigB = [eye(2*N + 1) zeros(2*N + 1); 2*A -eye(2*N + 1)];

% t_n = t_finite(N) + perturbate(N, c_1, @(x) exp(-1i*x)) + perturbate(N, c_2, @(x)exp(2i*x));
spec_4 = eig(bigA,bigB);

% z = zeros(2*N+1,1);
% scatter(spec_81,z,'.')

scatter(real(spec_4),imag(spec_4))