function xx = key2note(X, keynum, dur)
% KEY2NOTE Produce a sinusoidal waveform corresponding to a
% given piano key number
%
% usage: xx = key2note (X, keynum, dur)
%
% xx = the output sinusoidal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi).
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
%
fs = 11025; %-- or use 8000 Hz
tt = 0:(1/fs):dur;
freq = 261.63*2^((keynum-40)/12);
%middle-C referenced, 12 means notes, 40 means piano keynum
%temperament(2^(...)) multiplied to frequency to set the chord
xx = real( X*exp(j*2*pi*freq*tt) );