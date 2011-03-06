function res = LaunchAnElectron(R_init,V_init)

    function [value,isterminal,direction] =events(t,M)
        value = M(3)+1;
        isterminal = 1;
        direction = -1;
    end

% clear;
% clf;
% hold on;
options = odeset('Events',@events);
% R_init=[.01,.01,2];
% V_init=[-2e6,0,-1e8];
[T, M] = ode45(@projectile, [0,.0000001], [R_init,V_init],options);
plot3(M(:,1),M(:,2),M(:,3));

% 
% Radius = .05;
% D = .5;
% theta = linspace(0,2*pi,2000);
% A = cos(theta);
% B = sin(theta);
% plot3(Radius*A,Radius*B,zeros(1,length(A)),'r','LineWidth',5);
% plot3(Radius*A,Radius*B,(D/2)*ones(1,length(A)),'k','LineWidth',5);

function res = projectile(t, W)
    R = W(1:3);
    V = W(4:6);
    dRdt = V;                          
    dVdt = acceleration(t, R, V);
    res = [dRdt(1);dRdt(2);dRdt(3); dVdt(1);dVdt(2);dVdt(3)];
end

function res = acceleration(t, R,V)
    rMeasure = R;
    q = -1.6e-19;
    m=9.1e-31;
    res = cross(V,MagneticFieldAtAPoint(rMeasure)) * q/m;
end

end