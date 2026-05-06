function s = project6_plot_style()
% Centralized plot style used by the scripts.
s.bg = [13 20 16]/255;
s.panel = [19 29 22]/255;
s.panel2 = [25 38 30]/255;
s.fg = [229 239 231]/255;
s.blue = [72 169 166]/255;
s.green = [115 208 85]/255;
s.gold = [212 163 115]/255;
s.red = [231 111 81]/255;
s.gray = [139 163 139]/255;
s.purple = [181 132 212]/255;
s.axis = [160 178 160]/255;

set(groot,'defaultFigureColor',s.bg);
set(groot,'defaultAxesColor',s.panel);
set(groot,'defaultAxesXColor',s.fg);
set(groot,'defaultAxesYColor',s.fg);
set(groot,'defaultAxesGridColor',s.gray);
set(groot,'defaultAxesMinorGridColor',s.gray);
set(groot,'defaultTextColor',s.fg);
set(groot,'defaultAxesFontSize',11);
set(groot,'defaultLineLineWidth',1.8);
set(groot,'defaultAxesLineWidth',1.0);

try
    set(groot,'defaultAxesToolbarVisible','off');
catch
    % Older MATLAB versions do not support this property.
end
end
