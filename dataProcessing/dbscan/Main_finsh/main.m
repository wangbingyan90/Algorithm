function [ output_args ] = main( )
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here
    global cluster;
    global len; 
    len = 300;
    Eps = 1.0;
    global MinPts;
    MinPts = 13;
    count = 1;
    % data1 = rand(1,len)
    % data2 = rand(1,len)
    % save x.txt -ascii data1
    % save y.txt -ascii data2
    data1=load ('x.txt')*10;
    data2=load ('y.txt')*10;
    %����������
    dis_mat=zeros(len,len);
    for i=1:len
        for j=i:len
        if i==j
            dis_mat(i,j)=0;
        else
            dis_mat(i,j)=sqrt((data1(1,i)-data1(1,j)).^2+(data2(1,i)-data2(1,j)).^2);
            dis_mat(j,i)=dis_mat(i,j);
        end
        end
    end
%---------��cluster�б��ÿ������eps�����ڵ����ݶ���    
    num=zeros(1,len);
    cluster=zeros(len,len);
    for i=1:len    
        for j=1:len
        if dis_mat(i,j)<Eps
            cluster(i,j)=j;
        end
        end 
    end
%------------------------------%
 global state;      %״̬��ǣ�0��δ��ǣ�>1�����
    state=zeros(1,len);
    for i=1:len
        num_exp=zeros(1,len);
        if state(1,i)==0     %�ҵ�δ��ǵ����ݶ���
            num=find_cluster(i,cluster)   %�ҵ���i��ֱ������
            if size(num,2)<MinPts
               % i=i+1;
            else
            num_exp=find_expand(num,cluster);         %�ҵ���i�ܶȿɴ�Ķ���
            for j=1:len
                if num_exp(1,j)==1
                    state(1,j)=count;
                end
            end
            count=count+1;
            end
        end
    end
    % scatter(data1,data2,10);
    draw(data1,data2,state,count)

     

    
    