CREATE TABLE [ctrl].[data_pipeline_process]
(
	process_id					INT				NOT NULL	IDENTITY(1,1),	--	Process Identifier, this will be generated sequentially before the jobs are executed.
	process_name				NVARCHAR(255)	NOT NULL,					--	Name of the process.
	is_active					BIT				NULL,
	is_restartable				BIT				NULL,					
	is_running					BIT				NULL,						--	Indicator current process is running.
	ready_to_process			BIT				NULL,
	last_completed_success_dttm	DATETIME		NULL,						--	DataTime  of the last successful Process run.
	process_start_dttm			DATETIME		NULL,						--	Start DateTime of the process.
	process_end_dttm			DATETIME		NULL,						--	End DateTime of the process.
	process_status_cd			CHAR(1)			NOT NULL,					--	Status code associated with the process. 
	process_status_descr		NVARCHAR(30)	NOT NULL,					--	Status description associated with the process status code.
	process_from_dt				DATE			NULL,						--	Process From Date From recent previous success run. Date from which records should be fetched from source.(1/1/1900 for initial)
	process_to_dt				DATE			NULL,						--	Max Date of source records. Date till which records should be fetched from source.(1/1/1900 for initial)
																			--	Incremented data is retrieved using the above 2 dates
	created_dttm				DATETIME		NOT NULL,
	modified_dttm				DATETIME		NULL
)
WITH
(
    DISTRIBUTION = HASH (process_name),
    CLUSTERED COLUMNSTORE INDEX
)
GO
