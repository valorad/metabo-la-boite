clear
clc
close all

global w;

% part a
% nInput = input("The number of periods (n) is selected as ...");
% stepSizeInput = input("The step size is selected as ...");
% 
% step_size = pi;
% 
% if stepSizeInput
%     step_size = stepSizeInput;
% end
% 
% w = ( -nInput * pi : step_size : nInput * pi );

% xFreq = zeros(1, length(w)); % initiate xFreq array
% 
% res = manualDFT(xFreq, x, n);
% 
% figure(1)
% subplot(2, 1, 1)
% stem(n, x)
% title("x[n]")
% xlabel("n")
% ylabel("x[n]")
% 
% subplot(2, 1, 2);
% plot(w, abs(res))
% title("magnitude of X(w)")
% xlabel("w")
% ylabel("x[w]")



% for i = (1: 5)
%     samplingRate = input("The samplingRate is selected as ...");
%     N = floor(samplingRate * 2);
%     n = (0: N * 2);
%     x = sin(2 * pi * n / N);
%     % plot
%     xFreq = zeros(1, length(w)); % initiate xFreq array
%     xFreq = manualDFT(xFreq, x);
%     
%     figure(1)
%     subplot(2, 1, 1)
%     stem(x)
%     title("x[n]")
%     xlabel("n")
%     ylabel("x[n]")
% 
%     subplot(2, 1, 2);
%     plot(w, abs(xFreq))
%     title("magnitude of X(w)")
%     xlabel("w")
%     ylabel("x[w]")
%     
%     
% end

% part b
samplingRate = input("The samplingRate is selected as ...");
N = floor(samplingRate * 2);

for i = (1: 1)
    windowSize = input("The windowSize is selected as ...");
    n = (0: windowSize * N);
    w = ( -windowSize * pi : 0.05 : pi * windowSize );
    x = sin(2 * pi * n / N);
    xFreq = zeros(1, length(w)); % initiate xFreq array
    xFreq = manualDFT(xFreq, x);
    
    figure(1)
    subplot(2, 1, 1)
    stem(x)
    title("x[n]")
    xlabel("n")
    ylabel("x[n]")
    
    subplot(2, 1, 2);
    plot(w, abs(xFreq))
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