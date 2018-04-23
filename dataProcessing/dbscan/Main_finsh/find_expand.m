function [ label] = find_expand( num,cluster )
%UNTITLED1 Summary of this function goes here
%  %找到点i密度可达的对象，采用堆栈的思想，弹出最后一个对象，计算eps邻域，再将未标记的对象压入
%  直到栈为空为止
global cluster;
global state;
global MinPts;
global len;
label=zeros(1,len);       %类别标签
while( ~isempty(num))
    m=size(num,2);
    for i=1:m        %找到邻域内未被标记的对象
        if state(1,num(1,i))==0
            label(num(1,i))=1;
        end
    end
    
    n=num(1,m);  
    sum=find_cluster(n,cluster);     %获取末位元素的eps邻域对象
    if  size(sum,2)>MinPts
        num(m)=[];  %弹出栈中末位元素并将它邻域内的数据对象压入栈
        sum_t=[];   %sum_t统计未被分类的末位元素的eps邻域对象
        for i=1:size(sum,2)
            if label(sum(1,i))==0
                sum_t=union(sum_t,sum(1,i));
            end
        end
        num=union(sum_t,num);
        if(isempty(num))
            break;
        end
    else
        num(m)=[];        %末位元素不是核心点，直接弹出
    end
end
    