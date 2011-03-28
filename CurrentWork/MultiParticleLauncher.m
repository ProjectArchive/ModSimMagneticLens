function res = MultiParticleLauncher(numParticles,ringRadius,particleLaunchHeight,particleLaunchVelocity,current)


theta = linspace(0,2*pi,numParticles);
particleLaunchRadius = .6 * ringRadius;

xParticle = particleLaunchRadius*cos(theta);
yParticle = particleLaunchRadius*sin(theta);
zParticle = particleLaunchHeight;

% plotRing(ringRadius)
% hold on


focalLengthAndSeparation= zeros(numParticles,2);
for i = 1:numParticles
    temp = LaunchAnElectron([xParticle(i),yParticle(i),zParticle],[0,0,-particleLaunchVelocity],ringRadius,current);
%     plot3(temp(:,1),temp(:,2),temp(:,3))
    focalLengthAndSeparation(i,:) = getFocalLength(temp);
end
f = -(focalLengthAndSeparation(:,1));
s= -(focalLengthAndSeparation(:,2));
res = [f(1),s(1)];
end