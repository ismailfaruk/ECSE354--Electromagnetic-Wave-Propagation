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
R=0;
G=0;
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

[t1,z1]=meshgrid(t,z);

Zl=5;
RC=(Zl-Z0)/(Zl+Z0);
Vr0=RC*Vi0;

Vi=IncidentVoltage(Vi0,Thetai0,Alpha,Beta,w,t1,z1);
Ii=IncidentCurrent(Vi0,Thetai0,Alpha,Beta,w,t1,z1,Z0);

Vr=BWVoltage(Vr0,Thetai0,Alpha,Beta,w,t1,z1);
Ir=BWCurrent(Vr0,Thetai0,Alpha,Beta,w,t1,z1,Z0);

Vsum = Vi + Vr;
Isum = Ii + Ir;

Ztl = Vsum./Isum;

k=20;
plot(z,abs(Ztl(:,k)),'b-');
