function res = LaunchAnElectron(R_init,V_init,radius,I)
%constants%
q = -1.6e-19;
m=9.1e-31;
%constants%
rad = radius;
options = odeset('Events',@events);
[T, M] = ode45(@projectile, [0,.00001], [R_init,V_init],options);
res = M;
    function res = projectile(t, W)
        R = W(1:3);
        V = W(4:6);
        dRdt = V;
        dVdt = acceleration(t, R, V);
        res = [dRdt(1);dRdt(2);dRdt(3); dVdt(1);dVdt(2);dVdt(3)];
    end

    function res = acceleration(t, R,V)
        rMeasure = R;
        res = cross(V,MagneticFieldAtAPoint(rMeasure,radius,I)) * q/m;
    end

    function [value,isterminal,direction] =events(t,M)
        value = M(3)+1;
        isterminal = 1;
        direction = -1;
    end

end