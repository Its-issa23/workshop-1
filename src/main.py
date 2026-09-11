import os
from extract import extract_data
from transform import transform_data
from dimensional_model import build_dimensional_model
from load import load_to_dw

def main():
    # Buscar el CSV en 'data/candidates.csv' o en la raíz
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    csv_path_data = os.path.join(base_dir, 'data', 'candidates.csv')
    csv_path_root = os.path.join(base_dir, 'candidates.csv')
    
    raw_csv = csv_path_data if os.path.exists(csv_path_data) else csv_path_root

    print(">>> Iniciando Pipeline ETL...")
    df_raw = extract_data(raw_csv)
    df_clean = transform_data(df_raw)
    dim_models = build_dimensional_model(df_clean)
    
    # Carga los datos directamente en MySQL
    load_to_dw(dim_models)
    print(">>> Pipeline ETL completado con éxito.")

if __name__ == "__main__":
    main()