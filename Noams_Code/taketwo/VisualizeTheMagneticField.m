clear;
clf;

MASS = 9.1e-31;
mu_naught = 4*pi*1e7;
q = -1.6e-19;
t_0=4*pi*MASS;
d_0 = mu_naught^(1/4);
m_0=1/q;
magneticUnit=[0;0;1];

radiusNoDim = 0.05/d_0;
%x = linspace(-0.05,0.05,10);
x = linspace(-radiusNoDim,radiusNoDim,10);
y = linspace(-radiusNoDim,radiusNoDim,10);
z = linspace(-radiusNoDim,radiusNoDim,10);

[X Y Z] = meshgrid(x,y,z);

for i_x = 1:length(x)
for i_y= 1:length(y)
    for i_z = 1:length(z)
        thisPoint = [x(i_x);y(i_y);z(i_z)];
        thisPointUnit = thisPoint/norm(thisPoint);
        B = NonDimensionalizedMagneticField(magneticUnit,thisPointUnit,radiusNoDim);
        U(i_x,i_y,i_z) = B(1);
        V(i_x,i_y,i_z) = B(2);
        W(i_x,i_y,i_z) = B(3);
    end
end
end

quiver3(X,Y,Z,U,V,W);
%streamslice(X,Y,Z,U,V,W,0,0,0);
% streamslice(Y,Z,V,W)
% hold on;
