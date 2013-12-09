# -*- coding:utf-8 -*-  
import Utile
import ConstantValue


def generateTestCaseFile(docTempdir, changeLogFile,changeLogDir):
	#生成当前测试列表 
	Utile.writeLog("生成当前测试列表");
	Utile.deploymentPlan_GenerateTableAction(ConstantValue.CHANGELOG_CURRENT_TESTCASE_TAG,ConstantValue.CHANGELOG_CURRENT_TESTCASE_TAG_END, docTempdir+ConstantValue.DEPLOYMENT_CURRENT_TESTCASE_FILENAME, changeLogFile) 
	Utile.insertFile(ConstantValue.DEPLOMENT_RSTFILE_PLAYNOW_TOTALESTCASE_TAG,docTempdir+ConstantValue.DEPLOYMENT_BASE_TESTCASE_FILENAME,changeLogDir+ConstantValue.BASE_TESTCASE_FILENAME);
