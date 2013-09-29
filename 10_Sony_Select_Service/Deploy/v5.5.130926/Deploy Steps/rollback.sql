/***** 表PN_Module中添加记录用于权限管理 by Hu Jingzhi *****/

USE [PlayNow]
GO

DELETE FROM [dbo].[PN_Module] WHERE [ModulePath] = 'App/AppComment.aspx'

/***** 表PN_AppComment中添加列MachineType by Hu Jingzhi *****/

ALTER TABLE [dbo].[PN_AppComment] DROP CONSTRAINT [FK_AppComment_MachineType]
GO

ALTER TABLE [dbo].[PN_AppComment] DROP COLUMN MachineType
GO

/***** 初始化表PN_SearchKeyWordsMachine by Wei Devin *****/
USE [PlayNow]
GO

delete from PN_SearchKeyWordsMachine

/***** 新建表PN_SearchKeyWordsMachine by Wei Devin *****/
USE [PlayNow]
GO

drop table PN_SearchKeyWordsMachine
