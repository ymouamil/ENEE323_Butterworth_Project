function part_ii_write_equations(p, outFile)
lines = {
'Part (ii): Fourier-series expression for the output'
''
'Input:'
'  x(t) = sum_{k=-inf}^{inf} X_k exp(j k Omega_0 t)'
'  X_k = sin(k alpha pi)/(k pi), with X_0 = alpha'
''
'Output complex Fourier series:'
'  y(t) = sum_{k=-inf}^{inf} X_k H(j k Omega_0) exp(j k Omega_0 t)'
''
'Cosine form using nonnegative harmonics:'
'  y(t) = alpha + 2 sum_{k=1}^{inf} X_k |H(j k Omega_0)| cos(k Omega_0 t + angle(H(j k Omega_0)))'
''
'Important note:'
'  Keep X_k with its sign. Do not replace X_k by |X_k| unless you also add the missing phase correction.'
''
sprintf('For this project: alpha = %.2f and Omega_0 = %.8f rad/s.', p.alpha, p.Omega0)
};

fid = fopen(outFile,'w');
for n = 1:numel(lines)
    fprintf(fid,'%s\n',lines{n});
end
fclose(fid);
end
