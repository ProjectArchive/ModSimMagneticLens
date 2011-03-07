function focalLength = getFocalLength(MVector)
X = M(:,1);
Y = M(:,2);
Z = M(:,3);
maxError = 0.001;


    for i=cast(length(X)/8,'uint8'):length(X)
        if abs(X(i)-X(1)) < maxError
           focalLength= Z(i); %return the height 
           return
        end
    end

end

