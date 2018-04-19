% generate single tone sine signal

time_len   = 5    ; % time length in second
fs         = 16E3 ; % sample rate in Hz
f0         = 800  ; % freq in Hz
n_harmonic = 3    ; % number of harmonic components, set 1 is single tone 

fn_out      = ['harmonic_',int2str(n_harmonic), '_tone_f0_', int2str(f0), 'Hz.wav'];

time_vec    = [0:fs*time_len-1].' /fs;
n_time_vec  = length(time_vec);

wav_ii = zeros(n_time_vec, n_harmonic);

for(ii = 1:n_harmonic)
  phase_vec = 2*pi*f0*ii*time_vec;
  wav_ii(:,ii)    = sin( phase_vec);
end

wav = zeros(n_time_vec,1);

for(ii = 1:n_harmonic)
  wav = wav + wav_ii(:,ii);
end

wav = wav ./ max(max(wav)) * 0.99;

audiowrite(fn_out, wav, fs);

