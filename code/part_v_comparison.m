function part_v_comparison(p, figDir, dataDir)
load(fullfile(dataDir,'part_iii_output.mat'),'t','y_ifft');
load(fullfile(dataDir,'part_iv_simulink_output.mat'),'t_sim','y_sim');

idx = (t_sim >= 8*p.T0) & (t_sim <= 10*p.T0);
t_sim_two = t_sim(idx) - 8*p.T0;
y_sim_two = y_sim(idx);

t_two = [t, t + p.T0];
y_two = [y_ifft, y_ifft];
st = project6_plot_style();

f = figure('Name','Part V Comparison','Position',[120 120 980 470]);
plot(t_two,y_two,'Color',st.blue,'LineWidth',2.4); hold on;
plot(t_sim_two,y_sim_two,'o','MarkerSize',4.5,'MarkerEdgeColor',st.gold,'MarkerFaceColor','none');
grid on;
xlabel('t (seconds)'); ylabel('y(t)');
title('Part (v): Comparison over Two Periods');
legend('Fourier / IFFT output','Sampled simulation output','Location','best');
xlim([0 2*p.T0]);

save_project6_figure(f,fullfile(figDir,'part_v_comparison.png'));
% .fig saving removed for compatibility; PNG export is enough for LaTeX/GitHub.
end
