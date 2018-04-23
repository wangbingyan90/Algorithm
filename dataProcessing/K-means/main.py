# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
from numpy import random
def Distance(x):
    def Dis(y):
        return np.sqrt(sum((x-y)**2))                      #欧式距离
    return Dis
def init_k_means(k):
    k_means = {}
    for i in range(k):
        k_means[i] = []
    return k_means
def cal_seed(k_mean):                                      #重新计算种子点
    k_mean = np.array(k_mean)
    new_seed = np.mean(k_mean,axis=0)                      #各维度均值
    return new_seed
def K_means(data,seed_k,k_means):
    for i in data:
        f = Distance(i)
        dis = list(map(f,seed_k))                        #某一点距所有种子点的距离
        index = dis.index(min(dis))
        k_means[index].append(i)
    new_seed = []                                           #存储新种子
    for i in range(len(seed_k)):
        new_seed.append(cal_seed(k_means[i]))
    new_seed = np.array(new_seed)
    return k_means,new_seed
def run_K_means(data,k):
    seed_k = data[random.randint(len(data),size=k)]       #随机产生种子点
    k_means = init_k_means(k)                                #初始化每一类
    result = K_means(data,seed_k,k_means)
    count = 0
    while not (result[1] == seed_k).all():                     #种子点改变，继续聚类
        count+=1
        seed_k = result[1]
        k_means = init_k_means(k=7)
        result = K_means(data,seed_k,k_means)
    print('Done')
    #print(result[1])
    print(count)
    plt.figure(figsize=(8,8))
    Color = 'rbgyckm'
    for i in range(k):
        mydata = np.array(result[0][i])
        plt.scatter(mydata[:,0],mydata[:,1],color = Color[i])
    return result[0]
data = np.loadtxt('K-means_data')
run_K_means(data,k=7)
