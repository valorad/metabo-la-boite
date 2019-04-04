function [est] = fEstimate(period, sampleNum)
    %FESTIMATE Estimate Signal by Fourier seires
    %   assuming a_k = 1
    
    % Fourier series approximation:
    % g(n)=1/N ??a_k e^(jk(2?/N)n) ?

    g = 0;

    for k = -2: 2
        g = g + 1 * exp(1i .* k .* 2 .* pi .* period ./ sampleNum); % a_k = 1 for simplicity
    end

    g = g ./ sampleNum;

    est = g;


end

