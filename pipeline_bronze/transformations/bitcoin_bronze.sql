CREATE OR REFRESH STREAMING LIVE TABLE bitcoin
TBLPROPERTIES ("quality" = "bronze")
AS
-- Lê os arquivos JSON da pasta RAM usando cloud_files (Auto Loader)
SELECT *
FROM cloud_files ('/Volumes/lakehouse/raw_public/coinbase/coinbase/bitcoin_spot/',
-- Caminho de origem
'JSON',
  map(
    'cloudFiles.includeExistingFiles', 'false',
    'cloudFiles.inferColumnTypes', 'true',
    'cloudFiles.schemaEvolutionMode', 'addNewColumns'


  )

);