function magField = loopBField(rMeasure,rSource,dL)
displacement =(rMeasure-rSource);
coefficients = I*mu_0/(norm(displacement)^3);
magField = coefficients*cross(dL,displacement);
end