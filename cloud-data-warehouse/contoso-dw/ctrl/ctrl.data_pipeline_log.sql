CREATE TABLE [ctrl].[data_pipeline_log]
(
	log_id						INT				NOT NULL	IDENTITY(1,1),
	process_id					INT				NOT NULL,
	run_id						INT				NOT NULL,
	source_type					NVARCHAR(50)	NOT NULL,
	target_type					NVARCHAR(50)	NOT NULL,
	source_name					NVARCHAR(255)	NULL,
	target_name					NVARCHAR(255)	NULL,
	source_row_cnt				BIGINT			NULL,
	target_initial_row_cnt		BIGINT			NULL,
	target_final_row_cnt		BIGINT			NULL,
	insert_target_row_cnt		BIGINT			NULL,
	update_targtt_row_cnt		BIGINT			NULL,
	error_row_cnt				BIGINT			NULL,
	final_tgt_row_cnt			BIGINT			NULL,
	table_max_key				BIGINT			NULL,
	addtl_info_msg				NVARCHAR(4000)	NULL,
	error_code					NVARCHAR(150)	NULL,
	error_msg					NVARCHAR(4000)	NULL,
	error_descr					NVARCHAR(4000)	NULL,						--	The description of the error if the process is failed.
	is_successful				BIT				NULL,
	created_dttm				DATETIME		NOT NULL,
	modified_dttm				DATETIME		NULL
)
WITH
(
    DISTRIBUTION = HASH (process_id),
    CLUSTERED COLUMNSTORE INDEX
)
GO
