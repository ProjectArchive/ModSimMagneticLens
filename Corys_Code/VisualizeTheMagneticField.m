clear;
clf;
%x = linspace(-0.05,0.05,10);
y = linspace(-0.05,0.05,100);
z = linspace(-0.05,0.05,100);
[Y Z] = meshgrid(y,z);


for i_y= 1:length(y)
    for i_z = 1:length(z)
        B = MagneticFieldAtAPoint([0;y(i_y);z(i_z)]);
        %U(i_x,i_y,i_z) = B(1);
        V(i_y,i_z) = B(2);
        W(i_y,i_z) = B(3);
    end
end

%quiver3(X,Y,Z,U,V,W);
%streamslice(X,Y,Z,U,V,W,0,0,0);
streamslice(Y,Z,V,W)
hold on;
