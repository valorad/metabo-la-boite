function res = manualDFT(xFreqArray, xinput)
  %manualDFT - Calculates DFT manually
  % 
  % Global variable needed:
  % w: The frequency range.
  %
  % Syntax: res = manualDFT(xFreqArray, xinput)
  %
  % Calculates DFT manually

  freqIndex = 1;
  global w;

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