-- Copy data from remote database using dblink extenstion
-- Need to enable dblink extenstion

INSERT
	INTO
		destination_table SELECT
			*
		FROM
			dblink(
				'dbname=postgres hostaddr=IP.Add.res.ses dbname=database_name user=user_name password=PASSWORD',
				'select column1, column2, column3, column4, column5 from soruce_table where period=''2018-06-30'''
			) AS t1(
				column1 DATE,
				column2 TEXT,
				column3 INTEGER,
				column4 DECIMAL,
				column5 BIGINT
			);

