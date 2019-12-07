"""
import requests
url = 'https://www.lagou.com/jobs/positionAjax.json?needAddtionalResult=false'

payload = {
	'first': 'true',
	'pn': '1',
	'kd': 'python'
}

header = {
	'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36',
	'Referer': 'https://www.lagou.com/jobs/list_python?labelWords=&fromSearch=true&suginput=',
	'Accept': 'application/json, text/javascript, */*; q=0.01'
}

urls ='https://www.lagou.com/jobs/list_python?labelWords=&fromSearch=true&suginput='
s = requests.Session()
# 获取搜索页的cookies
s.get(urls, headers=header, timeout=3)
# 为此次获取的cookies
cookie = s.cookies
# 获取此次文本
response = s.post(url, data=payload, headers=header, cookies=cookie, timeout=5).text
print(response)
"""

"""
import requests
from lxml import etree
headers={
'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36',
}
url="https://movie.douban.com/cinema/nowplaying/wuhan/"
response=requests.get(url,headers=headers)
text=response.text
html=etree.HTML(text)
result=etree.tostring(html,encoding="utf-8").decode("utf-8")
uls=html.xpath("//ul[@class='lists']")[0]
# res=etree.tostring(uls,encoding="utf-8").decode("utf-8")
lis=uls.xpath("./li")
movies=[]
for li in lis:
	name=li.xpath("@data-title")[0]
	score=li.xpath("@data-score")[0]
	country=li.xpath("@data-region")[0]
	director=li.xpath("@data-director")[0]
	actors=li.xpath("@data-actors")[0]
	category=li.xpath("@data-category")[0]
	movie={
		"name":name,
		"score":score,
		"country":country,
		"director":director,
		"actors":actors,
		"category":category
	}
	movies.append(movie)
print(movies)
"""

import requests
from lxml import etree
headers={
'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
			  'AppleWebKit/537.36 (KHTML, like Gecko) '
			  'Chrome/73.0.3683.86 '
			  'Safari/537.36',
"Referer":"https://www.ygdy8.net/html/gndy/dyzz/index.html",
}
base_url="https://www.dytt8.net"
def get_domain_urls(url):
	response=requests.get(url=url,headers=headers)
	text=response.text
	html=etree.HTML(text)
	detail_urls=html.xpath("//table[@class='tbspan']//a/@href")
	detail_urls=map(lambda url:base_url+url,detail_urls)
	return detail_urls

url="https://www.dytt8.net/html/gndy/dyzz/list_23_1.html"
# for i in get_domain_urls(url):
# 	print(i)
def parse_detail_page(url):
	movie={}
	response=requests.get(url,headers=headers)
	text=response.content.decode("GBK")
	html=etree.HTML(text)
	zoom=html.xpath("//div[@id='Zoom']")[0]
	infos=zoom.xpath("//text()")
	def parse_info(info,rule):
		return info.replace(rule,"").lstrip()
	for k,v in enumerate(infos):
		if v.startswith("◎译　　名"):
			v=parse_info(v,"◎译　　名").split("/")[0]
			movie["name"]=v
		elif v.startswith("◎产　　地"):
			v=parse_info(v,"◎产　　地")
			movie["country"]=v
		elif v.startswith("◎类　　别"):
			v=parse_info(v,"◎类　　别")
			movie["category"]=v
		elif v.startswith("◎豆瓣评分"):
			v=parse_info(v,"◎豆瓣评分").split("/")[0]
			movie["douban"]=v
		elif v.startswith("◎导　 演"):
			v=parse_info(v,"◎导　　演")
			movie["director"]=v
		elif v.startswith("◎主　　演"):
			v=parse_info(v,"◎主　　演")
			actors=[v]
			for x in range(k+1,len(infos)):
				actor=infos[x].strip()
				if actor.startswith("◎"):
					break
				actors.append(actor)
			movie["actors"]=actors
		elif v.startswith("◎简　　介"):
			profile=""
			for x in range(k+1,len(infos)):
				tmp=infos[x].strip()
				if tmp.startswith("【下载地址】"):
					break
				else:
					profile=profile+tmp
			movie["profile"]=profile
	down_url=html.xpath("//td[@bgcolor='#fdfddf']/a/@href")
	movie["down_url"]=down_url
	return movie

def spider():
	domain_url="https://www.dytt8.net/html/gndy/dyzz/list_23_{}.html"
	movies=[]
	for i in range(1,2):
		page=str(i)
		url=domain_url.format(page)
		detail_urls=get_domain_urls(url)
		for detail_url in detail_urls:
			movie = parse_detail_page(detail_url)
			movies.append(movie)
	print(movies)
spider()
