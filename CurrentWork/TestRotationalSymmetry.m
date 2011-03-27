figure(1);
clf;
particleLaunchRadius = .02;
ringRadius = .05;
particleLaunchHeight = .5;
numParticles = 10;
theta =pi;
xParticle = particleLaunchRadius*cos(theta);
yParticle = particleLaunchRadius*sin(theta);
zParticle = particleLaunchHeight*ones(length(xParticle));
plotRing(ringRadius)
hold on

indices = 1;
temp = LaunchAnElectron([xParticle,yParticle,zParticle],[0,0,-1e7],ringRadius,50);
thisRun = temp(:,1:3);
plot3(thisRun(:,1),thisRun(:,2),thisRun(:,3));
theFocalLength = getFocalLength(thisRun);
display(thisRun(1,:));
numParticles = 20;
rTheta=linspace(0,2*pi,numParticles);
figure(2);
%plot(thisRun(:,3),theFocalLength);