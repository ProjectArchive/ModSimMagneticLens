
%lolwut Focal Length
clf;
clc;
clear all;
current = linspace(20,200,50);
% velocities = logspace(1e5,1e8,5);
for i = 1:length(current)
        temp = MultiParticleLauncher(2,.05,.5,1e7,current(i));
        focalLengths(i) = temp(1);
        separation(i) = temp(2);
end
subplot(2,1,1)
plot(current,focalLengths)
xlabel('Current')
ylabel('Focal Length')
subplot(2,1,2)
plot(current,separation)
xlabel('Current')
ylabel('separation')