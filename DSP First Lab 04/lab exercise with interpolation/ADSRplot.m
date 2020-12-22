function plot_adsr()
tt=linspace(0,500,1000);
x=[1 1/2 1/4 1/6 1/8 ];
v=[0 1 0.8 0.6 0];
x = x*tt(length(tt));
vq = interp1(x,v,tt)
plot(tt,vq);
title("ADSR profile");