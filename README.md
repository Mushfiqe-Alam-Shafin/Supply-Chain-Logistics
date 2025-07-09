# 📦 Supply Chain & Logistics SQL Analysis Project

This project involves analyzing supply chain and logistics data using **SQLite** (with **DB Browser for SQLite**). It includes realistic, large-scale CSV datasets and a set of challenging SQL problems designed to build skills in querying, data manipulation, and reporting.

---

## 🗂️ Datasets

The project uses 5 interrelated datasets in CSV format:

| File Name        | Description                           |
|------------------|---------------------------------------|
| `products.csv`    | Product ID, name, category, and price |
| `suppliers.csv`   | Supplier information                  |
| `vehicles.csv`    | Vehicle type, capacity, and driver    |
| `orders.csv`      | Orders placed, including product and supplier IDs |
| `shipments.csv`   | Shipments including delivery dates and costs |

All datasets are connected via foreign keys like `product_id`, `supplier_id`, `order_id`, and `vehicle_id`.

---

## 📊 SQL Problem Set

Here are the 10 SQL challenges used in this project:

### 1. Total Quantity Ordered Per Product Category
- Show how much quantity was ordered for each product category.

### 2. Top 5 Suppliers by Quantity Supplied
- Rank suppliers based on the total quantity they provided.

### 3. Average Delivery Delay per Vehicle Type
- Calculate the average delay (in days) for each vehicle type.

### 4. Products Ordered by Each Supplier (Grouped)
- Display all products supplied by each supplier as a grouped list.

### 5. Orders with Late Delivery
- Identify whether each order was delivered on time or late.

### 6. Rolling 3-Order Average Delivery Cost per Vehicle
- For each vehicle, show a rolling average of delivery cost over the last 3 shipments.

### 7. Monthly Delivery Cost per Product Category
- Aggregate delivery cost by month and product category.

### 8. Orders with Multiple Products
- Find all orders that contain more than one product.

### 9. Most Frequently Used Vehicle Types
- Rank vehicle types by how frequently they were used in shipments.

### 10. Supplier Delivery Performance Summary
- Count total orders and number of late deliveries for each supplier.

---

## 🧠 SQL Concepts Covered

- `JOIN` (Inner and Multi-table)
- `GROUP BY` and Aggregations
- `CASE` Statements
- `Subqueries`
- `Common Table Expressions (CTEs)`
- `Window Functions` like `RANK()`, `LEAD()`, `LAG()`
- `GROUP_CONCAT()` (for grouping product names)
- Date handling with `julianday()` and `strftime()`

---

## 🛠 Tools Used

- **SQLite** (tested with DB Browser for SQLite)
- **CSV Datasets**
- Basic SQL features fully compatible with SQLite syntax

---

## 📁 How to Use

1. Clone this repository or download the datasets.
2. Open DB Browser for SQLite.
3. Create a new database and import the CSVs as tables.
4. Use the included SQL queries (from the `queries.sql` file or README) to run analysis.

---

## 👨‍💻 Author

Mushfiqe Alam Shafin  
3rd Year BBA Student – MIS  
University of Dhaka  
Aspiring Data Analyst 🚀

---

## 📜 License

This project is open-source and free to use for learning and portfolio purposes.
