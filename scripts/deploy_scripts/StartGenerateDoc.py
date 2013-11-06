# -*- coding:utf-8 -*-  

import DealWithFile
import os
import Utile
import ConstantValue 
import time
import GenerateDeployPlanFile
import GenerateStepFile
import GenerateTestFile
import sys


Utile.writeLog("------------BEGIN GENGRATE PLAYNOW PACKAGE AND ZIP THE OUTPUT FILE------------")
#代码的工作目录
WORKSPACE_DIR = sys.argv[1]
print WORKSPACE_DIR
#当前日期时间，主要是用于生成文件名
CURRENT_TIME = time.strftime('%Y-%m-%d',time.localtime(time.time()))
#ChangeLog目录
CHANGELOG_DIR=WORKSPACE_DIR+"\\ChangeLog"
#ChangeLog目录中readme文件路径
CHANGE_LOG_FILE= CHANGELOG_DIR+"\\readme.txt"  
#文档模板目录
PLAYNOW_DOCMENT_TEMPLATE_DIR=WORKSPACE_DIR+"\\DeployTemplate"

#读出当期上线的版本
CURRENTVERSION = Utile.deploymentPlan_readTagString(ConstantValue.RELEASE_VERSION_TAG, ConstantValue.RELEASE_VERSION_TAG_END, CHANGE_LOG_FILE)
Utile.writeLog("---current application version = "+CURRENTVERSION+"---")

#输出目录
OUTDIR = WORKSPACE_DIR +'\\PlayNow_out'
#编译结果的输出目录  
BINDIR = OUTDIR+"\\Release"+CURRENT_TIME+"_"+CURRENTVERSION
#编译结果中安装包的输出目录
PLAYNOW_PACKAGE_DIR = BINDIR + '\\PlayNow_'+CURRENTVERSION
#编译结果中文档的输出目录
PLAYNOW_DOCMENT_DIR = BINDIR + '\\PlayNow_Docment_'+CURRENTVERSION 
#zip包的文件名
OUTZIP_FILENAME = 'Release'+CURRENT_TIME+"_"+CURRENTVERSION+'.zip'
#生成最终压缩包路径
OUTZIP_FILEPATH = OUTDIR+'\\'+OUTZIP_FILENAME

#调用编译sphinx文档的bat命令
COMMAND_COMPILE_PALNOW_DOC_BAT = WORKSPACE_DIR+'\\deploy_scripts\\CompilePlayNowDoc.bat '+PLAYNOW_DOCMENT_TEMPLATE_DIR
#html文件的生成目录
PLAYNOW_DOC_HTML_DIR = PLAYNOW_DOCMENT_TEMPLATE_DIR+"\\build\\html"

#临时文件名
TEMPFILE='temp';

Utile.writeLog("---BEGIN Generate the playnow installed package---")
AVAILABLE_FILES = {'2PlayNowService'     : "PlayNowService",
             '3PlayNowManager' : "PlayNowManager",
             '4WebAppStore'   : "WebAppStore",
			 '5PlayNowWinService' : "PlayNowWinService"
     }
Utile.generalFile(ConstantValue.CHANGELOG_UPDATEAPPLICATION_TAG,ConstantValue.CHANGELOG_UPDATEAPPLICATION_TAG_END,CHANGE_LOG_FILE,TEMPFILE);
orgF = open(TEMPFILE,'r')
steps = orgF.readlines()
orgF.close(); 
for  line in  steps:   
		if(line.strip().strip('\n').split(':')[1] == 'false'):  
			if AVAILABLE_FILES.has_key(line.strip().strip('\n').split(':')[0]):
				del AVAILABLE_FILES[line.strip().strip('\n').split(':')[0]]    
for name, filename in AVAILABLE_FILES.items():
	DealWithFile.copyFiles(WORKSPACE_DIR+"\\"+filename, PLAYNOW_PACKAGE_DIR+"\\"+filename)
Utile.writeLog("---END Generate the playnow installed package---")
	
Utile.writeLog("---BEGIN Generate the playnow docment---")
Utile.writeLog("start Generate the deployment plan doc")
GenerateDeployPlanFile.generateDeployPlanFile(PLAYNOW_DOCMENT_TEMPLATE_DIR,CHANGE_LOG_FILE)
Utile.writeLog("start Generate the deployment steps doc")
GenerateStepFile.generateStepFile(PLAYNOW_DOCMENT_TEMPLATE_DIR,CHANGE_LOG_FILE, CHANGELOG_DIR, OUTZIP_FILENAME)
Utile.writeLog("start Generate the deployment testcase doc")
GenerateTestFile.generateTestCaseFile(PLAYNOW_DOCMENT_TEMPLATE_DIR,CHANGE_LOG_FILE, CHANGELOG_DIR)
os.system(COMMAND_COMPILE_PALNOW_DOC_BAT)
DealWithFile.copyFiles(PLAYNOW_DOC_HTML_DIR, PLAYNOW_DOCMENT_DIR)
Utile.writeLog("---END Generate the playnow docment---")
DealWithFile.zip_dir(BINDIR,OUTZIP_FILEPATH );
Utile.writeLog("------------BEGIN GENGRATE PLAYNOW PACKAGE AND ZIP THE OUTPUT FILE------------")