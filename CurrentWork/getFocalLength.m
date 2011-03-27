function focalLength = getFocalLength(MVector)
%focal length returns a vector of length 2, containing the focal length and
%the amount of separation...
X = MVector(:,1);
Y = MVector(:,2);
Z = MVector(:,3);
distSep = zeros(length(X),1);

for index= 1:length(X)
    distSep(index)= norm(X(index),Y(index));
end
[separation,focalLengthIndex] = min(distSep);
focalLength = Z(focalLengthIndex);
focalLength =[focalLength,separation];
end