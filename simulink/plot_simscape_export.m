function plot_simscape_export()
% Run this after your Simscape model exports t_sim, x_sim, and y_sim.
clearvars -except t_sim x_sim y_sim
if ~(exist('t_sim','var') && exist('x_sim','var') && exist('y_sim','var'))
    error('Expected variables t_sim, x_sim, and y_sim in the workspace.');
end
projDir = fileparts(fileparts(mfilename('fullpath')));
addpath(fullfile(projDir,'code'));
p = project6_parameters();
project6_plot_style();
figDir = fullfile(projDir,'figures');
dataDir = fullfile(projDir,'data');

f = figure('Name','Real Simscape Output','Position',[120 120 1020 470]);
stairs(t_sim,x_sim,'LineWidth',1.3); hold on;
plot(t_sim,y_sim,'LineWidth',2.2);
grid on;
xlabel('t (seconds)'); ylabel('Voltage / amplitude');
title('Part (iv): Real Simscape Input and Output');
legend('Input pulse train x(t)','Simscape output y(t)','Location','best');
save_project6_figure(f,fullfile(figDir,'part_iv_simulink_response.png'));
save(fullfile(dataDir,'part_iv_simulink_output.mat'),'t_sim','x_sim','y_sim');

load(fullfile(dataDir,'part_iii_output.mat'),'t','y_ifft');
idx = (t_sim >= 8*p.T0) & (t_sim <= 10*p.T0);
t_sim_two = t_sim(idx) - 8*p.T0;
y_sim_two = y_sim(idx);
t_two = [t, t + p.T0];
y_two = [y_ifft, y_ifft];

f = figure('Name','Real Simscape Comparison','Position',[120 120 980 470]);
plot(t_two,y_two,'LineWidth',2.4); hold on;
plot(t_sim_two,y_sim_two,'o','MarkerSize',4.5,'MarkerFaceColor','none');
grid on;
xlabel('t (seconds)'); ylabel('y(t)');
title('Part (v): Fourier / IFFT versus Real Simscape Output');
legend('Fourier / IFFT output','Simscape output','Location','best');
save_project6_figure(f,fullfile(figDir,'part_v_comparison.png'));
end
