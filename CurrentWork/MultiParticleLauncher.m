function res = MultiParticleLauncher(numParticles,ringRadius,particleLaunchHeight,particleLaunchVelocity)


theta = linspace(0,2*pi,numParticles);
particleLaunchRadius = .6 * ringRadius;

xParticle = particleLaunchRadius*cos(theta);
yParticle = particleLaunchRadius*sin(theta);
zParticle = particleLaunchHeight;

% plotRing(ringRadius)
% hold on

%focalLength = zeros(numParticles);
%separation = zeros(numParticles);
focalLengthAndSeparation= zeros(numParticles,2);
for i = 1:numParticles
    temp = LaunchAnElectron([xParticle(i),yParticle(i),zParticle],[0,0,-particleLaunchVelocity],ringRadius,50);
%     plot3(temp(:,1),temp(:,2),temp(:,3))
    focalLengthAndSeparation(i,:) = getFocalLength(temp);
    %display(focalLengthAndSeparation(:,2));
    %focalLength(i) = focalLengthAndSeparation(1);
    %separation(i) = focalLengthAndSeparation(2);
end
f = -(focalLengthAndSeparation(:,1));
%display(f);
s= -(focalLengthAndSeparation(:,2));
%display(s);
res = [f(1),s(1)];
end