
function Vi=IncidentVoltage(Vi0,Thetai0,Alpha,Beta,w,t1,z1)
Vi=Vi0.*exp(-Alpha.*z1).*cos(w.*t1-Beta.*z1+Thetai0);
end
