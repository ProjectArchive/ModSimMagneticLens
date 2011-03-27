particleLaunchRadius = .02;
ringRadius = .05;
particleLaunchHeight = .5;
numParticles = 10;
theta = linspace(0,2*pi,numParticles);

xParticle = particleLaunchRadius*cos(theta);
yParticle = particleLaunchRadius*sin(theta);
zParticle = particleLaunchHeight*ones(length(xParticle));

plotRing(ringRadius)
hold on

for i = 1:length(xParticle)
    temp = LaunchAnElectron([xParticle(i),yParticle(i),zParticle(i)],[0,0,-1e7],ringRadius,50);
    plot3(temp(:,1),temp(:,2),temp(:,3))
end

