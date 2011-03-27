function res = MultiParticleLauncher(numParticles,particleLaunchRadius,particleLaunchHeight,particleLaunchVelocity)

ringRadius = .05;
theta = linspace(0,2*pi,numParticles);

xParticle = particleLaunchRadius*cos(theta);
yParticle = particleLaunchRadius*sin(theta);
zParticle = particleLaunchHeight*ones(numParticles);

% plotRing(ringRadius)
% hold on

focalLength = zeros(numParticles);
separation = zeros(numParticles);

for i = 1:numParticles
    temp = LaunchAnElectron([xParticle(i),yParticle(i),zParticle(i)],[0,0,-particleLaunchVelocity],ringRadius,50);
%     plot3(temp(:,1),temp(:,2),temp(:,3))
    focalLengthAndSeparation = getFocalLength(temp);
    focalLength(i) = focalLengthAndSeparation(1);
    separation(i) = focalLengthAndSeparation(2);
end
f = -mean(focalLength);
s = mean(separation);
res = [f(1),s(1)];
end