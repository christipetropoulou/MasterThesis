% clear
% close all
% kn=100*10^(-6);%kn=ìn*Cox
% wl=10;%wl=W/L=10/1
% Ir=100*10^(-6);%Ir=100u
% Vr=0.2;
function [Vin,Iout] = differential_pair(kn,wl,Ir,k,Vr)
    Vid_max=sqrt((2*Ir)/(kn*wl));%Vid.max=|Vin-Vr|
    Vin=k*Vr-Vid_max-0.2:0.01:k*Vr+Vid_max+0.2;%step=0.01
    %Vin=-0.2:0.05:0.1
    sizeVin = size(Vin); % array size of  Vin
    I0=(Ir/2) + ((Vin-k*Vr)/4).*sqrt(kn*wl*(4*Ir-(kn*wl).*(Vin-k*Vr).^2));
    Iout=zeros(sizeVin);
    for i=sizeVin(1):sizeVin(2)
        if Vin(i)<k*Vr-Vid_max 
            Iout(i)=0;
        elseif Vin(i)>k*Vr+Vid_max
            Iout(i)=Ir;
        else
            Iout(i)=I0(i);
        end
    end
%     figure
%     plot(Vin, Iout);
end