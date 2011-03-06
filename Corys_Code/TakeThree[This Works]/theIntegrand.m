function iRes = theIntegrand(rMeasure,theta)
rad = .05;

rSource1 = [rad*cos(theta);rad*sin(theta);0]; % parametize the source curve of dipoles

iRes = magneticFieldOfR(rMeasure,rSource1);
end