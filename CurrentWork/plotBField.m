function plotBField()
clf;clc;clear;
mu_0 = 1e-7;
magVec = [0;0;-1.5];
rad = .05;
I = 50;

% theta = linspace(0,2*pi,20);
x = linspace(-.075,.075,20);
y = linspace(-.075,.075,20);
z = linspace(-.5,.5,20);

[X Y ] = meshgrid(x,y);

for i_x =1:length(x)
    for i_y =1:length(y)
       % for i_z =1:length(z)
            measVec = [x(i_x);y(i_y);0.0005];
            BField = MagneticFieldAtAPoint(measVec,rad,I);
            U(i_x,i_y) = BField(1);
            V(i_x,i_y) = BField(2);
            %W(i_x,i_y,i_z) = BField(3);
        end
end
streamslice(X,Y,U,V)
hold on;
end