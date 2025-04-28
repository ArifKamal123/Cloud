--CREATE MASTER KEY ENCRYPTION BY PASSWORD = '';
--CREATE DATABASE SCOPED CREDENTIAL 'name' WITH IDENTITY = 'Managed Identity';

 --select * from sys.database_credentials;
 CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE goldlayer WITH (
    LOCATION = 'https://mardandatalake.dfs.core.windows.net/olistdatastorage/Gold/',
    CREDENTIAL = arifkamal
);


CREATE EXTERNAL TABLE gold.finaltable WITH (
        LOCATION = 'Serving',
        DATA_SOURCE = goldlayer,
        FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.final2;

select * from gold.finaltable


SELECT count(*) as Total_Orders_delivered
from gold.finaltable
