function part_iii_ifft_response(p, figDir, dataDir)
t = (0:p.N-1)*(p.T0/p.N);
Y = zeros(1,p.N);

for k = -p.Kmax:p.Kmax
    if k == 0
        Xk = p.alpha;
    else
        Xk = sin(k*p.alpha*pi)/(k*pi);
    end

    Hk = polyval(p.num,1j*k*p.Omega0)./polyval(p.den,1j*k*p.Omega0);
    Y(mod(k,p.N)+1) = Xk*Hk;
end

y_ifft = real(ifft(Y)*p.N);

y_cos = p.alpha*ones(size(t));
for k = 1:p.Kmax
    Xk = sin(k*p.alpha*pi)/(k*pi);
    Hk = polyval(p.num,1j*k*p.Omega0)./polyval(p.den,1j*k*p.Omega0);
    y_cos = y_cos + 2*Xk*abs(Hk).*cos(k*p.Omega0*t + angle(Hk));
end

phase = mod(t + 0.5*p.T0, p.T0) - 0.5*p.T0;
x_one = double(abs(phase) <= p.alpha*p.T0/2);
st = project6_plot_style();

f = figure('Name','Part III IFFT Response','Position',[120 120 960 470]);
plot(t,x_one,'Color',st.gray,'LineWidth',1.5); hold on;
plot(t,y_ifft,'Color',st.blue,'LineWidth',2.4);
plot(t,y_cos,'--','Color',st.gold,'LineWidth',1.1);
grid on;
xlabel('t (seconds)');
ylabel('Amplitude');
title('Part (iii): One-Period Output from the Truncated Fourier Series');
legend('Input pulse x(t)','IFFT output y(t)','Direct cosine check','Location','best');
xlim([0 p.T0]);

save_project6_figure(f,fullfile(figDir,'part_iii_ifft_response.png'));
% .fig saving removed for compatibility; PNG export is enough for LaTeX/GitHub.

% Save the parameters explicitly.
T0 = p.T0;
alpha = p.alpha;
Omega0 = p.Omega0;
beta = p.beta;
N = p.N;
Kmax = p.Kmax;

save(fullfile(dataDir,'part_iii_output.mat'), ...
    't','Y','y_ifft','y_cos','T0','alpha','Omega0','beta','N','Kmax');
end
