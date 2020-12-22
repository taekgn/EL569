function play_song(theVoices)
load('bach_fugue.mat')
%calls the bach_fugue file from directory
fs = 11025; %-- or 8000 Hz
bpm =120;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat/4;
%bpm has differ unit thus converted to same unit with interval
xx = zeros(1, 348664);
%padding by zero much roughly length of total time
i = 0; %index number will be used in loop
while( i < length(theVoices))
    %repeats until reached at last index of input object
    i = i + 1; %layer index number must be positive
    scale.durations = theVoices(i).durations*seconds_per_pulse;
    %multiplied them to control the speed of entire sound by bpm
    scale.keys=theVoices(i).noteNumbers;
    %NOTES: 52 51 52 47 48 ... 31
    for kk=1:length(scale.keys)
        keynum = scale.keys(kk);
        tone=key2note(keynum,scale.durations(kk),i);
        %recevied keynum, time and vector layer number
        %tone=key2note(1,keynum,scale.durations(kk));
        n1= round(theVoices(i).startPulses(kk)*seconds_per_pulse * fs);
        n2 = n1 + length(tone) - 1;
        xx(n1:n2)=xx(n1:n2)+tone; %<=== Insert the note
        n1= n2+1;
    end
end 
sound(xx,fs)
specgram(xx,512,fs)              