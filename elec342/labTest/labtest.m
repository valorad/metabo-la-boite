% valorad
% ID: -
% ELEC 342 Lab Test - AK

clear
clc
close all

% The input of a
a = input("The a is selected as... ");

% initialize the values array
values = zeros(1, 12);
values(1) = 1;

% initialize the errors array
errors = zeros(1, 11);

for i = (1: 1: 11)
    values(i + 1) = values(i) * a;
    errors(i) = abs( values(i + 1) - values(i) );
end

% Show each generated value (Excluding the last one)
for i = (1: 1: length(values) - 1)
    disp("Value " + i + " is: " + values(i))
end

% Calculate the sum
serSum11 = sum(values) - values(12);
disp("The sum is " + serSum11)

% Define the x-axis (viewport)
n = (0: 1: 10); 

% Plot the diagrams
figure(1)
subplot(2, 1, 1)
stem(n, values(1: length(n)))
title("Term of the series")
xlabel("n")
ylabel("Value")

subplot(2, 1, 2)
stem(n, errors)
title("Error between each term")
xlabel("n")
ylabel("Error")


