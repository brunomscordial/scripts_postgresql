-- https://www.postgresql.org/docs/9.4/catalog-pg-class.html -- 
SELECT 
   'S02'             AS servidor
  ,b.nspname         as schemaname
  ,a.relname         as nome_tabela
  ,a.reltuples       as linhas 
  ,a.relpages        as tamanho
FROM pg_catalog.pg_class a
LEFT JOIN pg_catalog.pg_namespace b 
ON (b.oid = a.relnamespace)
WHERE b.nspname NOT IN ('pg_catalog', 'information_schema','pg_toast','pg_temp_1','pg_toast_temp_1')  
AND a.relkind NOT IN ('i','S','v','m','c','f')
ORDER BY b.nspname asc 
,a.reltuples;