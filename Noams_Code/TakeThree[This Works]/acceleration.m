function res = acceleration(t, R,V)
    rMeasure = R;
    q = -1.6e-19;
    m=9.1e-31;
    res = cross(V,MagneticFieldAtAPoint(rMeasure)) * q/m;
end