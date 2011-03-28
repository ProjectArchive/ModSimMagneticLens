function plotBField()
clf;clc;clear;
rad = .05;
I = 50;

% theta = linspace(0,2*pi,20);
% x = linspace(-.075,.075,20);
y = linspace(-.075,.075,20);
z = linspace(-.5,.5,20);

[Y Z ] = meshgrid(y,z);

for i_y =1:length(y)
    for i_z =1:length(z)
       % for i_z =1:length(z)
            measVec = [0;y(i_y);z(i_z)];
            BField = MagneticFieldAtAPoint(measVec,rad,I);
%             U(i_y,i_z) = BField(1);
            V(i_y,i_z) = BField(2);
            W(i_y,i_z) = BField(3);
        end
end
streamslice(Y,Z,V,W)
% for i = 1:length(V)
%     for j=1:length(W)
%         B(i,j)=sqrt(V(i,j)^2+W(i,j)^2);
%     end
% end
% surf(Y,Z,B)
% % quiver(Y,Z,V,W)
% shading interp
% hold on;
end