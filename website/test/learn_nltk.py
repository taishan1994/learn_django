#coding=utf-8
import jieba
#默认模式
result=jieba.tokenize(u'自然语言处理有用')
for tk in result:
	print("%s\t\t start: %d \t\t end: \t\t%d" % (tk[0],tk[1],tk[2]))
print("\n--------------我是分割线-------------\n")
#搜索模式
result=jieba.tokenize(u'自然语言处理有用',mode='search')
for tk in result:
	print("%s\t\t start: %d \t\t end: %d" % (tk[0],tk[1],tk[2]))