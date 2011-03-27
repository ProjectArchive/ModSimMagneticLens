%lolwut Focal Length

clf;
clc;
clear all;

radii = linspace(0,.049,5);
velocities = linspace(1e5,1e8,5);
for i = 1:length(radii)
    for j = 1:length(velocities)
        focalLengths(i,j)=MultiParticleLauncher(5,radii(i),.5,velocities(j));
    end
end
plot(focalLengths)