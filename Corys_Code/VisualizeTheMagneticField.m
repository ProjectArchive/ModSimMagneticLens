clear;
clf;
x = linspace(-0.05,0.05,15);
y = linspace(-0.05,0.05,15);
z = linspace(-0.1,0.1,15);
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

% quiver3(Y,X,Z,U,V,W); 
streamslice(X,Y,Z,U,V,W,0,0,0);
hold on;
Radius = .05;
D = .1;
theta = linspace(0,2*pi,2000);
A = cos(theta);
B = sin(theta);
plot3(Radius*A,Radius*B,(-D/2)*ones(1,length(A)),'r','LineWidth',10);
plot3(Radius*A,Radius*B,(D/2)*ones(1,length(A)),'k','LineWidth',10);