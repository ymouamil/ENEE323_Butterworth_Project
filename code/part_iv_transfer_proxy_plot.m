function part_iv_transfer_proxy_plot(p, figDir, dataDir)
% Generates a styled Part (iv) stand-in plot using the same frequency-domain
% model as the analytical solution. This keeps the package runnable even
% without Control System Toolbox or a completed Simscape model.
%
% After the real Simscape circuit is built, use simulink/plot_simscape_export.m
% to overwrite this figure with the physical Simscape output.

Ts = 0.020;
t_sim = 0:Ts:10*p.T0;
phase = mod(t_sim + 0.5*p.T0, p.T0) - 0.5*p.T0;
x_sim = double(abs(phase) <= p.alpha*p.T0/2);

% Steady-state output computed from the truncated cosine series.
y_sim = p.alpha*ones(size(t_sim));
for k = 1:p.Kmax
    Xk = sin(k*p.alpha*pi)/(k*pi);
    Hk = polyval(p.num,1j*k*p.Omega0)./polyval(p.den,1j*k*p.Omega0);
    y_sim = y_sim + 2*Xk*abs(Hk).*cos(k*p.Omega0*t_sim + angle(Hk));
end

st = project6_plot_style();

f = figure('Name','Part IV Time Response','Position',[120 120 1020 470]);
stairs(t_sim,x_sim,'Color',st.gray,'LineWidth',1.3); hold on;
plot(t_sim,y_sim,'Color',st.green,'LineWidth',2.2);
grid on;
xlabel('t (seconds)'); ylabel('Voltage / amplitude');
title('Part (iv): Ten-Period Input and Steady-State Output');
legend('Input pulse train x(t)','Output response y(t)','Location','best');
xlim([0 10*p.T0]);

save_project6_figure(f,fullfile(figDir,'part_iv_simulink_response.png'));
% .fig saving removed for compatibility; PNG export is enough for LaTeX/GitHub.
save(fullfile(dataDir,'part_iv_simulink_output.mat'),'t_sim','x_sim','y_sim');
end
