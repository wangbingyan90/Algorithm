%
%��ȡ��p�뾶Eps�ڣ����㼯��
%
function cluster = getNeighbours(p,Eps)
    global data
    cluster = zeros(1, size(data, 2));
    for i = 1:size(data, 2)
        if norm(p-data(:,i)) <= Eps
            cluster(i) = i;
        end        
    end
    cluster = cluster(cluster~=0);