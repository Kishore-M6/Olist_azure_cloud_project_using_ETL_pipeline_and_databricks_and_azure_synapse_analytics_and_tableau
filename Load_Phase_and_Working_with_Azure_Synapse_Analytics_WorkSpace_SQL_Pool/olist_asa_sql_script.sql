-- This is auto-generated code
-- reading sample csv file customers_1mb  to generate sql query
-- SELECT
--     TOP 100 *
-- FROM
--     OPENROWSET(
--         BULK 'https://olistsynapseanalytics.dfs.core.windows.net/olistsynapseanalyticscontainers/customers_1MB.csv',
--         FORMAT = 'CSV',
--         PARSER_VERSION = '2.0'
--     ) AS [result]


SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://olistecommerceadls.dfs.core.windows.net/olistecommercecontainer/Silver/joined_data/',
        FORMAT = 'DELTA'
    ) AS RESULT1

    -- https://olistecommerceadls.blob.core.windows.net/olistecommercecontainer/Silver/joined_data/part-00000-6518e342-fbe2-4600-b8ca-b92fdd8ecf42.c000.snappy.parquet
    -- using blob url

SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://olistecommerceadls.blob.core.windows.net/olistecommercecontainer/Silver/joined_data/',
        FORMAT = 'DELTA'
    ) AS RESULT2


CREATE SCHEMA gold


create VIEW  gold.final
as 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://olistecommerceadls.dfs.core.windows.net/olistecommercecontainer/Silver/joined_data/',
        FORMAT = 'DELTA'
    ) AS RESULT3


SELECT * FROM gold.final

-- query to create view which filters data based on order_status='delivered'

create VIEW  gold.final_orderstatus
as 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://olistecommerceadls.dfs.core.windows.net/olistecommercecontainer/Silver/joined_data/',
        FORMAT = 'DELTA'
    ) AS RESULT4
    where order_status='delivered'


select * from gold.final_orderstatus


