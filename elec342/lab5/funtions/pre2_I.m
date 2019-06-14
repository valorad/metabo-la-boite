function Hd = pre2_I
%PRE2_I Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and Signal Processing Toolbox 8.1.
% Generated on: 14-Jun-2019 15:24:07

% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in kHz.
Fs = 8;  % Sampling Frequency

Fpass = 1;           % Passband Frequency
Fstop = 1.4;         % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 80;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
