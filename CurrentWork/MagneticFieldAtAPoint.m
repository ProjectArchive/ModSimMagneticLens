function res = MagneticFieldAtAPoint(rMeasure,radius,I)
constants = 1e-7; %mu_0/4Pi
res =quadv(@(theta) theIntegrand(rMeasure,theta),0,2*pi);

    function iRes = theIntegrand(rMeasure,theta)
        rSource = [radius*cos(theta);radius*sin(theta);0]; % parametize the curve
        dL = [rad*-sin(theta);rad*cos(theta);0];
        iRes = cross(I*dL, rMeasure)/((norm(rMeasure)^3));
    end
end