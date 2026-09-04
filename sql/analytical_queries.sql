-- R1: Tendencias Anuales
SELECT t.Year, COUNT(f.SK_Fact) AS Solicitudes, SUM(f.Is_Hired) AS Contratados, ROUND(SUM(f.Is_Hired)*100.0/COUNT(f.SK_Fact), 2) AS Tasa_Pct
FROM Fact_Contrataciones f JOIN Dim_Tiempo t ON f.SK_Tiempo = t.SK_Tiempo GROUP BY t.Year ORDER BY t.Year;

-- R2: Top Tecnologías
SELECT tech.Technology_Name, COUNT(f.SK_Fact) AS Solicitudes, SUM(f.Is_Hired) AS Contratados
FROM Fact_Contrataciones f JOIN Dim_Tecnologia tech ON f.SK_Tecnologia = tech.SK_Tecnologia GROUP BY tech.Technology_Name ORDER BY Contratados DESC LIMIT 5;

-- R3: Seniority
SELECT n.Seniority_Name, COUNT(f.SK_Fact) AS Solicitudes, SUM(f.Is_Hired) AS Contratados
FROM Fact_Contrataciones f JOIN Dim_Nivel n ON f.SK_Nivel = n.SK_Nivel GROUP BY n.Seniority_Name ORDER BY Contratados DESC;

-- R4: Geográfico
SELECT u.Country_Name, COUNT(f.SK_Fact) AS Solicitudes, SUM(f.Is_Hired) AS Contratados
FROM Fact_Contrataciones f JOIN Dim_Ubicacion u ON f.SK_Ubicacion = u.SK_Ubicacion GROUP BY u.Country_Name ORDER BY Solicitudes DESC LIMIT 5;

-- R5: Embudo de Evaluación
SELECT 
    CASE 
        WHEN Code_Challenge_Score >= 7 AND Technical_Interview_Score >= 7 THEN 'Hired'
        WHEN Code_Challenge_Score >= 7 THEN 'Failed Interview'
        WHEN Technical_Interview_Score >= 7 THEN 'Failed Code'
        ELSE 'Failed Both'
    END AS Estado, COUNT(*) AS Total
FROM Fact_Contrataciones GROUP BY Estado;