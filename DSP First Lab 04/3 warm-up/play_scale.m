function play_scale(X)
%--- play_scale.m
%---
scale.keys = [ 40 42 44 45 47 49 51 52 ];
%--- NOTES: C D E F G A B C
% key #40 is middle-C
%
scale.durations = 0.25 * ones(1,length(scale.keys));
fs = 11025; %-- or 8000 Hz
xx = zeros(1, sum(scale.durations)*fs+length(scale.keys) );
n1 = 1;
X =1*exp(j*pi/4);% complex input
%divide by 4 due to interval,
for kk = 1:length(scale.keys)
    keynum = scale.keys(kk);
    tone = key2note(X,keynum,scale.durations);
    n2 = n1 + length(tone) - 1;
    xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
    n1 = n2 + 1;
end
soundsc( xx, fs )
specgram(xx,512,11025);%prints spectrogram of 512 window length
%specgram(xx,1024,11025);%to use it, removes percentage symbol 