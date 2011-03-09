function res = varyCurrent()
clear;
clf;
current = linspace(50,200,50);

focalLength = zeros(1,length(current));
parfor i = 1:length(current)
    focalLength(i) = paramHelper(current(i),-1e7);
end

    
res = focalLength;
plot(current,focalLength);
xlabel('current');
ylabel('focallength');
end
