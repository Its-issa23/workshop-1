from extract import extract_data
from transform import transform_data
from dimensional_model import build_dimensional_model
from load import load_to_dw

def main():
    RAW_CSV = "data/raw/candidates.csv"
    DB_PATH = "database/recruitment_dw.db"
    SQL_SCHEMA = "sql/create_tables.sql"

    df_raw = extract_data(RAW_CSV)
    df_clean = transform_data(df_raw)
    dim_models = build_dimensional_model(df_clean)
    load_to_dw(dim_models, DB_PATH, SQL_SCHEMA)
    print(" Pipeline ETL completado con éxito.")

if __name__ == "__main__":
    main()