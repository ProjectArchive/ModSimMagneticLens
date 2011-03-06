function res =  NonDimensionalizedMagneticField(magneticUnit,positionUnit,radiusNoDim)
res =quadv(@(theta) theIntegrand(magneticUnit,positionUnit,radiusNoDim,theta),0,2*pi);
end

function integrand = theIntegrand(magneticUnit,positionUnit,radiusNoDim,theta)
displacementUnit = positionUnit-[radiusNoDim*cos(theta);radiusNoDim*sin(theta);0];
integrand = NonDimensionalizedMagneticFieldAtAPoint(magneticUnit,displacementUnit);
end

function NDMagFieldAtAPoint = NonDimensionalizedMagneticFieldAtAPoint(magneticUnit,displacementUnit)
NDMagFieldAtAPoint = 3*(dot(magneticUnit,displacementUnit))*displacementUnit - magneticUnit;

end

