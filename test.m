lambda = [0.460288238048938, -0.349643500241865, 0.608219245388399];
ker1 = @(x) (-3/2) + (1/2)*cos((sqrt(5))*x);
ker2 = @(x) (2) + cos((sqrt(2))*x);

eigcheck = zeros([3 1]);
for i = 1:3
    
    
    eigcheck(i) = integral(@(x) 1./(ker1(x) - lambda(i)), -pi, 0) + integral(@(x) 1./(ker2(x)+lambda(i)), 0, pi);

end