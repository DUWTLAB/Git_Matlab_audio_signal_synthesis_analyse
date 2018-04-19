% generate single tone sine signal

time_len   = 5    ; % time length in second
fs         = 16E3 ; % sample rate in Hz
f0         = 20   ; % time 0   start freq in Hz
f1         = 8000 ; % time end stop  freq in Hz
n_harmonic = 2    ; % number of harmonic components, set 1 is single tone 

fn_out      = ['harmonic_chirp_',int2str(n_harmonic), '_', int2str(f0), '_', int2str(f1), '_', 'Hz_fs', int2str(fs), 'Hz.wav'];

time_vec    = [0:fs*time_len-1].' /fs;
n_time_vec  = length(time_vec);

wav_ii     = zeros(n_time_vec, n_harmonic);
f_time_vec = zeros(n_time_vec, n_harmonic);
for(ii = 1:n_harmonic)

  f_time_vec(:,ii)  =  (f0+ (f1-f0)*ii*time_vec/time_len);
  phase_time_vec    =  0.5*(f_time_vec(:,ii) .* time_vec);     % phase is \int{f(t)*t}
  wav_ii(:,ii)      =  sin( 2*pi*phase_time_vec);
end

wav = zeros(n_time_vec,1);

for(ii = 1:n_harmonic)
  wav = wav + wav_ii(:,ii);
end

wav = wav ./ max(max(wav)) * 0.9;

audiowrite(fn_out, wav, fs);

