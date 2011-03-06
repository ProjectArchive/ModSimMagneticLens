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



end