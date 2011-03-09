function res = varyVelocity()
clear;
clf;
velocity = linspace(-5e7,-1e8,50);
display(velocity);
focalLength = zeros(1,length(velocity));
parfor i = 1:length(velocity)
    focalLength(i) = paramHelper(200,velocity(i));
end
res = focalLength;
plot(velocity,focalLength);
xlabel('velocity');
ylabel('focallength');

end
