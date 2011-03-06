function res = particleLaunch()
%     R_init = [.02;.02;1];
    theta = linspace(0,2*pi,3);
    Rx = .025*cos(theta);
    Ry = .025*sin(theta);
    Rz = linspace(.01,.1,3);
    Vx = linspace(-1e4,1e4,3);
    Vy = linspace(-1e4,1e4,3);
    Vz = linspace(-3e8,-1e6,3);
    hold on
    for i_x =1:length(Rx)
        for i_y =1:length(Rx)
            for i_z =1:length(Rx)
                for j_x= 1:length(Vx)
                     for j_y= 1:length(Vy)
                           for j_z = 1:length(Vz)
                                LaunchAnElectron([Rx(i_x);Ry(i_y);Rz(i_z)],[Vx(j_x);Vy(j_y);Vz(j_z)]);
                           end
                     end
                end
            end
        end
    end
    
Radius = .05;
D = .5;
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
plot3(Radius*A,Radius*B,zeros(1,length(A)),'r','LineWidth',5);