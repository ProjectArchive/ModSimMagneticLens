clear;
clf;
x = linspace(-0.05,0.05,10);
y = linspace(-0.05,0.05,10);
z = linspace(-0.05,0.05,10);
[X Y Z ] = meshgrid(x,y,z);

for i_x= 1:length(x)
    for i_y= 1:length(y)
        for i_z = 1:length(z)
            B = MagneticFieldAtAPoint([x(i_x);y(i_y);z(i_z)]);
            U(i_x,i_y,i_z) = B(1);
            V(i_x,i_y,i_z) = B(2);
            W(i_x,i_y,i_z) = B(3);
        end
    end
end

quiver3(X,Y,Z,U,V,W); 
%streamslice(Y,Z,U,V);
hold on;
Radius = .05;
D = .1;
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
plot3(Radius*A,Radius*B,zeros(1,length(A)),'k','LineWidth',10);
