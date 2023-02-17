function [] = plotSpec(data, fs)

window = hamming(512);
N.overlap = 256;
N.fft = 1024;
[S,F,T,P] = spectrogram(data,window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');

end