function [ label] = find_expand( num,cluster )
%UNTITLED1 Summary of this function goes here
%  %�ҵ���i�ܶȿɴ�Ķ��󣬲��ö�ջ��˼�룬�������һ�����󣬼���eps�����ٽ�δ��ǵĶ���ѹ��
%  ֱ��ջΪ��Ϊֹ
global cluster;
global state;
global MinPts;
global len;
label=zeros(1,len);       %����ǩ
while( ~isempty(num))
    m=size(num,2);
    for i=1:m        %�ҵ�������δ����ǵĶ���
        if state(1,num(1,i))==0
            label(num(1,i))=1;
        end
    end
    
    n=num(1,m);  
    sum=find_cluster(n,cluster);     %��ȡĩλԪ�ص�eps�������
    if  size(sum,2)>MinPts
        num(m)=[];  %����ջ��ĩλԪ�ز����������ڵ����ݶ���ѹ��ջ
        sum_t=[];   %sum_tͳ��δ�������ĩλԪ�ص�eps�������
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
        num(m)=[];        %ĩλԪ�ز��Ǻ��ĵ㣬ֱ�ӵ���
    end
end
    