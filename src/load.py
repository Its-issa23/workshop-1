from sqlalchemy import create_engine, text

def load_to_dw(dim_models, db_user="root", db_password="123456789", db_host="localhost", db_port="3306", db_name="recruitment_dw"):
    # 1. Conectar al servidor MySQL para crear la base de datos si no existe
    server_url = f"mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/"
    engine_server = create_engine(server_url)
    
    with engine_server.connect() as conn:
        conn.execute(text(f"CREATE DATABASE IF NOT EXISTS {db_name};"))
        conn.commit()

    # 2. Conectar directamente a la base de datos del Data Warehouse
    db_url = f"mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
    engine_db = create_engine(db_url)

    print(f"-> Conectando a la base de datos MySQL '{db_name}'...")
    
    # 3. Carga de las tablas dimensionales y de hechos
    for table_name, df in dim_models.items():
        df.to_sql(table_name, engine_db, if_exists='replace', index=False)
        print(f"   [+] Tabla '{table_name}' cargada ({len(df)} registros).")

    print("-> Carga a MySQL completada con éxito.")