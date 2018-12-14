clear
close all
kn=100*10^(-6);%kn=ìn*Cox
wl=5;%wl=W/L=10/2
Ir=810*10^(-6);%Ir=100u
Vr=0.3;
low=-3;%kmin
high=3;%kmax

[Vin,OUT_Iout] = sum_differential_pair(kn,wl,Ir,low,high,Vr);
figure
plot(Vin,OUT_Iout);

colorstring = 'kbgrycm';
figure
hold on
for k=-3:3
    [Vin_pair,Iout_pair] = differential_pair(kn,wl,Ir,k,Vr);
    plot(Vin_pair,Iout_pair,'Color', colorstring(k+4));
    legend('k = -3','k = -2','k = -1','k = 0','k = 1','k = 2','k = 3');
end
hold off


OUT_ideal_Iout=Ir*((Vin/Vr)-low+1/2);
delta_Iout=(OUT_Iout-OUT_ideal_Iout);
figure
plot(Vin,OUT_Iout,'k-',Vin,OUT_ideal_Iout,'k--');
figure
plot(Vin,delta_Iout);

% ii=1;
% sizedelta = size(delta_Iout);
% for i = 1:sizedelta(2)
%     if ((delta_Iout(i) < 1*10^(-8)) && (delta_Iout(i) > -1*10^(-8)))
%         interpolation(ii) = Vin(i);
%         ii = ii+1;
%     end
% end
