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


allData = ones(150,3*length(xParticle));
indices = 1;
for i = 1:length(xParticle)
    display(indices);
    temp = LaunchAnElectron([xParticle(i),yParticle(i),zParticle(i)],[0,0,-1e7],ringRadius,50);
    thisRun = temp(:,1:3);
    %display(thisRun(:,1));
    allData(1:length(thisRun(:,1)),indices) = thisRun(:,1);
    allData(1:length(thisRun(:,2)),indices+1) = thisRun(:,2);
    allData(1:length(thisRun(:,3)),indices+2) = thisRun(:,3);
    plot3(thisRun(:,1),thisRun(:,2),thisRun(:,3))
    indices = indices +3;
end
res = allData;
