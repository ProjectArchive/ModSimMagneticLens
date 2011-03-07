function focalLength = getFocalLength(MVector)
X = MVector(:,1);
Y = MVector(:,2);
Z = MVector(:,3);
maxError = 0.0000001;

while maxError < 0.1 %while we have not found the focal length or else the error is reasonable
    for i=cast(length(X)/4,'uint8'):length(X) %iterate through all of the X values
        if abs(X(i)-X(1)) < maxError % test if this X value is close to the center line
           focalLength= Z(i); %return the height 
           return
        end
    end
    maxError = maxError * 1.5;
end

