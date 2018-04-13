% data�����ݼ��ϣ�N*2���� {x,y}
% Eps������뾶
% MinPts���������ڵ���С��������
% kindCluster:ÿ�б�ʾһ�ִ�
function count = DBSCAN(Eps,MinPts)
    global data
    count = 0;
    global state
    state = zeros(1, size(data, 2));    %���ݵ�״̬����N*1����0:δ����,1:���ĵ㣬2���Ǻ��ĵ�
    for i=1:size(state,2)
        if state(:,i) == 0
            state(:,i) = 1; 
            cluster = getNeighbours(data(:,i),Eps);
            if numel(cluster) < MinPts
                state(:,i) = 2;
            else
                finshCluster = expandCluster(cluster,Eps,MinPts);
                draw(finshCluster);
                count = count + 1;
            end
        end
    end
    fprintf('���� %d ����\n',count);
