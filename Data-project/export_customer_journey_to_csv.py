from dotenv import load_dotenv
import os
import pandas as pd
import pyodbc

load_dotenv() 

def fetch_data_from_sql():
    
    conn_str = (
    f"Driver={{{os.getenv('DB_DRIVER')}}};"
    f"Server={os.getenv('DB_SERVER')};"
    f"Database={os.getenv('DB_NAME')};"
    f"UID={os.getenv('DB_USER')};"
    f"PWD={os.getenv('DB_PASSWORD')};"
    "TrustServerCertificate=yes;"
    )
    
    conn = pyodbc.connect(conn_str)
    
    
    
    with open("customer_journey.sql", "r") as file:
        query = file.read()

    
    df = pd.read_sql(query, conn)
    print("✅ Connected successfully!")
    
    conn.close()
    
    
    return df

geography_df = fetch_data_from_sql()

geography_df.to_csv('customer_journey.csv', index=False)
    