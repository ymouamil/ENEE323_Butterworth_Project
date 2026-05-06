function run_all_project6()
% Master runner for ENEE323 Project 6.
clear; clc; close all;

p = project6_parameters();
s = project6_plot_style(); %#ok<NASGU>

rootDir = fileparts(mfilename('fullpath'));
addpath(rootDir);
projDir = fileparts(rootDir);
figDir = fullfile(projDir,'figures');
dataDir = fullfile(projDir,'data');

if ~exist(figDir,'dir'), mkdir(figDir); end
if ~exist(dataDir,'dir'), mkdir(dataDir); end

fprintf('Running Part (i)...\n');
part_i_frequency_response(p, figDir, dataDir);

fprintf('Running Part (ii)...\n');
part_ii_write_equations(p, fullfile(projDir,'docs','part_ii_equations.txt'));

fprintf('Running Part (iii)...\n');
part_iii_ifft_response(p, figDir, dataDir);

fprintf('Running Part (iv) proxy figure...\n');
part_iv_transfer_proxy_plot(p, figDir, dataDir);

fprintf('Running Part (v) comparison...\n');
part_v_comparison(p, figDir, dataDir);

fprintf('\nDone. Styled figures are in: %s\n', figDir);
end
