function res = plotRing(radius)
theta = linspace(0,2*pi,20);
x = radius*cos(theta);
y = radius*sin(theta);
z = zeros(length(x));
plot3(x,y,z,'LineWidth',5,'Color','k')
end