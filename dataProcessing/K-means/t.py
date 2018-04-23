import xlrd
import numpy as np

table = xlrd.open_workbook('D:\\wine.xlsx').sheet_by_index(0)

# arr1 = table.row_values(1)
# data = np.array(arr1)
# for i in range(2,table.nrows):
#     row = table.row_values(i)
#     add = np.array(row)
#     data = np.vstack((data,add))
# print(data)

    # table = xlrd.open_workbook('D:\\wine.xlsx').sheet_by_index(0)
    # arr1 = table.row_values(1)
    # data = np.array(arr1)
    # for i in range(2,table.nrows):
    #     row = table.row_values(i)
    #     add = np.array(row)
    #     data = np.vstack((data,add))

# v1 = np.array([3,4,3,4])
# v2 = np.array([1,2,3,4])
# v5 = np.array([1,2,3,4])
# v3 = np.vstack((v1,v2))
# v4 = np.vstack((v3,v5))
# print(v1+v2)
# print(v3)
# print(np.sqrt(sum((v1-v2)**2)))
# from numpy import *
# importlrd
# data = xlrd.open_workbook('D://wine.xlsx')
# table = data.sheets()[0]
# nrows = table.nrows #行数
# ncols = table.ncols #列数
# c1=arange(0,nrows,1)
# datamatrix=zeros((nrows,ncols))
# for x in range(ncols):
#     cols =table.col_values(x)
#     minVals=min(cols)
#     maxVals=max(cols)
#     cols1=matrix(cols)# 把list转换为矩阵进行矩阵操作
#     ranges=maxVals-minVals
#     b=cols1-minVals
#     normcols=b/ranges# 数据进行归一化处理
#     datamatrix[:,x]=normcols# 把数据进行存储


print(np.zeros(5))
