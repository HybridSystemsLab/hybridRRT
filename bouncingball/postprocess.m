%% store the results
current_time = datestr(datetime('now'));
dir = ['data/success-' loadfilepath current_time];
mkdir(dir);
save([dir '/data.mat']);

%% plot initial/final state
figure(1);
hold on
grid on
plot(x0(1), x0(2),'gs', 'MarkerSize', 10);
plot(xf(1), xf(2),'bs', 'MarkerSize', 10);

%% plot search tree
plotcurrentsearchtree(T);

%% plot motion plan
plot(motionplan(3, :), motionplan(4, :),'r-', 'LineWidth', 2);

saveas(gcf,[dir '/planfigure.fig']);
