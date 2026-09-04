-- ============================================================
-- CONSULTAS ANALÍTICAS (R1 - R5)
-- Base de Datos: database/recruitment_dw.db
-- ============================================================

-- ------------------------------------------------------------
-- R1: Tendencias de Contratación por Año
-- ------------------------------------------------------------
SELECT 
    t.Year,
    COUNT(f.SK_Fact) AS Total_Solicitudes,
    SUM(f.Is_Hired) AS Total_Contratados,
    ROUND(SUM(f.Is_Hired) * 100.0 / COUNT(f.SK_Fact), 2) AS Tasa_Contratacion_Pct
FROM Fact_Contrataciones f
JOIN Dim_Tiempo t ON f.SK_Tiempo = t.SK_Tiempo
GROUP BY t.Year
ORDER BY t.Year;

-- ------------------------------------------------------------
-- R2: Análisis Tecnológico (Top 5 Tecnologías por Contratados)
-- ------------------------------------------------------------
SELECT 
    tech.Technology_Name,
    COUNT(f.SK_Fact) AS Total_Solicitudes,
    SUM(f.Is_Hired) AS Total_Contratados,
    ROUND(SUM(f.Is_Hired) * 100.0 / COUNT(f.SK_Fact), 2) AS Tasa_Exito_Pct
FROM Fact_Contrataciones f
JOIN Dim_Tecnologia tech ON f.SK_Tecnologia = tech.SK_Tecnologia
GROUP BY tech.Technology_Name
ORDER BY Total_Contratados DESC
LIMIT 5;

-- ------------------------------------------------------------
-- R3: Perfil del Candidato por Seniority y Experiencia
-- ------------------------------------------------------------
SELECT 
    n.Seniority_Name,
    COUNT(f.SK_Fact) AS Total_Solicitudes,
    SUM(f.Is_Hired) AS Total_Contratados,
    ROUND(AVG(c.YOE), 1) AS Promedio_YOE,
    ROUND(SUM(f.Is_Hired) * 100.0 / COUNT(f.SK_Fact), 2) AS Tasa_Exito_Pct
FROM Fact_Contrataciones f
JOIN Dim_Nivel n ON f.SK_Nivel = n.SK_Nivel
JOIN Dim_Candidato c ON f.SK_Candidato = c.SK_Candidato
GROUP BY n.Seniority_Name
ORDER BY Total_Contratados DESC;

-- ------------------------------------------------------------
-- R4: Análisis Geográfico de Reclutamiento (Top 5 Países)
-- ------------------------------------------------------------
SELECT 
    u.Country_Name,
    COUNT(f.SK_Fact) AS Total_Solicitudes,
    SUM(f.Is_Hired) AS Total_Contratados,
    ROUND(SUM(f.Is_Hired) * 100.0 / COUNT(f.SK_Fact), 2) AS Tasa_Exito_Pct
FROM Fact_Contrataciones f
JOIN Dim_Ubicacion u ON f.SK_Ubicacion = u.SK_Ubicacion
GROUP BY u.Country_Name
ORDER BY Total_Solicitudes DESC
LIMIT 5;

-- ------------------------------------------------------------
-- R5: Eficiencia de Evaluación Técnica y Cuellos de Botella
-- ------------------------------------------------------------
SELECT 
    CASE 
        WHEN Code_Challenge_Score >= 7 AND Technical_Interview_Score >= 7 THEN '1. Ambas Aprobadas (HIRED)'
        WHEN Code_Challenge_Score >= 7 AND Technical_Interview_Score < 7 THEN '2. Solo Code Challenge Aprobado'
        WHEN Code_Challenge_Score < 7 AND Technical_Interview_Score >= 7 THEN '3. Solo Entrevista Aprobada'
        ELSE '4. Ambas Reprobadas'
    END AS Categoria_Evaluacion,
    COUNT(*) AS Candidatos,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Fact_Contrataciones), 2) AS Porcentaje
FROM Fact_Contrataciones
GROUP BY Categoria_Evaluacion
ORDER BY Candidatos DESC;