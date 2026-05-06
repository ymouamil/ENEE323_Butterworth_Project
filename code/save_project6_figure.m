function save_project6_figure(f, outFile)
%SAVE_PROJECT6_FIGURE Save a styled figure as a PNG.
% This helper avoids axes-toolbar export problems and avoids savefig.

if nargin < 1 || isempty(f) || ~ishandle(f)
    f = gcf;
end

set(f,'InvertHardcopy','off');

axesList = findall(f,'Type','axes');
for k = 1:numel(axesList)
    try
        axesList(k).Toolbar.Visible = 'off';
    catch
        % Older MATLAB versions may not have axes toolbars.
    end
end

drawnow;

% print is more backward-compatible than exportgraphics.
print(f,outFile,'-dpng','-r180');
end
