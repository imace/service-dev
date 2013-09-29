/***** 新建表PN_SearchKeyWordsMachine by Wei Devin *****/
USE [PlayNow]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PN_SearchKeyWordsMachine](
 [Id] [int] IDENTITY(1,1) NOT NULL,
 [KeyWordId] [int] NOT NULL,
 [MachineId] [int] NOT NULL,
 CONSTRAINT [PK_PN_SearchKeyWordsMachine] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'搜索关键字ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PN_SearchKeyWordsMachine', @level2type=N'COLUMN',@level2name=N'KeyWordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PN_SearchKeyWordsMachine', @level2type=N'COLUMN',@level2name=N'MachineId'
GO

ALTER TABLE [dbo].[PN_SearchKeyWordsMachine]  WITH NOCHECK ADD  CONSTRAINT [FK_SEARCHKEYWORDSMACHINE_KEYWORDID] FOREIGN KEY([KeyWordId])
REFERENCES [dbo].[PN_SearchKeyWords] ([Id]) on delete cascade
GO

ALTER TABLE [dbo].[PN_SearchKeyWordsMachine] CHECK CONSTRAINT [FK_SEARCHKEYWORDSMACHINE_KEYWORDID]
GO

ALTER TABLE [dbo].[PN_SearchKeyWordsMachine]  WITH CHECK ADD  CONSTRAINT [FK_SEARCHKEYWORDSMACHINE_MACHINEID] FOREIGN KEY([MachineId])
REFERENCES [dbo].[PN_Machine] ([Id]) on delete cascade
GO

ALTER TABLE [dbo].[PN_SearchKeyWordsMachine] CHECK CONSTRAINT [FK_SEARCHKEYWORDSMACHINE_MACHINEID]
GO

/***** 初始化表PN_SearchKeyWordsMachine by Wei Devin *****/
USE [PlayNow]
GO

INSERT INTO [PlayNow].[dbo].[PN_SearchKeyWordsMachine]
           ([KeyWordId]
           ,[MachineId])
SELECT skw.Id,m.Id  from PN_SearchKeyWords skw,PN_Machine m
GO

/***** 表PN_AppComment中添加列MachineType by Hu Jingzhi *****/

ALTER TABLE [dbo].[PN_AppComment]
ADD MachineType int
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PN_AppComment', @level2type=N'COLUMN',@level2name=N'MachineType'
GO

ALTER TABLE [dbo].[PN_AppComment]  WITH NOCHECK ADD  CONSTRAINT [FK_AppComment_MachineType] FOREIGN KEY([MachineType])
REFERENCES [dbo].[PN_Machine] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PN_AppComment] CHECK CONSTRAINT [FK_AppComment_MachineType]
GO

/***** 表PN_Module中添加记录用于权限管理 by Hu Jingzhi *****/

INSERT INTO [dbo].[PN_Module] ([MenuId], [ModuleName], [ModulePath]) VALUES (1, N'应用评论管理', N'App/AppComment.aspx')
