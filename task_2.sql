import mysql.connector

# Step 1: Connect to MySQL server (no DB yet)
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password123"
)
my_cursor = connection.cursor()

# Step 2: Create database
my_cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
print("Database created successfully")

# Step 3: Reconnect to that database
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password123",
    database="alx_book_store"
)
my_cursor = connection.cursor()

# Step 4: Create tables (Authors first)
my_cursor.execute('''
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215)
)
''')
print("Authors Table created successfully")

my_cursor.execute('''
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)
''')
print("Books Table created successfully")

my_cursor.execute('''
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215)
)
''')
print("Customers Table created successfully")

my_cursor.execute('''
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
''')
print("Orders Table created successfully")

my_cursor.execute('''
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)
''')
print("Order_Details Table created successfully")

print(" All tables created successfully!")

# commit changes and close connection
connection.commit()
connection.close()
