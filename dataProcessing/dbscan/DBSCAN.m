% data：数据集合，N*2矩阵 {x,y}
% Eps：领域半径
% MinPts：Ε领域内的最小样本点数
% kindCluster:每行表示一种簇
function count = DBSCAN(Eps,MinPts)
    global data
    count = 0;
    global state
    state = zeros(1, size(data, 2));    %数据点状态量，N*1矩阵，0:未处理,1:核心点，2：非核心点
    for i=1:size(state,2)
        if state(:,i) == 0      % 判断是否为处理过，如果没处理过，进行处理
            state(:,i) = 1;     % 标记处理过，进行处理
            cluster = getNeighbours(data(:,i),Eps); % 计算其领域点数量
            if numel(cluster) < MinPts     % 小于MinPts 标记非核心点 否则为核心点进行扩展
                state(:,i) = 2;
            else
                finshCluster = expandCluster(cluster,Eps,MinPts);
                draw(finshCluster);
                count = count + 1;
            end
        end
    end
    fprintf('共有 %d 个簇\n',count);
