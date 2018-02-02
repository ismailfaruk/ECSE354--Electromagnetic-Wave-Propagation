clear all


Vi0=1; Thetai0=0;

f=10^9; w=2*pi*f; T=1/f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%alpha, beta, zo for the first few questions
% Alpha=0.55; 
% Beta=35; 
% Z0=36.5-1i*0.57;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% or alpha, beta, zo for final question
R=170;
G=750e-6;
C=40e-12;
L=0.35e-6;
Gamma = sqrt((R+1i*w*L).*(G+1i*w*C));
Alpha = real(Gamma);
Beta = imag(Gamma);
Z0 = sqrt((R+1i*w*L)./(G+1i*w*C));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Lambda=2*pi/Beta;
l=10*Lambda; %z-span over 10 wavelength

t=(0:0.02:2)*T;
z=(-1:1/1000:0);

RC=0.9;Vr0=RC*Vi0;

[t1,z1]=meshgrid(t,z);
Vr=BWVoltage(Vr0,Thetai0,Alpha,Beta,w,t1,z1);
Ir=BWCurrent(Vr0,Thetai0,Alpha,Beta,w,t1,z1,Z0);

for k=1:length(t)
    plot(z,Vr(:,k),'b-'); hold on;
    plot(z,10*Ir(:,k),'r.'),hold off;
    xlabel('z[m]');
    ylabel('Vr(z,t)[V],10*Ir(z,t)[mA]');
    title('Incident signals on a lossy transmission line');
    legend('Vr(z,t)','Ir(z,t)');
    ylim(max(max(max(Vr)),max(max(10*10*Ir)))*1.5*[-1,1]);
    M(k)=getframe;
end