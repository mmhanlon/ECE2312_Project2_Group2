clc
clear

devices = audiodevinfo();
inputID = devices.input(1);
outputID = devices.output(1);

fs = 48000;
nBits = 8;
nChannels = 1;
duration = 5;
n = 0:1/fs:duration;

% Project 2
sine_wave = sin(2*pi*5000*n);
sound(sine_wave,fs);

%  WAV file for sine_wave
WAVsave('team[2]-sinetone.wav', sine_wave, fs);
[y,fs] = audioread('team[2]-sinetone.wav');

% Spectrogram for WAV file sine_wave
plotSpec(y, fs, 'team[2]-sinetone.wav');

% sine wave linear progression
chirp_sine = sin(2*pi*(n.*800.*n));
soundsc(chirp_sine, fs)

% % WAV file for chirp_wave
% WAVsave('team[2]-chirp.wav', chirp_sine, fs);
% [y,fs] = audioread('team[2]-chirp.wav');
% 
% % Spectrogram for WAV file chirp_sine
% plotSpec(y, fs, 'team[2]-chirp.wav');

% % Close Encounters of the Third Kind Notes
% % cetk_sine

cetk_values = [4000 4500 3500 2500 3000];
cetk_durations = [0.25 0.5 1 0.5 2.75];

for i = 1:length(cetk_durations)
     x1 = (cetk_values(i));
     x2 = (cetk_durations(i));
cetk_sine = sin(2*pi*x1*(0:1/fs:x2));
sound(cetk_sine,fs);

%  WAV file for cetk_sine
WAVsave('team[2]-cetk.wav', cetk_sine, fs);
[y,fs] = audioread('team[2]-cetk.wav');

% Spectrogram for WAV file cetk_sine
plotSpec(y, fs, 'team[2]-cetk.wav');

end




% Combining Sound Files
[y2,fs] = audioread('Recording_1.wav'); % Previously recorded speech file from Project 1
y = y(1:numel(y2));
combined_signal = (y+y2)/2;
sound(combined_signal,fs);
pause(duration);

WAVsave('team[2]-speechchirp.wav', combined_signal, fs);
[combined,fs] = audioread('team[2]-speechchirp.wav');

% Spectrogram of Combined Sound File
plotSpec(combined, fs, 'team[2]-speechchirp');

% Stereo
stereo_signal = [y2 , combined];
sound(stereo_signal,fs);
pause(duration);
WAVsave('team[2]-stereospeechsine.wav', stereo_signal, fs);

% Spectrograms of both Stereo Channels
plotSpec(combined, fs, 'Speech Signal + Sine Tone');

plotSpec(y2, fs, 'Speech Signal');


