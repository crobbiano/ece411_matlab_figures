function [ arc ] = circr( radius,rad_start, rad_end, N )
%circr Generates an arc and passes it back as matrix.
%       radius - the radius of the arc
%       rad_start - the angle to start the arc
%       rad_end - the angle to end the arc

if exist('N')
    N=N
else
    N=25
end
rad_ang = linspace(rad_start, rad_end, N);
arc = [radius*cos(rad_ang);  radius*sin(rad_ang)];
end

