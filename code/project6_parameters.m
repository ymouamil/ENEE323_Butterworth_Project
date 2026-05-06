function p = project6_parameters()
% Shared parameters for ENEE323 Project 6.
p.T0 = 1.0;
p.alpha = 0.40;
p.Omega0 = 2*pi/p.T0;
p.beta = 50/3;
p.N = 1000;
p.Kmax = 100;
p.num = p.beta^3;
p.den = [1, 2*p.beta, 2*p.beta^2, p.beta^3];
end
