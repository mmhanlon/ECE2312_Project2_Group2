clc
clear

devices = audiodevinfo();
inputID = devices.input(1);
outputID = devices.output(1);

fs = 48000;
nBits = 8;
nChannels = 1;
duration = 5;

% Project 2 

sine_wave = sin(2*pi*5000*(0:1/fs:duration));
%sound(sine_wave,fs);

% % WAV file for sine_wave
load handel.mat
filename = 'team[2]-sinetone.wav';
audiowrite(filename,sine_wave,fs);
clear sine_wave fs
[y,fs] = audioread(filename);

% Spectrogram for WAV file sine_wave
plotSpec(y, fs);
title('team[2]-sinetone.wav');

% sine wave linear progression
chirp_sine = sin(2*pi*((0:1/fs:duration).*800.*(0:1/fs:duration)));
soundsc(chirp_sine, fs)

% WAV file for chirp_wave
load handel.mat
filename = 'team[2]-chirp.wav';
audiowrite(filename,chirp_sine,fs);
clear chirp_sine fs
[y,fs] = audioread(filename);

% Spectrogram for WAV file chirp_sine
plotSpec(y, fs);
title('team[2]-chirp.wav');

% Combining Sound Files
[y2,fs] = audioread('Recording_1.wav'); % Previously recorded speech file from Project 1
y = y(1:numel(y2));
combined_signal = (y+y2)/2;
sound(combined_signal,fs);
pause(duration); 
load handel.mat
filename = 'team[2]-speechchirp.wav';
audiowrite(filename,combined_signal, fs);
[combined,fs] = audioread(filename);

% Spectrogram of Combined Sound File
plotSpec(combined, fs);
title('team[2]-speechchirp');

% Stereo
stereo_signal = [y2 , combined];
sound(stereo_signal,fs);
pause(duration);
load handel.mat
filename = 'team[2]-stereospeechsine.wav';
audiowrite(filename,stereo_signal,fs);

% Spectrograms of both Stereo Channels
plotSpec(combined, fs);
title('Speech Signal + Sine Tone');

plotSpec(y2, fs);
title('Speech Signal');