%
%递归计算出cluster簇的间接密度内的个点集合
%
function clusters = expandCluster(cluster,Eps,MinPts)
    clusters = cluster;
    global state
    global data
    for i=1:size(cluster,2)
        p = cluster(:,i);
        if state(:,p) == 0
            state(:,p) = 1;
            clusterE = getNeighbours(data(:,p),Eps);
            if numel(clusterE) < MinPts
                state(:,i) = 2;
            else
                clusters = unique([clusters,expandCluster(clusterE,Eps,MinPts)]);
            end
        end
    end



