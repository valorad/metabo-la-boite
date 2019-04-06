t = (-2: 0.1: 2);

% f1 = ones(size(t))/2;
% 
% f1(1:20) = -1/2;
% 
% plot(t,f1)
% title("x(t)")
% xlabel("t")

x = square(t)/2;

figure(1)
plot(t, x)
title("x(t)")
xlabel('t')
ylabel('x(t)')

n = t;

g5 = fEstimate(n, 5);

figure(2)
stem(n, g5)
title("g(t) when N = 5")
xlabel('t')
ylabel('g(t)')

mse5 = sqrt((x - g5).^2);
% Log the max mse out in console
max(mse5)

% figure(3)
% stem(n, mse)

% max(mse5)

% do the same with N=10 and N=50

g10 = fEstimate(n, 10);
figure(4)
stem(n, g10)
title("g(t) when N = 10")
xlabel('t')
ylabel('g(t)')
mse10 = sqrt((x - g10).^2);
max(mse10)

g50 = fEstimate(n, 50);
figure(5)
stem(n, g50)
title("g(t) when N = 50")
xlabel('t')
ylabel('g(t)')
mse50 = sqrt((x - g50).^2);
max(mse50)
