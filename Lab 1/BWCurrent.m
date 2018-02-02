
function Ii=BWCurrent(Vr0,Thetai0,Alpha,Beta,w,t1,z1,Z0)
Ii=-Vr0./abs(Z0).*exp(Alpha.*z1).*cos(w.*t1+Beta.*z1+Thetai0);

end
