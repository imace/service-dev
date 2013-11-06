# -*- coding:utf-8 -*-  

import Utile 
import ConstantValue
from collections import OrderedDict
import os
import DealWithFile

#处理SQL脚本文件
#去处多余的空格，空行, 生成压缩文件
def doWithSQLFile(filename):

	fileF = open(filename,'r');
	filelist = fileF.readlines();
	fileF.close()
	outF = open(filename,'w')  
	for temp in filelist:
		outF.write(temp.lstrip());  
	outF.flush();
	outF.close();

#生成数据库更新步骤文档
def generateDatabaseStep(docTempdir, changeLogDir, changeLogFile):	
	Utile.writeLog("生成数据库更新步骤文档");
	Utile.generalFile(ConstantValue.CHANGELOG_UPDATESQL_PLAYNOW_TAG,ConstantValue.CHANGELOG_UPDATESQL_PLAYNOW_TAG_END,changeLogFile,docTempdir+ConstantValue.DATABASE_UPDATE_PLAYNOW_FILENAME);
	Utile.generalFile(ConstantValue.CHANGELOG_UPDATESQL_PLAYNOWLOG_TAG,ConstantValue.CHANGELOG_UPDATESQL_PLAYNOWLOG_TAG_END,changeLogFile,docTempdir+ConstantValue.DATABASE_UPDATE_PLAYNOWLOG_FILENAME);
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_DATABASESTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,changeLogDir+ConstantValue.PLAYNOW_DATEBASESETP_FILENAME);
	#生成数据库rollback步骤文档
	Utile.writeLog("生成数据库rollback步骤文档");
	Utile.generalFile(ConstantValue.CHANGELOG_ROLLBACKSQL_PLAYNOW_TAG,ConstantValue.CHANGELOG_ROLLBACKSQL_PLAYNOW_TAG_END,changeLogFile,docTempdir+ConstantValue.DATEABASE_ROLLBACK_PLAYNOW_FILENAME);
	Utile.generalFile(ConstantValue.CHANGELOG_ROLLBACKSQL_PLAYNOWLOG_TAG,ConstantValue.CHANGELOG_ROLLBACKSQL_PLAYNOWLOG_TAG_END,changeLogFile,docTempdir+ConstantValue.DATEABASE_ROLLBACK_PLAYNOWLOG_FILENAME);
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_DATABASESTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,changeLogDir+ConstantValue.PLAYNOW_DATEBASESETP_FILENAME);
	doWithSQLFile(docTempdir+ConstantValue.DATABASE_UPDATE_PLAYNOW_FILENAME)
	doWithSQLFile(docTempdir+ConstantValue.DATEABASE_ROLLBACK_PLAYNOW_FILENAME)
	doWithSQLFile(docTempdir+ConstantValue.DATABASE_UPDATE_PLAYNOWLOG_FILENAME)
	doWithSQLFile(docTempdir+ConstantValue.DATEABASE_ROLLBACK_PLAYNOWLOG_FILENAME)
	DealWithFile.zip_dir(docTempdir+ConstantValue.DATABASE_UPDATE_DIR,docTempdir+ConstantValue.DATABASE_UPDATE_DIR+'.zip' );
	DealWithFile.zip_dir(docTempdir+ConstantValue.DATABASE_ROLLBACK_DIR,docTempdir+ConstantValue.DATABASE_ROLLBACK_DIR+'.zip' );

#生成playnow service更新步骤
def generatePlayNowServiceStep(docTempdir, changeLogDir, changeLogFile):
	Utile.writeLog("生成playnow service更新步骤");
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_PLAYNOW_SERVICESTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,changeLogDir+ConstantValue.PLAYNOW_SERVICESETP_FILENAME);
	Utile.generalFile(ConstantValue.CHANGELOG_PLANNOW_SERVICE_WEBCONFIG_TAG,ConstantValue.CHANGELOG_PLANNOW_SERVICE_WEBCONFIG_TAG_END,changeLogFile,'temp','****');
	Utile.insertFile(ConstantValue.PLAYNOWSERVICE_WEBCONFIG_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,'temp');
	Utile.generalFile(ConstantValue.CHANGELOG_PLANNOW_SERVICE_APPSETTING_TAG,ConstantValue.CHANGELOG_PLANNOW_SERVICE_APPSETTING_TAG_END,changeLogFile,'temp','****');
	Utile.insertFile(ConstantValue.PLAYNOWSERVICE_APPSETTINGS_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,'temp');

def generateStepFile(docTempdir,changeLogFile, changeLogDir, installPackageName):
	#生成部署步骤 
	Utile.writeLog("生成部署步骤");	
	tempFile='deployStepsTemp';
	Utile.generalFile(ConstantValue.CHANGELOG_UPDATEAPPLICATION_TAG,ConstantValue.CHANGELOG_UPDATEAPPLICATION_TAG_END,changeLogFile,tempFile);
	orgF = open(tempFile,'r')
	steps = orgF.readlines()
	orgF.close(); 
	for  line in  steps:   
		if(line.strip().strip('\n').split(':')[1] == 'false'): 
			Utile.deleteRow(docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME, ConstantValue.DEPLOYMENT_STEPS_TAG_MAPPING[line.strip().strip('\n').split(':')[0]]); 	
			del ConstantValue.DEPLOYMENT_STEPS[line.strip().strip('\n').split(':')[0]]      
	deployStepF = open("temp",'w') 
	for name, steps in OrderedDict(sorted(ConstantValue.DEPLOYMENT_STEPS.items(), key=lambda t: t[0])).items(): 
		deployStepF.write(steps)
	deployStepF.close();
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_UPDATESTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,"temp");	
	
	#生成数据库更新步骤文档
	generateDatabaseStep(docTempdir, changeLogDir, changeLogFile)  
	
	#生成playnow service更新步骤
	generatePlayNowServiceStep(docTempdir, changeLogDir, changeLogFile)
	
	#生成PlayNow Managerment更新步骤
	Utile.writeLog("生成PlayNow Managerment更新步骤");
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_PLAYNOW_MANAGERMENTSTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,changeLogDir+ConstantValue.PLAYNOW_MANAGERSETP_FILENAME);
	Utile.generalFile(ConstantValue.CHANGELOG_PLANNOW_MANAGERMENT_WEBCONFIG_TAG,ConstantValue.CHANGELOG_PLANNOW_MANAGERMENT_WEBCONFIG_TAG_END,changeLogFile,'temp','****');
	Utile.insertFile(ConstantValue.PLAYNOWMANAGERMENT_WEBCONFIG_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,'temp'); 
	
	#生成WebAppStore更新步骤
	Utile.writeLog("生成WebAppStore更新步骤");
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_PLAYNOW_WEBAPPSTORESTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,changeLogDir+ConstantValue.WEBAPPSTORESETPS_FILENAME);
	Utile.generalFile(ConstantValue.CHANGELOG_WEBAPPSTORE_WEBCONFIG_TAG,ConstantValue.CHANGELOG_WEBAPPSTORE_WEBCONFIG_TAG_END,changeLogFile,'temp','****');
	Utile.insertFile(ConstantValue.WEBAPPSTORE_WEBCONFIG_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,'temp'); 
	
	#生成WinService更新步骤
	Utile.writeLog("生成WinService更新步骤");
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_PLAYNOW_WINSERVICESTEP_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,changeLogDir+ConstantValue.PLAYNOW_WINSERVICESETP_FILENAME);
	Utile.generalFile(ConstantValue.CHANGELOG_PLANNOW_WINSERVICE_CONFIG_TAG,ConstantValue.CHANGELOG_PLANNOW_WINSERVICE_CONFIG_TAG_END,changeLogFile,'temp','****');
	Utile.insertFile(ConstantValue.PLAYNOWWINSERVICE_WEBCONFIG_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,'temp'); 
	
	#替换包名字符串	 
	Utile.writeLog("替换包名字符串");
	Utile.replaceFileTag(ConstantValue.DEPLOMENT_RSTFILE_PLAYNOW_INSTALLPACEAGENAME_TAG,docTempdir+ConstantValue.DEPLOYMENT_STEPS_FILENAME,installPackageName);
	os.remove("temp")
	os.remove(tempFile)
	