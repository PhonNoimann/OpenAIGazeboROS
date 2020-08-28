t = 1:length(reward); t = t';

pr = polyfit(t,reward,1);
fr = polyval(pr,t);

pl = polyfit(t,len,1);
fl = polyval(pl,t);

if pr(1) > 0
    disp("The robot is learning")
else
    disp("The robot is not learning")
end

plot(t,reward,t,fr,'--',t,len,t,fl,'--'), grid on, title("\alpha = 0.1, \gamma = 0.9, rewards for wall distance and every 70 episodes")

m = mean(reward);
outlier = m*3;
I = find(reward > outlier);
if length(I) > 0
    reward(I) = [];
    len(I) = [];
    t = 1:length(reward); t = t';

    pr = polyfit(t,reward,1);
    fr = polyval(pr,t);

    pl = polyfit(t,len,1);
    fl = polyval(pl,t);
    
    figure()
    plot(t,reward,t,fr,'--',t,len,t,fl,'--'), grid on, title(['Without outliers, m = ', num2str(pr(1))])
end