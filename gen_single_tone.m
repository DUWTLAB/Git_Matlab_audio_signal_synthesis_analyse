% generate single tone sine signal

time_len = 5    ; % time length in second
fs       = 16E3 ; % sample rate in Hz
f0       = 15000; % freq in Hz

fn_out   = ['single_tone_', int2str(f0), 'Hz.wav'];

time_vec  = [0:fs*time_len-1].' /fs;
phase_vec = 2*pi*f0*time_vec;
wav      = 0.9*sin(phase_vec);

audiowrite(fn_out, wav, fs);

