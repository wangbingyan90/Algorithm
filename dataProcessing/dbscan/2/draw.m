%
%»­³ö¸ö´Ø
%
function draw(data1,data2,state,count)
    type = ['+','d','>','o','p','x','v','<'];
    for i=1:count - 1
        c = find(state == i);
        plan1 = zeros(1,size(c,2));
        plan2 = zeros(1,size(c,2));
        b = size(c, 2)
        for j= 1:size(c, 2)
            plan1(:,j) = data1(:,c(:,j));
            plan2(:,j) = data2(:,c(:,j));  
        end
        scatter(plan1,plan2,10,type(i));
        hold on
    end

