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
display(indices);
temp = LaunchAnElectron([xParticle,yParticle,zParticle],[0,0,-1e7],ringRadius,50);
thisRun = temp(:,1:3);
plot3(thisRun(:,1),thisRun(:,2),thisRun(:,3))

display(thisRun(1,:));

numParticles = 20;
rTheta=linspace(0,2*pi,numParticles);
theSeparation = [];
for(index = 1 : length(thisRun(:,1)))
    
    for( rot = 1: length(rTheta))
    %z values constant, rotate x and y about the line x,y = 0;
        rotX =thisRun(index,1).*cos(rTheta(rot)) -thisRun(index,2).*sin(rTheta(rot));
        rotY =thisRun(index,1).*sin(rTheta(rot)) +thisRun(index,2).*cos(rTheta(rot));
        rotZ = thisRun(index,3);
        plot3(rotX,rotY,rotZ);
        theSeparation(index) = norm(rotX,rotY);
    end
end
figure(2);
plot(thisRun(:,3),theSeparation);

