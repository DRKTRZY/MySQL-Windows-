-- Um Query-Logs zu entleeren ohne zu Deaktivieren 
-- TRUNCATE mysql.general_log
  
-- Aktivere die Logs
SET global general_log = 1;

-- Wo die Query-Logs gespeichert werden
SET global log_output = 'table';

-- Output von den Query-Logs
select * from mysql.general_log;
