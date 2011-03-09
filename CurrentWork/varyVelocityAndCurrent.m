function res = varyVelocityAndCurrent()
clear;
clf;
current = linspace(50,100,5);
velocity = linspace(-1e5,-5e8,5);
focalLength = zeros(length(current),length(velocity));
parfor i = 1:length(current)
    focalLength(i,:) = focLengthHelper(current(i));
end

    
res = focalLength;
[X,Y] = meshgrid(current,velocity);
surf(X,Y,focalLength)
xlabel('current');
ylabel('velocity');
zlabel('focallength');
end

function aMat = focLengthHelper(current)
velocity = linspace(-1e5,-5e8,5);
aMat = zeros(1,length(velocity));
    for j = 1:length(velocity)
        aMat(j) = paramHelper(current,velocity(j));
    end
end