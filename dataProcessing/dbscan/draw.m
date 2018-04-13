%
%»­³ö¸ö´Ø
%
function draw(cluster)
    global data
    plan = zeros(2, size(cluster, 2));
    for i= 1:size(cluster, 2)
        plan(:,i)= data(:,i);   
    end
    plan
    scatter(plan(1,:),plan(2,:))
    hold on

