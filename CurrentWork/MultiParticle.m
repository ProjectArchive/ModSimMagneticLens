function res = MultiParticle()
mu_0 = 1e-7;
magVec = [0;0;-1.5];
rad = .05;
q = -1.6e-19;
m=9.1e-31;
d = .5;
rInit1 = [ .03 0 .5];
rInit2 = [ -.03 0 .5];
rInit3 = [ 0 .03 .5];
rInit4 = [ 0 -.03 .5];
vInit = [0 0 -1e8];
trajectory = particleLaunch(rInit1,vInit);
plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3))
hold on
trajectory = particleLaunch(rInit2,vInit);
plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3))
trajectory = particleLaunch(rInit3,vInit);
plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3))
trajectory = particleLaunch(rInit4,vInit);
plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3))
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
plot3(rad*A,rad*B,zeros(1,length(A)),'r','LineWidth',5);
% plot3(rad*A,rad*B,-d*ones(1,length(A)),'k','LineWidth',5);
xlabel('X(m)');
ylabel('Y(m)');
zlabel('Z(m)');

    function res = particleLaunch(pInitial,vInitial)
        Rx = pInitial(1);
        Ry = pInitial(2);
        Rz = pInitial(3);
        Vx = vInitial(1);
        Vy = vInitial(2);
        Vz = vInitial(3);
        hold on
        M = LaunchAnElectron([Rx;Ry;Rz],[Vx;Vy;Vz]);
        res = M;
    end
    function res = LaunchAnElectron(R_init,V_init)
        function [value,isterminal,direction] =events(t,M)
            value = M(3)+1;
            isterminal = 1;
            direction = -1;
        end
        options = odeset('Events',@events);
        [T, M] = ode45(@projectile, [0,.0000001], [R_init,V_init],options);
        res = M;
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
        %rSource2 = [rad*cos(theta);rad*sin(theta);-d];
        iRes = magneticFieldOfR(rMeasure,rSource1);
    end
    function magField = magneticFieldOfR(rMeasure,rSource)
        displacement =(rMeasure-rSource);
        coefficients = mu_0/(norm(displacement)^3);
        D_hat = (displacement)/norm(displacement);
        magField = coefficients*(3*(dot(magVec,D_hat))*D_hat - magVec);
    end
end