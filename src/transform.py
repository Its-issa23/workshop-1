import pandas as pd

def transform_data(df: pd.DataFrame) -> pd.DataFrame:
    df_clean = df.copy()
    
    # Formateo de tipos de datos
    df_clean['Application Date'] = pd.to_datetime(df_clean['Application Date'])
    df_clean['YOE'] = df_clean['YOE'].astype(int)
    df_clean['Code Challenge Score'] = df_clean['Code Challenge Score'].astype(int)
    df_clean['Technical Interview Score'] = df_clean['Technical Interview Score'].astype(int)
    
    # Regla de Negocio: HIRED
    df_clean['Is_Hired'] = (
        (df_clean['Code Challenge Score'] >= 7) & 
        (df_clean['Technical Interview Score'] >= 7)
    ).astype(int)
    
    print("[TRANSFORM] Regla de negocio HIRED aplicada.")
    return df_clean