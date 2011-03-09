current = linspace(50,100,20);
for i = 1:length(current)
    focalLength(i) = paramHelper(current(i));
end

plot(current,focalLength)