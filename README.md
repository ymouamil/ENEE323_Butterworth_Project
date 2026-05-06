# ENEE323 Project 6 — Fully Fixed Styled Project

This is the fully fixed package. It contains MATLAB code, generated figures, data files, LaTeX report files, and Simscape helper notes.

## Folder structure

- `code/` MATLAB scripts
- `data/` MAT files used by the report
- `docs/` LaTeX report and standalone circuit diagram
- `figures/` styled PNG figures already generated
- `simulink/` Simscape/Simulink helper notes and export script

## Run everything in MATLAB

Extract this ZIP. In MATLAB, set the current folder to the extracted project root, then run:

```matlab
clear functions
clear; clc; close all
run('code/run_all_project6.m')
```

This regenerates the styled figures:

- `figures/part_i_frequency_response.png`
- `figures/part_iii_ifft_response.png`
- `figures/part_iv_simulink_response.png`
- `figures/part_v_comparison.png`

## Compile the LaTeX report

Compile:

```text
docs/project6_report.tex
```

The report expects figures in `../figures/`, which is already correct in this folder structure.

## Simscape note

The included Part IV plot is a runnable frequency-domain/steady-state stand-in so the project works immediately. After you build the real Simscape model and export `t_sim`, `x_sim`, and `y_sim`, run:

```matlab
run('simulink/plot_simscape_export.m')
```

to overwrite the Part IV and Part V plots with your actual Simscape output.

## Upload to GitHub

```bash
git init
git add .
git commit -m "Complete fixed styled Project 6 package"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/ENEE323-Butterworth-Project.git
git push -u origin main
```


## Important fix in this version

This version removes all `savefig(...)` calls because some MATLAB installs can throw `H must be an array of handles to valid figures`. The project now saves PNG files only, which is what the LaTeX report needs.
