DROP TABLE IF EXISTS Fact_Contrataciones;
DROP TABLE IF EXISTS Dim_Candidato;
DROP TABLE IF EXISTS Dim_Ubicacion;
DROP TABLE IF EXISTS Dim_Nivel;
DROP TABLE IF EXISTS Dim_Tecnologia;
DROP TABLE IF EXISTS Dim_Tiempo;

CREATE TABLE Dim_Tiempo (
    SK_Tiempo INTEGER PRIMARY KEY,
    Full_Date TEXT UNIQUE,
    Year INTEGER,
    Month INTEGER,
    Quarter INTEGER,
    DayOfWeek TEXT
);

CREATE TABLE Dim_Tecnologia (
    SK_Tecnologia INTEGER PRIMARY KEY,
    Technology_Name TEXT UNIQUE
);

CREATE TABLE Dim_Nivel (
    SK_Nivel INTEGER PRIMARY KEY,
    Seniority_Name TEXT UNIQUE
);

CREATE TABLE Dim_Ubicacion (
    SK_Ubicacion INTEGER PRIMARY KEY,
    Country_Name TEXT UNIQUE
);

CREATE TABLE Dim_Candidato (
    SK_Candidato INTEGER PRIMARY KEY,
    First_Name TEXT,
    Last_Name TEXT,
    Email TEXT,
    YOE INTEGER
);

CREATE TABLE Fact_Contrataciones (
    SK_Fact INTEGER PRIMARY KEY AUTOINCREMENT,
    SK_Candidato INTEGER,
    SK_Tecnologia INTEGER,
    SK_Nivel INTEGER,
    SK_Ubicacion INTEGER,
    SK_Tiempo INTEGER,
    Code_Challenge_Score INTEGER,
    Technical_Interview_Score INTEGER,
    Is_Hired INTEGER,
    FOREIGN KEY (SK_Candidato) REFERENCES Dim_Candidato(SK_Candidato),
    FOREIGN KEY (SK_Tecnologia) REFERENCES Dim_Tecnologia(SK_Tecnologia),
    FOREIGN KEY (SK_Nivel) REFERENCES Dim_Nivel(SK_Nivel),
    FOREIGN KEY (SK_Ubicacion) REFERENCES Dim_Ubicacion(SK_Ubicacion),
    FOREIGN KEY (SK_Tiempo) REFERENCES Dim_Tiempo(SK_Tiempo)
);