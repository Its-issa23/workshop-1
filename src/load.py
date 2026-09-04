import sqlite3
import os

def load_to_dw(dimensions_and_fact: dict, db_path: str, sql_schema_path: str):
    os.makedirs(os.path.dirname(db_path), exist_ok=True)
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    with open(sql_schema_path, 'r', encoding='utf-8') as f:
        cursor.executescript(f.read())

    for table_name, df_data in dimensions_and_fact.items():
        df_data.to_sql(table_name, conn, if_exists='append', index=False)
        print(f"[LOAD] Tabla '{table_name}' cargada ({len(df_data)} filas).")

    conn.close()