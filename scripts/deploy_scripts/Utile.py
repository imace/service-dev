# -*- coding:utf-8 -*-  

import sys 
import unicodedata 
import os 
import os.path 
import shutil 
import time,  datetime 
import re
from collections import OrderedDict


# 按行读取文件orgFileName返回内容列表
def readFile(orgFileName):
	orgF = open(orgFileName,'r+')
	lineList=orgF.readlines()
	i = 0
	orgF.close()
	return lineList

# 将给定列表lineList 写入文件orgFileName, 写入成功返回true， 失败为false
def writeFile(lineList, orgFileName):
	orgF = open(orgFileName,'w')
	for  line in lineList: 	
		orgF.write(line); 
	orgF.flush();
	orgF.close();
	return 'true';

# 从changeLog提取beginTag到endTag之间的内容，转成sphinx支持的table格式，插入到deployFile文件。
def deploymentPlan_GenerateTableAction(beginTag,endTag, deployFile, changeLog):
	generalFile(beginTag,endTag,changeLog,'temp'); 
	generalTableFromFile("temp",'temp')
	delete = insertFile(beginTag,deployFile,'temp'); 
	if(delete > 0): 
		linelist =  readFile(deployFile)
		del linelist[delete-1]
		writeFile(linelist,deployFile)

#用orgFile中的标签值替换newFile中的标签，列入orgFile中有<a>example</a> 将newFile中的<a>变成example
def deploymentPlan_replaceTagString(beingTag, endTag, orgFile, newFile):
	orgFilelist = readFile(orgFile)  
	newFilelist = readFile(newFile)   
	post='';
	for line in orgFilelist:
		m = re.match(beingTag+'.*'+endTag, line) 
		if (m): 
			str =  m.group()  
			if(beingTag in line):
				post =  str.replace(beingTag,'').replace(endTag,'')
				break; 
	i=0
	for newline in newFilelist: 
		if(beingTag in newline):
			newFilelist[i] = newFilelist[i].replace(beingTag,post)  
		i +=1 
	writeFile(newFilelist,newFile) 

# 给定起始标签，结束标签，原文件名，新文件名，生成新的文件
def generalFile(beginTag,endTag,orgFileName,newFileName, ingoreStartStr="null"):
	orgF = open(orgFileName,'r')
	newF = open(newFileName,'w')
	isWrite = False
	line = orgF.readline()
	while line:
		line = orgF.readline()   
		if(line.startswith(endTag)):
			isWrite = False
		if(isWrite):  
			#if(((not line.startswith(ingoreStartStr))) or ingoreStartStr == "null"):
			if(((not line.startswith(ingoreStartStr)) or ingoreStartStr == ("null"))  and (len(line.strip().strip('\n')) != 0)): 
				newF.write('\t'+line.lstrip())
		if(line.startswith(beginTag)):
			isWrite = True
	orgF.close()
	newF.flush();
	newF.close();

def deleteRow(fileName, contentString): 
	linelist = readFile(fileName) 
	i =0
	for  line in  linelist:  
		if(contentString in line):
			break;
		i+=1
	if(i < len(linelist)):
		del linelist[i]
	writeFile(linelist,fileName)

# 给定起始标签，结束标签，原文件名，新文件名，生成新的文件
def insertFile(replaceTag,orgFileName,tagFile):
	linelist=readFile(orgFileName)
	i = 0
	deleteLine = 0
	hasContent = False;
	for  line in  linelist:  
		if(replaceTag in line):   
			if(os.path.exists(tagFile) and (os.path.getsize(tagFile) != 0)):  
				tagF = open(tagFile,'r+') 
				for  replaceStr in  tagF.readlines():
					if(len(replaceStr.strip()) != 0):
						hasContent = True;
						break; 
				if(hasContent):
					tagF.seek(0)
					linelist[i] = tagF.readlines();  
				else:
					deleteLine = i-1
					break;
			else:
				deleteLine = i-1
				break;
		i+=1
	if(deleteLine > 0):
		del linelist[deleteLine]
		del linelist[deleteLine]
	orgF = open(orgFileName,'w')        
	for  line in linelist: 	
		if(isinstance(line, list)):
			for temp in line:
				orgF.write(temp); 
		else:
			orgF.write(line); 
	orgF.flush();
	orgF.close();  
	return deleteLine
	
	#计算字符串的长度
def string_width(text):	
	s = 0
	for ch in text:
		if isinstance(ch, unicode):
			if unicodedata.east_asian_width(ch) != 'Na':
				s += 2
			else:
				s += 1
		else:
			s += 1
	return s
	
def createTableSphinx(table_title, table_lines, outputFile): 
	table_size_list = [];
	tableSpaceStr='  '
	table=[]
	titleLie = '' 
	for tr in table_title:
		table_size_list.append(string_width(tr.decode('utf-8 '))); 
	for trline in table_lines:
		i=0
		for trString in trline: 
			if(string_width(trString.decode('utf-8 '))>table_size_list[i]):
				table_size_list[i] = string_width(trString.decode('utf-8 '))
			i+=1
	i=0
	for trsize in table_size_list:
		table_size_list[i]=trsize+2
		i+=1
	for trsize in table_size_list: 
		temp = '='*trsize + tableSpaceStr
		titleLie = titleLie+temp
	table.append(titleLie)
	tempStr = ''
	i=0
	for trString in table_title:
		space=' ' *(table_size_list[i] - string_width(trString.strip().strip('\n').decode('utf-8 '))+string_width(tableSpaceStr.decode('utf-8 ')))
		tempStr =tempStr + trString.strip().strip('\n')+space
		i+=1	
	table.append(tempStr)	
	table.append(titleLie) 
	if(len(table_lines) == 0):
		os.remove(outputFile)
		return
	for table_line in table_lines:
		tempStr = ''
		i=0
		for trString in table_line:
			space=" "*(table_size_list[i] - string_width(trString.strip().strip('\n').decode('utf-8 '))+string_width(tableSpaceStr.decode('utf-8 ')))
			tempStr =tempStr + trString.strip().strip('\n')+space
			i+=1
		table.append(tempStr)
	table.append(titleLie) 
	outF = open(outputFile,'w')
	for table_line in table:
		outF.write(table_line+'\n');
	outF.flush();
	outF.close; 

#从文件生成Table，并将结果输出到outFile
def generalTableFromFile(tableFile, outFile): 
	tableContentLine=[] 
	tableLines = readFile(tableFile)
	if len(tableLines) > 0:
		del tableLines[0]
	else:
		return
	title = tableLines[0].strip().strip('\n').split(' - ')
	del tableLines[0]
	for table_line in tableLines:
			tableContentLine.append(table_line.strip().strip('\n').split(' - '))
	createTableSphinx(title, tableContentLine, outFile) 

#用orgFile中的标签值替换newFile中的标签，列入<a>ss</a> 将替换newFile中的<a>
def deploymentPlan_readTagString(beingTag, endTag, orgFile): 
	orgFilelist = readFile(orgFile) 
	post='';
	for line in orgFilelist:
		m = re.match(beingTag+'.*'+endTag, line) 
		if (m): 
			str =  m.group()  
			if(beingTag in line):
				post =  str.replace(beingTag,'').replace(endTag,'')
				break; 
	return post


# 给定标签，原文件名 ，replace string
def replaceFileTag(replaceTag,orgFileName,replaceStr): 
	linelist=readFile(orgFileName)	 
	i = 0
	for  line in  linelist:  
		if(replaceTag in line):    
			linelist[i] = linelist[i].replace(replaceTag,replaceStr); 
		i+=1
	writeFile(linelist, orgFileName)


def writeLog(logString):
	'''orgF = open("Log.txt",'w+') 
	orgF.write(logString+"\n");
	orgF.flush();
	orgF.close();'''
	print logString

