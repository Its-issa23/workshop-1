import pandas as pd

def build_dimensional_model(df: pd.DataFrame):
    # Dimensión Tiempo
    dim_tiempo = pd.DataFrame({'Full_Date': df['Application Date'].unique()}).sort_values('Full_Date').reset_index(drop=True)
    dim_tiempo['SK_Tiempo'] = dim_tiempo.index + 1
    dim_tiempo['Year'] = dim_tiempo['Full_Date'].dt.year
    dim_tiempo['Month'] = dim_tiempo['Full_Date'].dt.month
    dim_tiempo['Quarter'] = dim_tiempo['Full_Date'].dt.quarter
    dim_tiempo['DayOfWeek'] = dim_tiempo['Full_Date'].dt.day_name()

    # Dimensión Tecnología
    dim_tecnologia = pd.DataFrame({'Technology_Name': sorted(df['Technology'].unique())})
    dim_tecnologia['SK_Tecnologia'] = dim_tecnologia.index + 1

    # Dimensión Nivel
    dim_nivel = pd.DataFrame({'Seniority_Name': sorted(df['Seniority'].unique())})
    dim_nivel['SK_Nivel'] = dim_nivel.index + 1

    # Dimensión Ubicación
    dim_ubicacion = pd.DataFrame({'Country_Name': sorted(df['Country'].unique())})
    dim_ubicacion['SK_Ubicacion'] = dim_ubicacion.index + 1

    # Dimensión Candidato
    dim_candidato = df[['First Name', 'Last Name', 'Email', 'YOE']].copy().reset_index(drop=True)
    dim_candidato['SK_Candidato'] = dim_candidato.index + 1
    dim_candidato.rename(columns={'First Name': 'First_Name', 'Last Name': 'Last_Name'}, inplace=True)

    # Mapeo a Tabla de Hechos
    df_fact = df.copy()
    df_fact['SK_Candidato'] = df_fact.index + 1
    df_fact = df_fact.merge(dim_tecnologia, left_on='Technology', right_on='Technology_Name')
    df_fact = df_fact.merge(dim_nivel, left_on='Seniority', right_on='Seniority_Name')
    df_fact = df_fact.merge(dim_ubicacion, left_on='Country', right_on='Country_Name')
    df_fact = df_fact.merge(dim_tiempo[['Full_Date', 'SK_Tiempo']], left_on='Application Date', right_on='Full_Date')

    fact_contrataciones = df_fact[[
        'SK_Candidato', 'SK_Tecnologia', 'SK_Nivel', 'SK_Ubicacion', 'SK_Tiempo',
        'Code Challenge Score', 'Technical Interview Score', 'Is_Hired'
    ]].copy()
    
    fact_contrataciones.rename(columns={
        'Code Challenge Score': 'Code_Challenge_Score',
        'Technical Interview Score': 'Technical_Interview_Score'
    }, inplace=True)

    print("[MODEL] Modelo en estrella construido exitosamente.")
    return {
        'Dim_Tiempo': dim_tiempo,
        'Dim_Tecnologia': dim_tecnologia,
        'Dim_Nivel': dim_nivel,
        'Dim_Ubicacion': dim_ubicacion,
        'Dim_Candidato': dim_candidato,
        'Fact_Contrataciones': fact_contrataciones
    }
