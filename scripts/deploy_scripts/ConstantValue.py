# -*- coding:utf-8 -*-  


#如下四个变量表示部署文档模板地址
DEPLOYMENT_PLAN_FILENAME="\\source\\0.deploymentPlan.rst" 
DEPLOYMENT_STEPS_FILENAME="\\source\\1.deploymentSteps.rst"
DEPLOYMENT_CURRENT_TESTCASE_FILENAME="\\source\\2_1.deploymentTestCase_currentVesion.rst"
DEPLOYMENT_BASE_TESTCASE_FILENAME="\\source\\2_2.deploymentTestCase_TotalTest.rst"

#如下五个变量表示部署中每个步骤的文件地址
PLAYNOW_WINSERVICESETP_FILENAME= "\\DeploySteps\\PlayNowWinServiceStep.txt"
PLAYNOW_MANAGERSETP_FILENAME= "\\DeploySteps\\PlayNowManagerStep.txt"  
PLAYNOW_DATEBASESETP_FILENAME= "\\DeploySteps\\Datastep.txt"
PLAYNOW_SERVICESETP_FILENAME= "\\DeploySteps\\PlayNowServiceStep.txt"
WEBAPPSTORESETPS_FILENAME= "\\DeploySteps\\WebAppStoreStep.txt"

#表示部署文档中基本测试case的文件地址
BASE_TESTCASE_FILENAME = "\\DeploySteps\\DeploymentBaseTestCase.txt"

#数据库更新脚本文件的地址
DATABASE_UPDATE_DIR="\\source\\_static\\_downloads\\updateDB_sql"
DATABASE_UPDATE_PLAYNOW_FILENAME=DATABASE_UPDATE_DIR+"\\updateDB_PlayNow.sql"
DATABASE_UPDATE_PLAYNOWLOG_FILENAME=DATABASE_UPDATE_DIR+"\\updateDB_PlayNowLog.sql"
#数据库回滚脚本文件的地址
DATABASE_ROLLBACK_DIR="\\source\\_static\\_downloads\\rollbackDB_sql"
DATEABASE_ROLLBACK_PLAYNOW_FILENAME=DATABASE_ROLLBACK_DIR+"\\rollbackDB_PlayNow.sql"
DATEABASE_ROLLBACK_PLAYNOWLOG_FILENAME=DATABASE_ROLLBACK_DIR+"\\rollbackDB_PlayNowLog.sql"

#changelog文件中在标签中会填写的关于本次上线申请人的信息
RELEASE_APPLYNAME_TAG= '<申请人>';
RELEASE_APPLYNAME_TAG_END= '</申请人>';
#changelog文件中在标签中会填写的关于本次上线业务背景的信息
RELEASE_BACKAGEGROUND_TAG= '<业务背景>';
RELEASE_BACKAGEGROUND_TAG_END= '</业务背景>';
#changelog文件中在标签中会填写的关于本次上线目的的信息
RELEASE_DESTINATION_TAG= '<目的>';
RELEASE_DESTINATION_TAG_END= '</目的>';
#changelog文件中在标签中会填写的关于本次上线代码版本的信息
RELEASE_VERSION_TAG= '<代码版本>';
RELEASE_VERSION_TAG_END = '</代码版本>';

#在playnow的文档模板中表示整体更新步骤的标签
DEPLOMENT_RSTFILE_UPDATESTEP_TAG  = '<UpdateStep>'
#在playnow的文档模板中表示数据库更新步骤的标签
DEPLOMENT_RSTFILE_DATABASESTEP_TAG = '<DatabaseStep>'
#在playnow的文档模板中表示playnow service更新步骤的标签
DEPLOMENT_RSTFILE_PLAYNOW_SERVICESTEP_TAG= '<PlayNowServiceStep>'
#在playnow的文档模板中表示playnow managerment更新步骤的标签
DEPLOMENT_RSTFILE_PLAYNOW_MANAGERMENTSTEP_TAG= '<PlayNowManagementStep>'
#在playnow的文档模板中表示playnow win service更新步骤的标签
DEPLOMENT_RSTFILE_PLAYNOW_WINSERVICESTEP_TAG= '<PlayNowWinServiceStep>'
#在playnow的文档模板中表示webappstore更新步骤的标签
DEPLOMENT_RSTFILE_PLAYNOW_WEBAPPSTORESTEP_TAG= '<WebAppStoreStep>'
#在playnow的文档模板中表示playnow 整体测试case的标签
DEPLOMENT_RSTFILE_PLAYNOW_TOTALESTCASE_TAG= '<DeploymentTotalTestCase>'
#将来会用playnow的安装包名称替换此标签
DEPLOMENT_RSTFILE_PLAYNOW_INSTALLPACEAGENAME_TAG = '<InstallPackageName>'

#在文档模板中关于playnowservice的web.config文件的改动标签，对应内容在changelog中的
PLAYNOWSERVICE_WEBCONFIG_TAG='<PlayNowServiceWeb.config文件的改动>'
#在文档模板中关于playnowservice的AppSettings.xml文件的改动标签
PLAYNOWSERVICE_APPSETTINGS_TAG='<PlayNowServiceAppSettings.xml文件的改动>'
#在文档模板中关于playnow winservice的web.config文件的改动标签
PLAYNOWWINSERVICE_WEBCONFIG_TAG="<PlayNowService.WinServices.exe.config文件的改动>"
#在文档模板中关于webappstore的web.config文件的改动标签
WEBAPPSTORE_WEBCONFIG_TAG='<WebAppStoreWeb.config文件的改动>'
#在文档模板中关于playnowmanager的web.config文件的改动标签
PLAYNOWMANAGERMENT_WEBCONFIG_TAG='<PlayNowManagermentWeb.config文件的改动>' 

#changelog文件中表示本次上线有哪些应用更新
CHANGELOG_UPDATEAPPLICATION_TAG='<UpdateApplication>'
CHANGELOG_UPDATEAPPLICATION_TAG_END='</UpdateApplication>'
#changelog文件中表示本次上线数据库的更新记录
CHANGELOG_UPDATESQL_PLAYNOW_TAG='<UpdatePlayNowSQL>'
CHANGELOG_UPDATESQL_PLAYNOW_TAG_END='</UpdatePlayNowSQL>'
CHANGELOG_UPDATESQL_PLAYNOWLOG_TAG='<UpdatePlayNowLogSQL>'
CHANGELOG_UPDATESQL_PLAYNOWLOG_TAG_END='</UpdatePlayNowLogSQL>'
#changelog文件中表示本次上线数据库的回滚记录
CHANGELOG_ROLLBACKSQL_PLAYNOW_TAG='<RollbackPlayNowSQL>'
CHANGELOG_ROLLBACKSQL_PLAYNOW_TAG_END='</RollbackPlayNowSQL>'
CHANGELOG_ROLLBACKSQL_PLAYNOWLOG_TAG='<RollbackPlayNowLogSQL>'
CHANGELOG_ROLLBACKSQL_PLAYNOWLOG_TAG_END='</RollbackPlayNowLogSQL>'
#changelog文件中表示本次上线playnowservice的配置文件有哪些更新
CHANGELOG_PLANNOW_SERVICE_WEBCONFIG_TAG='<PlanNowServiceWebConfig>'
CHANGELOG_PLANNOW_SERVICE_WEBCONFIG_TAG_END='</PlanNowServiceWebConfig>'
#changelog文件中表示本次上线playnowservice的配置文件有哪些更新
CHANGELOG_PLANNOW_SERVICE_APPSETTING_TAG='<PlanNowServiceAppSetting>'
CHANGELOG_PLANNOW_SERVICE_APPSETTING_TAG_END='</PlanNowServiceAppSetting>'
#changelog文件中表示本次上线playnow winservice的配置文件有哪些更新
CHANGELOG_PLANNOW_WINSERVICE_CONFIG_TAG='<PlayNowWinServiceConfig>'
CHANGELOG_PLANNOW_WINSERVICE_CONFIG_TAG_END='</PlayNowWinServiceConfig>'
#changelog文件中表示本次上线playnowmanager的配置文件有哪些更新
CHANGELOG_PLANNOW_MANAGERMENT_WEBCONFIG_TAG ='<PlayNowManagermentWebConfig>'
CHANGELOG_PLANNOW_MANAGERMENT_WEBCONFIG_TAG_END='</PlayNowManagermentWebConfig>'
#changelog文件中表示本次上线webappstore的配置文件有哪些更新
CHANGELOG_WEBAPPSTORE_WEBCONFIG_TAG='<WebAppStoreWebConfig>' 
CHANGELOG_WEBAPPSTORE_WEBCONFIG_TAG_END='</WebAppStoreWebConfig>'  
#changelog文件中表示本次上线测试case列表
CHANGELOG_CURRENT_TESTCASE_TAG='<CurrentTestCase>'
CHANGELOG_CURRENT_TESTCASE_TAG_END='</CurrentTestCase>' 
#changelog文件中表示本次上线bugfix列表
CHANGELOG_BUGFIX_TAG='<BugFix>'
CHANGELOG_BUGFIX_TAG_END='</BugFix>'
#changelog文件中表示本次上线新添加的feature列表
CHANGELOG_FEATURE_TAG='<Feature>'
CHANGELOG_FEATURE_TAG_END='</Feature>'
#changelog文件中表示本次上线部署计划列表
CHANGELOG_DEPLOYMENT_PLAN_TAG='<DeploymentPlan>'
CHANGELOG_DEPLOYMENT_PLAN_TAG_END='</DeploymentPlan>'

#存放步骤步骤的字典， 主要是根据changelog内容来调整此字典整体部署步骤
DEPLOYMENT_STEPS = {'1DataBase'   : '#. 更新数据库sss\n',
             '2PlayNowService'     : '#. 更新playnow service\n',
             '3PlayNowManager' : '#. 更新playnow management\n',	
			 '4WebAppStore' : '#. 更新webAppStore \n',
             '5PlayNowWinService'   : '#. 更新window service\n'
     }
#此字典存放tag主要对应每一步的详细信息，根据deploysteps内容调整此字典
DEPLOYMENT_STEPS_TAG_MAPPING = {'1DataBase'   : DEPLOMENT_RSTFILE_DATABASESTEP_TAG,
             '2PlayNowService'     : DEPLOMENT_RSTFILE_PLAYNOW_SERVICESTEP_TAG,
             '3PlayNowManager' : DEPLOMENT_RSTFILE_PLAYNOW_MANAGERMENTSTEP_TAG,
             '4WebAppStore'   : DEPLOMENT_RSTFILE_PLAYNOW_WINSERVICESTEP_TAG,
			 '5PlayNowWinService' : DEPLOMENT_RSTFILE_PLAYNOW_WEBAPPSTORESTEP_TAG
     }