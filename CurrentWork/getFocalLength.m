function focalLength = getFocalLength(MVector)
X = MVector(:,1);
Y = MVector(:,2);
Z = MVector(:,3);
relTol = 0.000001;

zStart = findZeroZIndex(Z);
while relTol < 1 %while we have not found the focal length or else the error is reasonable
    for i=zStart:length(X) %iterate through all of the X values after the Z plane
        if norm([X(i),Y(i)]) < relTol % test if this X value is close to the center line
            focalLength= Z(i); %return the height
            return
        end
    end
    relTol = relTol * 1.5;
end
    
    function findZero = findZeroZIndex(zVector)
        zIndexStart = 0;
        curDist = zVector(1);
        for zIndex = 1:length(zVector)
            if abs(0 -zVector(zIndex)) < curDist %this is closer than our closest
                curDist = abs(0 -zVector(zIndex));
                zIndexStart = zIndex;
            end
        end
        findZero = zIndexStart;
    end


focalLength = -1; %if there was no focal length, give a nonsensical value.

end

