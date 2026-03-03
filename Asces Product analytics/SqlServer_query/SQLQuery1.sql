with cte as(
select 
a.Product,a.Category,a.Brand,a.Description,a.Sale_price,a.Cost_price,a.Image_url,
b.Date,b.Customer_Type,b.Discount_Band,b.Units_Sold,
(sale_price * Units_Sold) as revenue,
(Cost_Price * Units_Sold) as total_cost,
format(date,'MMMM') as month,
format(date,'yyyy') as year
from Product_data as a
join product_sales as b
on a.Product_ID = b.Product)

select * ,
(1-discount*1.0 / 100)*revenue as discount_revenue
from cte as a
join discount_data as b
on a.Discount_Band = b.Discount_Band and a.month = b.month