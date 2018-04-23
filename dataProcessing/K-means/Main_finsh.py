# -*- coding=utf-8 -*-

"""
authon:wby
created:2018-4-23
purpose:实现k-means算法(多维欧式距离)
"""

import numpy as np
import random
import xlrd

'''装载数据'''
def load():
    # data=np.loadtxt('D:\\a.csv',delimiter=',')
    table = xlrd.open_workbook('D:\\wine.xlsx').sheet_by_index(0)
    arr1 = table.row_values(1)
    data = np.array(arr1)
    for i in range(2,table.nrows):
        row = table.row_values(i)
        add = np.array(row)
        data = np.vstack((data,add))
    return data

'''计算距离矩阵'''
def calcDis(data,clu,k):
    clalist=[]  #存放计算距离后的list
    count = -1
    for i in data:
        count = count + 1
        clalist.append([])
        for j in clu:
            dist = np.sqrt(sum((i-j)**2))
            clalist[count].append(dist)
    clalist=np.array(clalist)   #转化为数组
    return clalist

'''分组'''
def group(data,clalist,k):
    grouplist=[]    #存放分组后的集群
    claList=clalist.tolist()
    data=data.tolist()
    for i in range(k):
        #确定要分组的个数，以空列表的形式，方便下面进行数据的插入
        grouplist.append([])
    for j in range(len(clalist)):
        sortNum=np.argsort(clalist[j])
        grouplist[sortNum[0]].append(data[j])
    grouplist=np.array(grouplist)
    return grouplist

'''计算质心'''
def calcCen(data,grouplist,k):
    clunew=[]
    data=data.tolist()
    # grouplist=grouplist.tolist()
    templist=[]
    #templist=np.array(templist)
    for i in grouplist:     #计算每个组的新质心
        add = np.zeros(len(i[0]))
        for j in i:
            add = j + add
        add = add/len(i)
        clunew.append(add)
    clunew=np.array(clunew)
    return clunew

'''优化质心'''
def classify(data,clu,k):
    clalist=calcDis(data,clu,k) #计算样本到质心的距离
    grouplist=group(data,clalist,k) #分组
    for i in range(k):
        #替换空值
        if grouplist[i]==[]:
            grouplist[i]=[0,0,0]
    clunew=calcCen(data,grouplist,k)
    sse=clunew-clu
    # print ("the clu is :%r\nthe group is :%r\nthe clunew is :%r\nthe sse is :%r" %(clu,grouplist,clunew,sse))
    return sse,clunew,grouplist

if __name__=='__main__':
    k=3 #给出要分类的个数的k值
    data=load() #装载数据
    clu=random.sample(data.tolist(),k)    #随机取质心
    clu=np.array(clu)
    sse,clunew,grouplist=classify(data,clu,k)
    while np.any(sse!=0):
        sse,clunew,grouplist=classify(data,clunew,k)
    clunew=np.sort(clunew,axis=0)
    print ("the best cluster is %r" %clunew)
    print ("the best grouplist is %r" %grouplist)
