clc; clear; clf;
% switch_designs = {'BDC_switch_ideal', 'BDC_switch_corner', 'MMI_switch_ideal'};
switch_designs = {'BDC_switch_ideal'};
bestOrWorst = 'Best';
% name = '16x16_(with_waveguides)_worst';
n = 2;
while n <= 16
    name = [switch_designs{1}, '/', bestOrWorst, '/', num2str(n), '.mat'];
    data = load(name);

    % Don't need the results field anymore
    data = rmfield(data,'results');
    legendNames = fieldnames(data);
    data = struct2cell(data);
    h=figure;
    for i = 1:numel(data)
        fieldstr = data{i}.Lumerical_dataset.attributes.variable;
        plot(data{i}.wavelength, data{i}.(fieldstr)(:))
        ylim([-120 10]);
        hold on;
        set(gca,'fontsize', 13);
    end

    legend(legendNames);
    title(['TE Gain of ','N=',num2str(n),' HDBE Switch vs. Wavelength ', bestOrWorst, ' Path']);
    xlabel('Wavelength (m)');
    ylabel('Gain (dB)');
    n=n*2;
    % saveas(h,name,'fig');
end