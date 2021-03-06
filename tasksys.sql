Create database tasksysmangent

CREATE TABLE [dbo].[emp_task](
	[id] [int] NOT NULL,
	[emp_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[date_assign_task] [datetime] NOT NULL)

CREATE TABLE [dbo].[employees_tbl](
	[emp_id] [int] NOT NULL,
	[Emp_name] [varchar](100) NOT NULL,
	[emp_phone] [varchar](50) NOT NULL,
	[emp_address] [varchar](50) NOT NULL,
	[emp_card] [image] NULL,
	[emp_email] [varchar](50) NOT NULL,
	[emp_country] [char](50) NOT NULL,
	[emp_qualificaton] [char](50) NOT NULL,
	[emp_join_date] [datetime] NOT NULL
	)

CREATE TABLE [dbo].[exprince_tbl](
	[exprince_id] [int] NOT NULL,
	[exprince_title] [nchar](10) NOT NULL,
	[exprince_desc] [nchar](10) NOT NULL,
	[Emp_id] [int] NOT NULL,
	[exprince_period] [nchar](10) NOT NULL)

CREATE TABLE [dbo].[jobs_table](
	[jobid] [int] NOT NULL,
	[job_name] [nvarchar](50) NOT NULL,
	[job_description] [nvarchar](50) NULL,
	[empl_id] [int] NOT NULL)

CREATE TABLE [dbo].[taskrecord](
	[id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[task_work_start_time] [time](7) NOT NULL,
	[task_work_end_time] [time](7) NOT NULL,
	[total_hours] [time](7) NOT NULL,
	[emp_id] [int] NOT NULL)

CREATE TABLE [dbo].[tasktbl](
	[task_id] [int] NOT NULL,
	[task_name] [nvarchar](50) NOT NULL,
	[task_descriptuon] [nvarchar](50) NULL,
	[task_start_date] [datetime] NOT NULL,
	[task_end_date] [datetime] NOT NULL,
	[task_status] [bit] NOT NULL)

CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[user_password] [varchar](50) NULL,
	[user_status] [varchar](50) NULL)
/****** Object:  Table [dbo].[workrecordtbl]    Script Date: 10/02/2022 08:19:02 م ******/

CREATE TABLE [dbo].[workrecordtbl](
	[id] [int] NOT NULL,
	[empl_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[time_work_start] [time](7) NOT NULL,
	[time_work_end] [time](7) NOT NULL,
	[total_hours] [time](7) NOT NULL,
	[losed_time] [time](7) NOT NULL,
	[note] [nvarchar](50) NULL)

INSERT [dbo].[emp_task] ([id], [emp_id], [task_id], [date_assign_task]) VALUES (1, 1, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[taskrecord] ([id], [task_id], [task_work_start_time], [task_work_end_time], [total_hours], [emp_id]) VALUES (1, 1, CAST(N'06:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'04:00:00' AS Time), 1)
INSERT [dbo].[tasktbl] ([task_id], [task_name], [task_descriptuon], [task_start_date], [task_end_date], [task_status]) VALUES (1, N'login app', N'make app log in', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1)


INSERT [dbo].[Users] ([user_id], [user_name], [user_password], [user_status]) VALUES (1, N'samiah', N'sam1995', N'1')

ALTER TABLE [dbo].[emp_task]  WITH CHECK ADD  CONSTRAINT [FK_emp_task_tasktbl] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasktbl] ([task_id])
GO
ALTER TABLE [dbo].[emp_task] CHECK CONSTRAINT [FK_emp_task_tasktbl]
GO
ALTER TABLE [dbo].[employees_tbl]  WITH CHECK ADD  CONSTRAINT [FK_employees_tbl_emp_task] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_task] ([id])
GO
ALTER TABLE [dbo].[employees_tbl] CHECK CONSTRAINT [FK_employees_tbl_emp_task]
GO
ALTER TABLE [dbo].[exprince_tbl]  WITH CHECK ADD  CONSTRAINT [FK_exprince_tbl_employees_tbl] FOREIGN KEY([Emp_id])
REFERENCES [dbo].[employees_tbl] ([emp_id])
GO
ALTER TABLE [dbo].[exprince_tbl] CHECK CONSTRAINT [FK_exprince_tbl_employees_tbl]
GO
ALTER TABLE [dbo].[jobs_table]  WITH CHECK ADD  CONSTRAINT [FK_jobs_table_employees_tbl] FOREIGN KEY([empl_id])
REFERENCES [dbo].[employees_tbl] ([emp_id])
GO
ALTER TABLE [dbo].[jobs_table] CHECK CONSTRAINT [FK_jobs_table_employees_tbl]
GO
ALTER TABLE [dbo].[taskrecord]  WITH CHECK ADD  CONSTRAINT [FK_taskrecord_tasktbl] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasktbl] ([task_id])
GO
ALTER TABLE [dbo].[taskrecord] CHECK CONSTRAINT [FK_taskrecord_tasktbl]
GO
ALTER TABLE [dbo].[workrecordtbl]  WITH CHECK ADD  CONSTRAINT [FK_workrecordtbl_employees_tbl] FOREIGN KEY([empl_id])
REFERENCES [dbo].[employees_tbl] ([emp_id])
GO
ALTER TABLE [dbo].[workrecordtbl] CHECK CONSTRAINT [FK_workrecordtbl_employees_tbl]
GO
