function  Main()
    global data
    data = rand(2, 100);
    Eps = 0.11;
    MinPts = 5;
    DBSCAN(Eps,MinPts)
end

