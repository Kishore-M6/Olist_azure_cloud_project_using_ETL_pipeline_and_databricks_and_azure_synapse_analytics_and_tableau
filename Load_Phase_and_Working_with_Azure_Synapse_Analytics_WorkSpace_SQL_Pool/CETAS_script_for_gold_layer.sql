CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Kishore72649502';

CREATE DATABASE SCOPED CREDENTIAL kishoreadmin WITH IDENTITY = 'Managed Identity';


--  query to view list of database credentials
SELECT * FROM sys.database_credentials


--  creating CETAS table for order_status="delivered" olist_ecommerce  data

CREATE EXTERNAL FILE FORMAT delta_externalfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE gold_layer_datasource WITH (
    LOCATION = 'https://olistecommerceadls.dfs.core.windows.net/olistecommercecontainer/Gold/',
    CREDENTIAL = kishoreadmin
);

CREATE EXTERNAL TABLE gold.final_olist_business_data_table WITH (
        LOCATION = 'order_status_data_serving',
        DATA_SOURCE = gold_layer_datasource,
        FILE_FORMAT = delta_externalfileformat
) AS
SELECT * FROM gold.final_orderstatus;



-- Drop when we raise errors
-- Drop an external file format  
DROP EXTERNAL FILE FORMAT delta_externalfileformat;
-- Drop an external data source  
DROP EXTERNAL DATA SOURCE gold_layer_datasource;
-- Drop an external table
DROP EXTERNAL TABLE gold.final_olist_bussiness_data_table;