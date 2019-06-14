clear
clc
close all

[data0, srate0] = audioread("musics/lab_5_Audio_1.wav");

% sound(data0, srate0)
% sound(0.25 * data0, srate0)
% sound(4 * data0, srate0)
sound(data0, srate0 / 2)
% sound(data0, srate0 * 2)