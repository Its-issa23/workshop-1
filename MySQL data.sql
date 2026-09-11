-- Seleccionar la base de datos
USE recruitment_dw;

-- Listar todas las tablas cargadas por el ETL
SHOW TABLES;

-- Consultar los primeros 10 registros de la tabla de hechos
SELECT * FROM Fact_Contrataciones LIMIT 10;