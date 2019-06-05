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

for i = (1: 1)
    samplingRate = input("The samplingRate is selected as ...");
    N = floor(samplingRate * 2);
    n = (0: N * 2);
    x = 0.5 * sin(2 * pi * n / N) + 0.33 * sin(4 * pi * n / N);
    
    xFreq = zeros(1, length(w)); % initiate xFreq array
    xFreq = manualDFT(xFreq, x);
    
    
    % plot

    
    figure(1)
%     subplot(2, 1, 1)
%     stem(x)
%     title("x[n]")
%     xlabel("n")
%     ylabel("x[n]")
%     polar(x);

    subplot(2, 1, 2);
%     plot(w, abs(xFreq))
    polar(w, abs(xFreq))
    title("magnitude of X(w)")
    xlabel("w")
    ylabel("x[w]")
    
    
    
end




function res = manualDFT(xFreqArray, xinput)

    freqIndex = 1;
    global w;
    
%     disp(w);
    
    for indexW = w
        s = 0; % sum
        for indexN = 1: length(xinput)
            s = s + xinput(indexN) * exp(-1j * indexW * indexN);
        end
        xFreqArray(freqIndex) = s;
        freqIndex = freqIndex + 1;
    end
    
    res = xFreqArray;

end
