/***** ��PN_Module����Ӽ�¼����Ȩ�޹��� by Hu Jingzhi *****/

USE [PlayNow]
GO

DELETE FROM [dbo].[PN_Module] WHERE [ModulePath] = 'App/AppComment.aspx'

/***** ��PN_AppComment�������MachineType by Hu Jingzhi *****/

ALTER TABLE [dbo].[PN_AppComment] DROP CONSTRAINT [FK_AppComment_MachineType]
GO

ALTER TABLE [dbo].[PN_AppComment] DROP COLUMN MachineType
GO

/***** ��ʼ����PN_SearchKeyWordsMachine by Wei Devin *****/
USE [PlayNow]
GO

delete from PN_SearchKeyWordsMachine

/***** �½���PN_SearchKeyWordsMachine by Wei Devin *****/
USE [PlayNow]
GO

drop table PN_SearchKeyWordsMachine
