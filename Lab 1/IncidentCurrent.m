
function Ii=IncidentCurrent(Vi0,Thetai0,Alpha,Beta,w,t1,z1,Z0)
Ii=Vi0./abs(Z0).*exp(-Alpha.*z1).*cos(w.*t1-Beta.*z1+Thetai0);
%Z0=sqrt(L/C)
end
