t = (0:10);

% ud1 = u(t-2) - u(t-5)
ud1 = t * 0;
ud1(3:6) = 1;

% x(t) = 3(u(t-2) - u(t-5))
x = ud1 .* 3;

% ud2 = u(t) - u(t-4)
ud2 = t * 0;
ud2(1:5) = 1;

% h(t) = t * e^(-2t) (u(t-2) - u(t-5))
h = t .* exp(-2 .* t) .* ud2;

y = conv(x, 5);

figure(1)
plot(y)
title("y(t)=x(t)*h(t)")
xlabel('t')
ylabel('y(t)')