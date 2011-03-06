function res = particleLaunch()
    R_init = [.02;.02;1];
    Vx = linspace(-1e5,1e5,5);
    Vy = linspace(-1e5,1e5,5);
    Vz = linspace(-3e8,-1e6,5);
    hold on
    for i_x= 1:length(Vx)
    for i_y= 1:length(Vy)
        for i_z = 1:length(Vz)
            LaunchAnElectron(R_init,[Vx(i_x);Vy(i_y);Vz(i_z)]);
        end
    end
    end

    
Radius = .05;
D = .5;
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
plot3(Radius*A,Radius*B,zeros(1,length(A)),'r','LineWidth',5);