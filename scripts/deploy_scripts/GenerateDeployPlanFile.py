# -*- coding:utf-8 -*-  

import Utile  
import ConstantValue  
import os

def generateDeployPlanFile(docTempdir,changeLogFile):
	#生成feature的更新列表 
	Utile.writeLog("生成feature的更新列表 ");
	Utile.deploymentPlan_GenerateTableAction(ConstantValue.CHANGELOG_FEATURE_TAG,ConstantValue.CHANGELOG_FEATURE_TAG_END, docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME,changeLogFile) 

	#生成bugFix的更新列表
	Utile.writeLog("生成bugFix的更新列表");
	Utile.deploymentPlan_GenerateTableAction(ConstantValue.CHANGELOG_BUGFIX_TAG,ConstantValue.CHANGELOG_BUGFIX_TAG_END, docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME,changeLogFile) 

	#生成Deployment Plan
	Utile.writeLog("生成Deployment Plan");
	Utile.generalFile(ConstantValue.CHANGELOG_DEPLOYMENT_PLAN_TAG,ConstantValue.CHANGELOG_DEPLOYMENT_PLAN_TAG_END,changeLogFile,'temp');
	Utile.generalTableFromFile("temp",'temp')
	Utile.insertFile(ConstantValue.CHANGELOG_DEPLOYMENT_PLAN_TAG,docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME,'temp');  
	 
	Utile.deploymentPlan_replaceTagString(ConstantValue.RELEASE_APPLYNAME_TAG, ConstantValue.RELEASE_APPLYNAME_TAG_END, changeLogFile, docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME)
	Utile.deploymentPlan_replaceTagString(ConstantValue.RELEASE_BACKAGEGROUND_TAG, ConstantValue.RELEASE_BACKAGEGROUND_TAG_END,changeLogFile, docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME)
	Utile.deploymentPlan_replaceTagString(ConstantValue.RELEASE_DESTINATION_TAG, ConstantValue.RELEASE_DESTINATION_TAG_END, changeLogFile, docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME)
	Utile.deploymentPlan_replaceTagString(ConstantValue.RELEASE_VERSION_TAG, ConstantValue.RELEASE_VERSION_TAG_END, changeLogFile, docTempdir+ConstantValue.DEPLOYMENT_PLAN_FILENAME)
	os.remove('temp')
		
	

	
	
	
	