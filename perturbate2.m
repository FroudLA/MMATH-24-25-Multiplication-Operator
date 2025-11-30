function t_p2 = perturbate2(N,c,fun)
    f = @(x,k) exp(-k*1i*x).*fun(x);
    entriesleft = zeros(2*N +1, 1);
    entriesright = zeros(2*N +1, 1);
    ker1 = @(x) (-3/2) + (1/2)*cos((sqrt(5))*x);
    ker2 = @(x) (2) + cos((sqrt(2))*x);
    
    for k = 1:2*N+1
        entriesright(k) = integral(@(x) f(x,k-N-1), -pi,pi);
    end
    for k = 1:2*N+1
        entriesleft(k) = integral(@(x) ker1(x).*f(x,k-N-1), -pi,0) + integral(@(x) ker2(x).*f(x,k-N-1),0,pi);
    end
    t_p2 = c*(entriesright*entriesleft'+ entriesleft*entriesright');


    
end