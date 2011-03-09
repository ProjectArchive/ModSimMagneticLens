current = linspace(50,100,20);
velocity = linspace(-1e3,-5e8,20);
for i = 1:length(current)
    for j = 1:length(velocity)
        focalLength(i,j) = paramHelper(current(i),velocity(j));
end

contour(velocity,current,focalLength)