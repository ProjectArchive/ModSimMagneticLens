function plotBField()
clf;clc;clear;
mu_0 = 1e-7;
magVec = [0;0;-1.5];
rad = .05;
I = 50;

% theta = linspace(0,2*pi,20);
x = linspace(-.075,.075,20);
y = linspace(-.075,.075,20);
z = linspace(-.5,.5,20);

[X Y Z] = meshgrid(x,y,z);

for i_x =1:length(x)
    for i_y =1:length(y)
        for i_z =1:length(z)
            measVec = [x(i_x);y(i_y);z(i_z)];
            BField = MagneticFieldAtAPoint(measVec);
            U(i_x,i_y,i_z) = BField(1);
            V(i_x,i_y,i_z) = BField(2);
            W(i_x,i_y,i_z) = BField(3);
        end
    end
end
startPoint = [0,0,0];
streamslice(X,Y,Z,U,V,W,0,0,0)

    function res = MagneticFieldAtAPoint(rMeasure)
        
        res =quadv(@(theta) theIntegrand(rMeasure,theta),0,2*pi);
        
    end

    function iRes = theIntegrand(rMeasure,theta)
        rSource1 = [rad*cos(theta);rad*sin(theta);0]; % parametize the source curve of dipoles
        %rSource2 = [rad*cos(theta);rad*sin(theta);-d];
        dL = [rad*-sin(theta);rad*cos(theta);0];
        iRes = loopBFieldofR(rMeasure,rSource1,dL);
    end

    function magField = magneticFieldOfR(rMeasure,rSource)
        displacement =(rMeasure-rSource);
        coefficients = mu_0/(norm(displacement)^3);
        D_hat = (displacement)/norm(displacement);
        magField = coefficients*(3*(dot(magVec,D_hat))*D_hat - magVec);
    end

    function magField = loopBFieldofR(rMeasure,rSource,dL)
        displacement =(rMeasure-rSource);
        coefficients = I*mu_0/(norm(displacement)^3);
        magField = coefficients*cross(dL,displacement);
    end
end