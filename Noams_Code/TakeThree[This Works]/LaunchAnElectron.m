function res = LaunchAnElectron(R_init,V_init)

    function [value,isterminal,direction] =events(t,M)
        value = M(3)+1;
        isterminal = 1;
        direction = -1;
    end
options = odeset('Events',@events);
[T, M] = ode45(@projectile, [0,.0000001], [R_init,V_init],options);
plot3(M(:,1),M(:,2),M(:,3));


end