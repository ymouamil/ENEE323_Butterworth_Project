function part_i_frequency_response(p, figDir, dataDir)
Omega = 0:(0.1*p.Omega0):(100*p.Omega0);
s = 1j*Omega;
H = polyval(p.num,s)./polyval(p.den,s);
mag_dB = 20*log10(abs(H));
phase_deg = unwrap(angle(H))*180/pi;
H_beta = polyval(p.num,1j*p.beta)./polyval(p.den,1j*p.beta);
mag_beta_dB = 20*log10(abs(H_beta));
Omega_plot = Omega; Omega_plot(1) = eps;
st = project6_plot_style();

f = figure('Name','Part I Frequency Response','Position',[90 80 980 700]);
tiledlayout(2,1,'Padding','compact','TileSpacing','compact');

nexttile;
semilogx(Omega_plot,mag_dB,'Color',st.blue,'LineWidth',2.4); hold on;
xline(p.beta,'--','Color',st.gold,'LineWidth',1.4);
yline(-3.0103,'--','Color',st.red,'LineWidth',1.2);
plot(p.beta,mag_beta_dB,'o','MarkerSize',7,'MarkerFaceColor',st.green,'MarkerEdgeColor',st.green);
grid on;
xlabel('\Omega (rad/s)'); ylabel('|H(j\Omega)| (dB)');
title('Magnitude Response of the Third-Order Butterworth Lowpass Filter');
legend('|H(j\Omega)|','\Omega = \beta','-3.0103 dB','Location','southwest');
ylim([-80 5]);

nexttile;
semilogx(Omega_plot,phase_deg,'Color',st.purple,'LineWidth',2.3); hold on;
xline(p.beta,'--','Color',st.gold,'LineWidth',1.4);
grid on;
xlabel('\Omega (rad/s)'); ylabel('\angle H(j\Omega) (degrees)');
title('Phase Response');
ylim([-280 10]);

sgtitle('Part (i): Frequency Response','Color',st.fg,'FontWeight','bold');

save_project6_figure(f,fullfile(figDir,'part_i_frequency_response.png'));
% .fig saving removed for compatibility; PNG export is enough for LaTeX/GitHub.
save(fullfile(dataDir,'part_i_frequency_response.mat'),'Omega','H','mag_dB','phase_deg','H_beta','mag_beta_dB');
end
