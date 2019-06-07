clear
clc
close all

global w;

nInput = input("The number of periods (n) is selected as ...");
stepSizeInput = input("The step size is selected as ...");

step_size = pi;

if stepSizeInput
    step_size = stepSizeInput;
end

w = ( -nInput * pi : step_size : nInput * pi );
xFreq = zeros(1, length(w)); % initiate xFreq array

for i = (1: 5)
    samplingRate = input("The samplingRate is selected as ...");
    N = floor(samplingRate * 2);
    n = (0: N * 2);
    x = 0.5 * sin(2 * pi * n / N) + 0.33 * sin(4 * pi * n / N);
    
    xFreq = manualDFT(xFreq, x);

    figure(i)
    polar(w, abs(xFreq))
    title("magnitude of X(w)")
    xlabel("w")
    ylabel("x[w]")

end
