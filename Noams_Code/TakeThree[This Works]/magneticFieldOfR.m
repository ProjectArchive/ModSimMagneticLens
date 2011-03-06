
function magField = magneticFieldOfR(rMeasure,rSource)
mu_0 = 1e-7;
M = [0;0;-1.5];
displacement =(rMeasure-rSource);
coefficients = mu_0/(norm(displacement)^3);
D_hat = (displacement)/norm(displacement);

magField = coefficients*(3*(dot(M,D_hat))*D_hat - M);
end

