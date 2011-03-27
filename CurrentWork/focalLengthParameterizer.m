%lolwut Focal Length

radii = linspace(0,.049,50);
focalLengths = zeros(length(radii));
for i = 1:length(radii)
    focalLengths(i)=MultiParticleLauncher(5,radii(i),.5);
end
figure()
clf()
plot(radii,focalLengths)