function res = particleLaunch()
    theta = linspace(0,2*pi,2);
    Rx = 0;
    Ry = 0;
    Rz = 0.5;
    Vx = 5e6;
    Vy = 0;
    Vz = -1e8;
    hold on
LaunchAnElectron([Rx;Ry;Rz],[Vx;Vy;Vz])
LaunchAnElectron([Rx;Ry;Rz],[-Vx;Vy;Vz])

    
Radius = .05;
D = .5;
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
plot3(Radius*A,Radius*B,zeros(1,length(A)),'r','LineWidth',5);

xlabel('X(m)');
ylabel('Y(m)');
zlabel('Z(m)');
title(strcat('ParticleLaunch','[',int2str(Vx),',',int2str(Vy),',',int2str(Vz),']'),'FontSize',14);