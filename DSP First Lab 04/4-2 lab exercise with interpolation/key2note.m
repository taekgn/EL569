function xx = key2note(keynum,dur,voice)
% xx = the output sinusoidal waveform
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
% voice = the single matrix of theVocies vector
fs = 11025; %-- or use 8000 Hz
tt = 0:(1/fs):dur;
switch keynum
    case 0
    xx = zeros(1,length(tt));
    %padding array
    otherwise
    f0 = 261.63*2^((keynum-40)/12);
    %fundamental frequency asssigned
    A = [1 1 1 1];
    freq = f0*[1 1 1 1]';
    end
 xx = A * cos(2*pi*freq*tt);
 % ADSR has inserted to interpolate
     if( dur>0.15 )
        vq = interp1([0,0.01,0.1,dur-0.01,dur],[0,1,0.1,0.1,0],tt);
        %vq = interp1(x,v,xq)
        %x means sampling point, v means wave, xq means coordinate of query points
     elseif( dur>0.125 )
        vq = interp1([0,0.01,dur-0.01,dur],[0,1,0.1,0],tt);
     else
        vq = interp1([0,0.01,dur],[0,1,0],tt);
     end
     xx = xx.*vq;
end
