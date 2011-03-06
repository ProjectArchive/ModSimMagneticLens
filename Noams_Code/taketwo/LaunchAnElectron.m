function res = LaunchAnElectron()
clear;
clf;

MASS = 9.1e-31;
mu_naught = 2;
q = -1.6e-19;
t_0=4*pi*MASS;
d_0 = mu_naught^(1/4);
m_0=1/q;
magneticUnit=[0;0;1];

radiusNoDim = 0.05/d_0;
% options = odeset('reltol',0.01);
R_init=[.01,.01,2]./d_0;
V_init=[2,0,-1e8]./(d_0/t_0);
[T, M] = ode45(@projectile, [0,100], [R_init,V_init]);
comet3(M(:,1),M(:,2),M(:,3));
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
hold on
% plot3(radiusNoDim*A,radiusNoDim*B,zeros(1,length(A)),'r','LineWidth',10);

function res = projectile(t, W)
    R = W(1:3);
    V = W(4:6);
    dRdt = V;                          
    dVdt = acceleration(t, R, V);
    res = [dRdt(1);dRdt(2);dRdt(3); dVdt(1);dVdt(2);dVdt(3)];
end

function res = acceleration(t, R,V)
    thisPointUnit = R/norm(R);
    thisVelocityUnit = V/norm(V);
    tres = cross(thisVelocityUnit,NonDimensionalizedMagneticField(magneticUnit,thisPointUnit,radiusNoDim));
    D = norm(R);
    res = tres*norm(V)/D^3;
end
end