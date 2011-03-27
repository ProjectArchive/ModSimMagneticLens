function res = MultiParticleLauncher(numParticles,particleLaunchRadius,particleLaunchHeight)

ringRadius = .05;
theta = linspace(0,2*pi,numParticles);

xParticle = particleLaunchRadius*cos(theta);
yParticle = particleLaunchRadius*sin(theta);
zParticle = particleLaunchHeight*ones(numParticles);

% plotRing(ringRadius)
% hold on

focalLength = zeros(numParticles);

for i = 1:numParticles
    temp = LaunchAnElectron([xParticle(i),yParticle(i),zParticle(i)],[0,0,-1e7],ringRadius,50);
%     plot3(temp(:,1),temp(:,2),temp(:,3))
    focalLength(i) = getFocalLength(temp);
    
end
m = mean(focalLength);
res = -m(1);

end