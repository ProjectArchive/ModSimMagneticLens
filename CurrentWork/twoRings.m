function res = twoRings()
mu_0 = 1e-7;
M = [0;0;-1.5];
rad = .05;
q = -1.6e-19;
m=9.1e-31;

    function res = particleLaunch()
        Rx = 0;
        Ry = 0;
        Rz = 0.5;
        Vx = 5e6;
        Vy = 0;
        Vz = -1e8;
        hold on
        LaunchAnElectron([Rx;Ry;Rz],[Vx;Vy;Vz])
        LaunchAnElectron([Rx;Ry;Rz],[-Vx;Vy;Vz])
        theta = linspace(0,2*pi,2000);
        A = cos(theta);
        B = sin(theta);
        plot3(rad*A,rad*B,zeros(1,length(A)),'r','LineWidth',5);
        xlabel('X(m)');
        ylabel('Y(m)');
        zlabel('Z(m)');
    end
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
    function res = projectile(t, W)
        R = W(1:3);
        V = W(4:6);
        dRdt = V;
        dVdt = acceleration(t, R, V);
        res = [dRdt(1);dRdt(2);dRdt(3); dVdt(1);dVdt(2);dVdt(3)];
    end
    function res = acceleration(t, R,V)
        rMeasure = R;
        
        res = cross(V,MagneticFieldAtAPoint(rMeasure)) * q/m;
    end
    function res = MagneticFieldAtAPoint(rMeasure)
        
        res =quadv(@(theta) theIntegrand(rMeasure,theta),0,2*pi);
        
    end
    function iRes = theIntegrand(rMeasure,theta)
        rSource1 = [rad*cos(theta);rad*sin(theta);0]; % parametize the source curve of dipoles
        iRes = magneticFieldOfR(rMeasure,rSource1);
    end
    function magField = magneticFieldOfR(rMeasure,rSource)
        displacement =(rMeasure-rSource);
        coefficients = mu_0/(norm(displacement)^3);
        D_hat = (displacement)/norm(displacement);
        magField = coefficients*(3*(dot(M,D_hat))*D_hat - M);
    end
end