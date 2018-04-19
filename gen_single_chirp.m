% generate single tone sine signal

time_len = 5     ; % time length in second
fs       = 16E3  ; % sample rate in Hz
f0       = 20    ; % freq in Hz
f1       = 32000 ;

fn_out   = ['single_chirp_', int2str(f0),'_',int2str(f1), 'Hz_fs', int2str(fs), 'Hz.wav'];

time_vec       =  [0:fs*time_len-1].' /fs;
f_time_vec     =  (f0+ (f1-f0)*time_vec/time_len);
phase_time_vec =  0.5*(f_time_vec .* time_vec);     % phase is \int{f(t)*t}
wav            =  0.9*sin(2*pi* phase_time_vec);

audiowrite(fn_out, wav, fs);

