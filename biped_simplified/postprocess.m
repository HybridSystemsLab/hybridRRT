%% store the results
current_time = datestr(datetime('now'));
dir = ['data/success-' loadfilepath current_time];
mkdir(dir);
save([dir '/data.mat']);

%% plot initial/final state
figure(1);
hold on
grid on
plot3(x0(1), x0(2), x0(3),'gs', 'MarkerSize', 10);
plot3(xf(1), xf(2), xf(3),'bs', 'MarkerSize', 10);
view(37.5, 30) 
%% plot search tree
plotcurrentsearchtree(T);

%% plot motion plan
plot3(motionplan(3, :), motionplan(4, :), motionplan(5, :),'r-', 'LineWidth', 2);

saveas(gcf,[dir '/planfigure.fig']);

% for i = 1:6
%     figure
%     plot(motionplan(1,:), motionplan(i + 2, :), '-');
%     xlabel('t (seconds)');
%     ylabel('state')
% end
%% 
