create VIEW gold.final as 
    SELECT *
    FROM
    OPENROWSET(
        BULK 'https://mardandatalake.dfs.core.windows.net/olistdatastorage/silver/',
        format ='PARQUET'
         ) as result1



create view gold.final2 AS
select *
FROM
OPENROWSET(
        BULK 'https://mardandatalake.dfs.core.windows.net/olistdatastorage/silver/',
        format ='PARQUET'
         ) as result2
         where order_status='delivered'