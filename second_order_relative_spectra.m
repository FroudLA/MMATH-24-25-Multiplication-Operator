% M Levitin and E Shagorodsky 2004 Second order relative spectra

% 0 = (A- \lambda)^2u = B u - 2\lambda A u + \lambda^2 u  
% v = \lambda u
% B u - 2 A v + \lambda v = 0

%[0   I]            [I    0]
%[B   0]  - \lambda [2A  -I]  =  0

N = 50; N2 = 100; N3 = 200;
A = t_finite(N); A2 = t_finite(N2); A3 = t_finite(N3);
B = t2_finite(N); B2 = t2_finite(N2); B3 = t2_finite(N3);
bigA = [zeros(2*N + 1) eye(2*N + 1); B zeros(2*N + 1)];
bigB = [eye(2*N + 1) zeros(2*N + 1); 2*A -eye(2*N + 1)];

bigA2 = [zeros(2*N2 + 1) eye(2*N2 + 1); B2 zeros(2*N2 + 1)];

bigB2 = [eye(2*N2 + 1) zeros(2*N2 + 1); 2*A2 -eye(2*N2 + 1)];

bigA3 = [zeros(2*N3 + 1) eye(2*N3 + 1); B3 zeros(2*N3 + 1)];
bigB3 = [eye(2*N3 + 1) zeros(2*N3 + 1); 2*A3 -eye(2*N3 + 1)];


sigma_N = eig(bigA, bigB);
sigma_N2 = eig(bigA2, bigB2);
sigma_N3 = eig(bigA3, bigB3);
main
% plotting the data


x = 20; y = 20; width = 500*1.618; height = 500; header = ['N: ', num2str(2*N+1),  ', ', num2str(2*N2+1),  ', ', num2str(2*N3+1),  '.'];

figure('Position',[x y width height])
axis([-2.1 3.1 -2.1 2.1])
hold on

scatter(spec_81,z,'k.')
scatter(real(sigma_N), imag(sigma_N))
scatter(real(sigma_N2), imag(sigma_N2))
scatter(real(sigma_N3), imag(sigma_N3))


title(header,'interpreter','latex')
legend({'$spec(A, \mathcal{L}_{801})$','$spec_2(A, \mathcal{L}_{101})$','$spec_2(A, \mathcal{L}_{201})$','$spec_2(A, \mathcal{L}_{401})$'},'interpreter','latex')