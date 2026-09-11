{
    "type": "MySQLNotebook",
    "version": "1.0",
    "caption": "DB Notebook 3",
    "content": "USE recruitment_dw;\n\n-- =========================================================\n-- R1: Tendencias de Contratación por Año\n-- =========================================================\nSELECT \n    t.Year AS Ano,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Tiempo t ON f.SK_Tiempo = t.SK_Tiempo\nGROUP BY t.Year\nORDER BY t.Year;\n\n-- =========================================================\n-- R2: Top 10 Tecnologías con Mayor Volumen de Contratados\n-- =========================================================\nSELECT \n    tech.Technology_Name AS Tecnologia,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Tecnologia tech ON f.SK_Tecnologia = tech.SK_Tecnologia\nGROUP BY tech.Technology_Name\nORDER BY Total_Contratados DESC\nLIMIT 10;\n\n-- =========================================================\n-- R3: Perfil del Candidato por Seniority y Experiencia\n-- =========================================================\nSELECT \n    n.Seniority_Name AS Seniority,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(c.YOE), 1) AS Promedio_YOE,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Nivel n ON f.SK_Nivel = n.SK_Nivel\nJOIN Dim_Candidato c ON f.SK_Candidato = c.SK_Candidato\nGROUP BY n.Seniority_Name\nORDER BY Total_Contratados DESC;\n\n-- =========================================================\n-- R4: Top 10 Países por Contrataciones Efectivas\n-- =========================================================\nSELECT \n    u.Country_Name AS Pais,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Ubicacion u ON f.SK_Ubicacion = u.SK_Ubicacion\nGROUP BY u.Country_Name\nORDER BY Total_Contratados DESC\nLIMIT 10;\n\n-- =========================================================\n-- R5: Eficiencia de Evaluación Técnica (Cuellos de Botella)\n-- =========================================================\nSELECT \n    CASE \n        WHEN f.Code_Challenge_Score >= 7 AND f.Technical_Interview_Score >= 7 THEN 'Aprobo Ambos (HIRED)'\n        WHEN f.Code_Challenge_Score < 7 AND f.Technical_Interview_Score >= 7 THEN 'Reprobo Solo Codigo'\n        WHEN f.Code_Challenge_Score >= 7 AND f.Technical_Interview_Score < 7 THEN 'Reprobo Solo Entrevista'\n        ELSE 'Reprobo Ambos'\n    END AS Categoria_Evaluacion,\n    COUNT(*) AS Total_Candidatos,\n    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Fact_Contrataciones), 2) AS Porcentaje\nFROM Fact_Contrataciones f\nGROUP BY Categoria_Evaluacion\nORDER BY Total_Candidatos DESC;\n",
    "options": {
        "tabSize": 4,
        "indentSize": 4,
        "insertSpaces": true,
        "defaultEOL": "LF",
        "trimAutoWhitespace": true
    },
    "viewState": {
        "cursorState": [
            {
                "inSelectionMode": true,
                "selectionStart": {
                    "lineNumber": 73,
                    "column": 32
                },
                "position": {
                    "lineNumber": 70,
                    "column": 63
                }
            }
        ],
        "viewState": {
            "scrollLeft": 0,
            "firstPosition": {
                "lineNumber": 47,
                "column": 1
            },
            "firstPositionDeltaTop": -7
        },
        "contributionsState": {
            "editor.contrib.folding": {},
            "editor.contrib.wordHighlighter": false
        }
    },
    "contexts": [
        {
            "state": {
                "start": 1,
                "end": 73,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "c7c98fbc-6fca-4650-e325-05683c1a4f4d",
                        "225320c2-04ac-468d-dc02-c1bed998c089",
                        "5ae0b1f3-0f96-4368-9897-5752cbb4efd6",
                        "239c4609-d9c0-4514-a17c-62fbbedd2c79",
                        "3e683d38-d260-474e-bbcf-be53cfcf47de",
                        "a07cc5fd-3fc1-439d-f204-183b77a7b413"
                    ]
                },
                "currentHeight": 173,
                "currentSet": 5,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 19
                        },
                        "contentStart": 0,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 19,
                            "length": 439
                        },
                        "contentStart": 185,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 458,
                            "length": 534
                        },
                        "contentStart": 641,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 992,
                            "length": 590
                        },
                        "contentStart": 1172,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1582,
                            "length": 498
                        },
                        "contentStart": 1756,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2080,
                            "length": 795
                        },
                        "contentStart": 2265,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2875,
                            "length": 0
                        },
                        "contentStart": 2874,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "27de5eac-2cd0-4579-9a26-761e3d0e8d47",
                    "resultId": "c7c98fbc-6fca-4650-e325-05683c1a4f4d",
                    "rows": [
                        {
                            "0": 2018,
                            "1": 11061,
                            "2": "1409",
                            "3": "12.74"
                        },
                        {
                            "0": 2019,
                            "1": 11009,
                            "2": "1524",
                            "3": "13.84"
                        },
                        {
                            "0": 2020,
                            "1": 11237,
                            "2": "1485",
                            "3": "13.22"
                        },
                        {
                            "0": 2021,
                            "1": 11051,
                            "2": "1485",
                            "3": "13.44"
                        },
                        {
                            "0": 2022,
                            "1": 5642,
                            "2": "795",
                            "3": "14.09"
                        }
                    ],
                    "columns": [
                        {
                            "title": "Ano",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Postulaciones",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Contratados",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Tasa_Contratacion_Pct",
                            "field": "3",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 73.206ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 1,
                    "sql": "\n\n-- =========================================================\n-- R1: Tendencias de Contratación por Año\n-- =========================================================\nSELECT \n    t.Year AS Ano,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Tiempo t ON f.SK_Tiempo = t.SK_Tiempo\nGROUP BY t.Year\nORDER BY t.Year",
                    "updatable": false,
                    "fullTableName": ""
                },
                {
                    "tabId": "27de5eac-2cd0-4579-9a26-761e3d0e8d47",
                    "resultId": "225320c2-04ac-468d-dc02-c1bed998c089",
                    "rows": [
                        {
                            "0": "Game Development",
                            "1": 3818,
                            "2": "519",
                            "3": "13.59"
                        },
                        {
                            "0": "DevOps",
                            "1": 3808,
                            "2": "495",
                            "3": "13.00"
                        },
                        {
                            "0": "System Administration",
                            "1": 2014,
                            "2": "293",
                            "3": "14.55"
                        },
                        {
                            "0": "Development - CMS Backend",
                            "1": 1882,
                            "2": "284",
                            "3": "15.09"
                        },
                        {
                            "0": "Adobe Experience Manager",
                            "1": 1954,
                            "2": "282",
                            "3": "14.43"
                        },
                        {
                            "0": "Database Administration",
                            "1": 1933,
                            "2": "282",
                            "3": "14.59"
                        },
                        {
                            "0": "Client Success",
                            "1": 1927,
                            "2": "271",
                            "3": "14.06"
                        },
                        {
                            "0": "Security",
                            "1": 1936,
                            "2": "266",
                            "3": "13.74"
                        },
                        {
                            "0": "Development - Frontend",
                            "1": 1887,
                            "2": "266",
                            "3": "14.10"
                        },
                        {
                            "0": "Mulesoft",
                            "1": 1973,
                            "2": "260",
                            "3": "13.18"
                        }
                    ],
                    "columns": [
                        {
                            "title": "Tecnologia",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Postulaciones",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Contratados",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Tasa_Contratacion_Pct",
                            "field": "3",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 138.881ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 2,
                    "sql": "\n\n-- =========================================================\n-- R2: Top 10 Tecnologías con Mayor Volumen de Contratados\n-- =========================================================\nSELECT \n    tech.Technology_Name AS Tecnologia,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Tecnologia tech ON f.SK_Tecnologia = tech.SK_Tecnologia\nGROUP BY tech.Technology_Name\nORDER BY Total_Contratados DESC\nLIMIT 10",
                    "updatable": false,
                    "fullTableName": ""
                },
                {
                    "tabId": "27de5eac-2cd0-4579-9a26-761e3d0e8d47",
                    "resultId": "5ae0b1f3-0f96-4368-9897-5752cbb4efd6",
                    "rows": [
                        {
                            "0": "Intern",
                            "1": 7255,
                            "2": "985",
                            "3": "15.4",
                            "4": "13.58"
                        },
                        {
                            "0": "Junior",
                            "1": 7100,
                            "2": "977",
                            "3": "15.3",
                            "4": "13.76"
                        },
                        {
                            "0": "Trainee",
                            "1": 7183,
                            "2": "973",
                            "3": "15.2",
                            "4": "13.55"
                        },
                        {
                            "0": "Architect",
                            "1": 7079,
                            "2": "971",
                            "3": "15.3",
                            "4": "13.72"
                        },
                        {
                            "0": "Senior",
                            "1": 7059,
                            "2": "939",
                            "3": "15.2",
                            "4": "13.30"
                        },
                        {
                            "0": "Lead",
                            "1": 7071,
                            "2": "929",
                            "3": "15.4",
                            "4": "13.14"
                        },
                        {
                            "0": "Mid-Level",
                            "1": 7253,
                            "2": "924",
                            "3": "15.2",
                            "4": "12.74"
                        }
                    ],
                    "columns": [
                        {
                            "title": "Seniority",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Postulaciones",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Contratados",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Promedio_YOE",
                            "field": "3",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Tasa_Contratacion_Pct",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 7 records retrieved in 302.439ms"
                    },
                    "totalRowCount": 7,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 3,
                    "sql": "\n\n-- =========================================================\n-- R3: Perfil del Candidato por Seniority y Experiencia\n-- =========================================================\nSELECT \n    n.Seniority_Name AS Seniority,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(c.YOE), 1) AS Promedio_YOE,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Nivel n ON f.SK_Nivel = n.SK_Nivel\nJOIN Dim_Candidato c ON f.SK_Candidato = c.SK_Candidato\nGROUP BY n.Seniority_Name\nORDER BY Total_Contratados DESC",
                    "updatable": false,
                    "fullTableName": ""
                },
                {
                    "tabId": "27de5eac-2cd0-4579-9a26-761e3d0e8d47",
                    "resultId": "239c4609-d9c0-4514-a17c-62fbbedd2c79",
                    "rows": [
                        {
                            "0": "Northern Mariana Islands",
                            "1": 195,
                            "2": "44",
                            "3": "22.56"
                        },
                        {
                            "0": "Heard Island and McDonald Islands",
                            "1": 205,
                            "2": "41",
                            "3": "20.00"
                        },
                        {
                            "0": "Seychelles",
                            "1": 211,
                            "2": "40",
                            "3": "18.96"
                        },
                        {
                            "0": "Timor-Leste",
                            "1": 226,
                            "2": "40",
                            "3": "17.70"
                        },
                        {
                            "0": "Niger",
                            "1": 231,
                            "2": "40",
                            "3": "17.32"
                        },
                        {
                            "0": "Sri Lanka",
                            "1": 215,
                            "2": "40",
                            "3": "18.60"
                        },
                        {
                            "0": "Kuwait",
                            "1": 205,
                            "2": "38",
                            "3": "18.54"
                        },
                        {
                            "0": "Saint Barthelemy",
                            "1": 220,
                            "2": "38",
                            "3": "17.27"
                        },
                        {
                            "0": "Equatorial Guinea",
                            "1": 218,
                            "2": "38",
                            "3": "17.43"
                        },
                        {
                            "0": "Saint Helena",
                            "1": 228,
                            "2": "37",
                            "3": "16.23"
                        }
                    ],
                    "columns": [
                        {
                            "title": "Pais",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Postulaciones",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Contratados",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Tasa_Contratacion_Pct",
                            "field": "3",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 132.996ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 4,
                    "sql": "\n\n-- =========================================================\n-- R4: Top 10 Países por Contrataciones Efectivas\n-- =========================================================\nSELECT \n    u.Country_Name AS Pais,\n    COUNT(*) AS Total_Postulaciones,\n    SUM(f.Is_Hired) AS Total_Contratados,\n    ROUND(AVG(f.Is_Hired) * 100, 2) AS Tasa_Contratacion_Pct\nFROM Fact_Contrataciones f\nJOIN Dim_Ubicacion u ON f.SK_Ubicacion = u.SK_Ubicacion\nGROUP BY u.Country_Name\nORDER BY Total_Contratados DESC\nLIMIT 10",
                    "updatable": false,
                    "fullTableName": ""
                },
                {
                    "tabId": "27de5eac-2cd0-4579-9a26-761e3d0e8d47",
                    "resultId": "3e683d38-d260-474e-bbcf-be53cfcf47de",
                    "rows": [
                        {
                            "0": "Reprobo Ambos",
                            "1": 20197,
                            "2": "40.39"
                        },
                        {
                            "0": "Reprobo Solo Codigo",
                            "1": 11571,
                            "2": "23.14"
                        },
                        {
                            "0": "Reprobo Solo Entrevista",
                            "1": 11534,
                            "2": "23.07"
                        },
                        {
                            "0": "Aprobo Ambos (HIRED)",
                            "1": 6698,
                            "2": "13.40"
                        }
                    ],
                    "columns": [
                        {
                            "title": "Categoria_Evaluacion",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Total_Candidatos",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Porcentaje",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 4 records retrieved in 49.052ms"
                    },
                    "totalRowCount": 4,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 5,
                    "sql": "\n\n-- =========================================================\n-- R5: Eficiencia de Evaluación Técnica (Cuellos de Botella)\n-- =========================================================\nSELECT \n    CASE \n        WHEN f.Code_Challenge_Score >= 7 AND f.Technical_Interview_Score >= 7 THEN 'Aprobo Ambos (HIRED)'\n        WHEN f.Code_Challenge_Score < 7 AND f.Technical_Interview_Score >= 7 THEN 'Reprobo Solo Codigo'\n        WHEN f.Code_Challenge_Score >= 7 AND f.Technical_Interview_Score < 7 THEN 'Reprobo Solo Entrevista'\n        ELSE 'Reprobo Ambos'\n    END AS Categoria_Evaluacion,\n    COUNT(*) AS Total_Candidatos,\n    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Fact_Contrataciones), 2) AS Porcentaje\nFROM Fact_Contrataciones f\nGROUP BY Categoria_Evaluacion\nORDER BY Total_Candidatos DESC",
                    "updatable": false,
                    "fullTableName": ""
                },
                {
                    "tabId": "27de5eac-2cd0-4579-9a26-761e3d0e8d47",
                    "resultId": "a07cc5fd-3fc1-439d-f204-183b77a7b413",
                    "rows": [],
                    "columns": [
                        {
                            "title": "*",
                            "field": "0",
                            "dataType": {
                                "type": 0
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 0 records retrieved in 2.019ms"
                    },
                    "totalRowCount": 0,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "USE recruitment_dw",
                    "updatable": false
                }
            ]
        },
        {
            "state": {
                "start": 74,
                "end": 74,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 0
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        }
    ]
}