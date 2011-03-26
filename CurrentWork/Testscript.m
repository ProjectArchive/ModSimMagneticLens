radius = .05;
LaunchAnElectron([.02,.02,.5],[0,0,-1e8],radius,500)
theta = linspace(0,2*pi,20);
x = radius*cos(theta);
y = radius*sin(theta);
z = zeros(length(x));
plot3(x,y,z,'LineWidth',5,'Color','k')
hold on
plot3(ans(:,1),ans(:,2),ans(:,3))