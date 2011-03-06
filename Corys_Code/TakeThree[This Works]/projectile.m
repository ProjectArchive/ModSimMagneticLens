function res = projectile(t, W)
    R = W(1:3);
    V = W(4:6);
    dRdt = V;                          
    dVdt = acceleration(t, R, V);
    res = [dRdt(1);dRdt(2);dRdt(3); dVdt(1);dVdt(2);dVdt(3)];
end