function res = MagneticFieldAtAPoint(rMeasure)

res =quadv(@(theta) theIntegrand(rMeasure,theta),0,2*pi);

end
