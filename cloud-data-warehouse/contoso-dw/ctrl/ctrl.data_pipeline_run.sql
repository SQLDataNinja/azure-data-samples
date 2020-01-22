CREATE TABLE [ctrl].[data_pipeline_run]
(
	run_id				INT				NOT NULL	IDENTITY(1,1),	--	run Identifier, this will be generated sequentially.
	process_id			INT				NOT NULL,
	data_pipeline_id	NVARCHAR(50)	NOT NULL,
	execution_order		INT				NULL,
	run_start_dttm		DATETIME		NOT NULL,					--	Start DateTime of the run.
	run_end_dttm		DATETIME		NULL,						--	End DateTime of the run.
	env_cd				NVARCHAR(25)	NOT NULL,					--	Environment of run (dev, test, prod)
	created_dttm		DATETIME		NOT NULL,
	modified_dttm		DATETIME		NULL

)
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    CLUSTERED COLUMNSTORE INDEX
)
GO
