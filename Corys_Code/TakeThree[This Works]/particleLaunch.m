function res = particleLaunch()
%     R_init = [.02;.02;1];
    theta = linspace(0,2*pi,2);
%     Rx = .025*cos(theta);
%     Ry = .025*sin(theta);
%     Rz = 1;
    Rx = 0;
    Ry = 0;
    Rz = 0.5;
%     Vx = linspace(-1e6,1e6,5);
%     Vy = linspace(-1e6,1e6,5);
%     Vz = linspace(-3e8,-1e6,5);
Vx = 5e6;
Vy = 0;
Vz = -1e8;
    hold on
%     for i_x =1:length(Rx)
%         for i_y =1:length(Ry)
% %             for i_z =1:length(Rx)
%                 for j_x= 1:length(Vx)
%                      for j_y= 1:length(Vy)
%                            for j_z = 1:length(Vz)
%                                 LaunchAnElectron([Rx;Ry;Rz],[Vx(j_x);Vy(j_y);Vz(j_z)]);
%                            end
%                      end
%                 end
%             end
% %         end
LaunchAnElectron([Rx;Ry;Rz],[Vx;Vy;Vz])
LaunchAnElectron([Rx;Ry;Rz],[-Vx;Vy;Vz])
%     end
    
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