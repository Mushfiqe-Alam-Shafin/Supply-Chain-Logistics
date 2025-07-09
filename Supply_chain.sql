---1. Total Quantity Ordered Per Product Category

SELECT p.category,sum(quantity) as total_quantity from orders as o 
join products as p on p.product_id=o.product_id
group by p.category;

---2. Top 5 Suppliers by Total Quantity Supplied

SELECT s.supplier_name,sum(o.quantity) as total_supplied from suppliers as s
join orders as o on o.supplier_id=s.supplier_id
group by s.supplier_name
order by sum(o.quantity) DESC
limit 5;

---3. Average Delivery Delay per Vehicle Type

SELECT v.vehicle_type,round(
avg(julianday(s.actual_delivery)- julianday(s.scheduled_delivery)),2) as avg_delay
from vehicles as v
join shipments as s 
on s.vehicle_id=v.vehicle_id
group by v.vehicle_type;


---4. All Products Ordered by a Specific Supplier

SELECT s.supplier_name,group_concat(distinct product_name order by product_name) as product_list
from suppliers as s 
join orders as o on o.supplier_id=s.supplier_id
join products as p on p.product_id=o.product_id
group by s.supplier_name;


--5. Orders with Late Delivery

SELECT * from
(SELECT order_id,scheduled_delivery,actual_delivery,
case when actual_delivery > scheduled_delivery then 'Late'
when actual_delivery< scheduled_delivery then 'Fast'
when actual_delivery=scheduled_delivery then "on Time" end as Status
from shipments)
where status = 'Late'; 

---6. Rolling 3-Order Average Delivery Cost per Vehicle

SELECT vehicle_id,shipment_id,delivery_cost,avg(delivery_cost) over(PARTITION by vehicle_id
order by shipment_id rows BETWEEN 2 PRECEDING and current row) as rolling_avg 
from shipments;



---7. Monthly Total Delivery Cost per Product Category

SELECT p.category,strftime('%m', s.scheduled_delivery) as month_NUM,
round(sum(s.delivery_cost),2) as MONTHLY_DEL_COST from shipments as s
join orders as o on o.order_id=s.order_id
join products as p on p.product_id=o.product_id
group by p.category,strftime('%m', s.scheduled_delivery);


---8. Orders with Multiple Products

SELECT o.order_id,count(distinct o.product_id) FROM orders as o 
join products as p on p.product_id=o.product_id
group by o.order_id,o.product_id
having count(distinct o.product_id)>1;



---9. Most Frequently Used Vehicle Type



with temp_1 as(SELECT v.vehicle_type,count(*) as shipment_count from shipments as s 
join vehicles as v on v.vehicle_id=s.vehicle_id
group by v.vehicle_type)
SELECT *,rank() over(order by shipment_count desc) from temp_1;


---10. Supplier Delivery Performance Summary



SELECT 
  s.supplier_name,
  COUNT(o.order_id) AS total_orders,
  SUM(CASE 
        WHEN julianday(ship.actual_delivery) > julianday(ship.scheduled_delivery) THEN 1 
        ELSE 0 
      END) AS late_orders
FROM orders o
JOIN suppliers s ON o.supplier_id = s.supplier_id
JOIN shipments ship ON o.order_id = ship.order_id
GROUP BY s.supplier_name
order by late_orders ;

