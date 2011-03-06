function res = MagneticFieldAtAPoint(rMeasure)

res =quadv(@(theta) theIntegrand(rMeasure,theta),0,2*pi);

end


function iRes = theIntegrand(rMeasure,theta)
rad = .05;
d = .1;

rSource1 = [rad*cos(theta);rad*sin(theta);0]; % parametize the source curve of dipoles

iRes = magneticFieldOfR(rMeasure,rSource1);
end

function magField = magneticFieldOfR(rMeasure,rSource)
mu_0 = 1e-7;
M = [0;0;-.7579];
displacement =(rMeasure-rSource);
coefficients = mu_0/(norm(displacement)^3);
D_hat = (displacement)/norm(displacement);

magField = coefficients*(3*(dot(M,D_hat))*D_hat - M);
end