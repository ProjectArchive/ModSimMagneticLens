%lolwut Focal Length
clf;
clc;
clear all;
radii = linspace(.01,.4,100);
% current = linspace(20,300,5);
for i = 1:length(radii)
%     for j = 1:length(current)
%         temp = MultiParticleLauncher(5,radii(i),.5,1e7,current(j));
        temp = MultiParticleLauncher(2,radii(i),.5,1e7,75);
        focalLengths(i) = temp(1);
        separation(i) = temp(2);
  
end
% [R,C] = meshgrid(radii,current);
% pcolor(R,C,focalLengths)
figure(2)
subplot(2,1,1)
plot(radii,focalLengths)
xlabel('radius')
ylabel('Focal Length')
subplot(2,1,2)
plot(radii,separation)
xlabel('radius')
ylabel('separation')