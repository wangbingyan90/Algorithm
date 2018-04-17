function [ sum ] = find_cluster( p,cluster )
%UNTITLED1 Summary of this function goes here
%  %找到点i的直接邻域
%global cluster;
global len;
sum=zeros(1,len);
for i=1:len
    if cluster(p,i)~=0 & sum(1,i)==0
        sum(1,i)=i;
    end
end
sum=sum(sum~=0);

        