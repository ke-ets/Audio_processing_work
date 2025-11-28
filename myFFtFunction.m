function myFFtFunction(audio_sig, fs, fftplot, fftshiftedplot)
    %audio_sig: vector of audio signal's amplitude
    %fs: sampling frequency of the audio
    audio_fft = fft(audio_sig);
    audio_fft_shifted = fftshift(audio_fft);

    magnitude_fft = abs(audio_fft);
    magnitude_fft_shifted = abs(audio_fft_shifted);

    n_fft = length(audio_fft);
    f_fft = (0:n_fft-1) * (fs / n_fft);

    if (fftplot)
        %plot the FFT signal
        half_n_fft = floor (n_fft/2);
        f_fft_half = f_fft(1:half_n_fft);
        magnitude_fft_half = magnitude_fft(1: half_n_fft);

        figure;
        plot(f_fft_half, magnitude_fft_half);
        title('Magnitude Spectrum');
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
        xlim([0 fs/2]);
        grid on;
    end

    if(fftshiftedplot)
        %plot the FFT shifted signal
        f_fft_shifted = (-n_fft/2:n_fft/2-1) * (fs / n_fft);

        figure;
        plot(f_fft_shifted, magnitude_fft_shifted);
        title('Magnitude Spectrum for fft shifted case');
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
        xlim([-fs/2 fs/2]);
        grid on;
    end
end
