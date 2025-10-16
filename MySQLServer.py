import mysql.connector
from mysql.connector import Error


try:
        # Connect to MySQL Server 
 connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password123"  
     )
 if connection.is_connected():
    cursor = connection.cursor()
    # Create the database (won't fail if it already exists)
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
    print("Database 'alx_book_store' created successfully!")

except Error as e:
        print(f"Error while connecting to MySQL: {e}")

finally:
        # Always close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")


