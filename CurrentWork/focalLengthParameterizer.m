%lolwut Focal Length

clf;
clc;
clear all;

radii = linspace(0,.049,50);
% velocities = logspace(1e5,1e8,5);
for i = 1:length(radii)
%     for j = 1:length(velocities)
%         temp = MultiParticleLauncher(5,radii(i),.5,velocities(j));
        temp = MultiParticleLauncher(5,radii(i),.5,1e7);
        focalLengths(i) = temp(1);
        separation(i) = temp(2);
%     end
end
subplot(2,1,1)
plot(radii,focalLengths)
xlabel('radius')
ylabel('Focal Length')
subplot(2,1,2)
plot(radii,separation)
xlabel('radius')
ylabel('separation')