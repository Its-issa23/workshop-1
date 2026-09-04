import pandas as pd
import os

def extract_data(file_path: str) -> pd.DataFrame:
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"El archivo {file_path} no fue encontrado.")
    
    df = pd.read_csv(file_path, sep=';')
    print(f"[EXTRACT] Se cargaron {len(df)} registros correctamente.")
    return df