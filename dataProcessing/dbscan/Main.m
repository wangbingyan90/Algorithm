function  Main()
    global data
    data = rand(2, 50)
    Eps = 0.2;
    MinPts = 5;
    DBSCAN(Eps,MinPts)
end

