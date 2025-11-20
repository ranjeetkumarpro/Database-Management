  # Group By having
  use company;
   select * from book2;
    #1 find total sale amount for each region.
   alter table book2 rename column quqntity to quantity;
   select region,sum(quantity * price) As Total_sale_amont
   from book2 
   group by region;
   #2 find total quantity sold by each salesperson.
   select salesperson, sum(quantity) as total_quantity_sold
   from book2
   group by salesperson;
   #3 show categories where total quantity sold is more than 30.
   select category, sum(quantity) as total_quantity_sold from book2 group by category
   having sum(quantity) > 30;
   #4 find total revenue by each category.
    select category, sum(quantity*price) as total_revenue from book2
    group by category;
    #5 find salesperson who sold total quantity mopre than 20. 
select salesperson, sum(quantity) as sold_total_quantity from book2
group by salesperson having sum(quantity)>20;
#6 find region-wise average sale price.
 select region, avg(price) as average_sale_price from book2
 group by region;
 #7 find total revenue for each salesperson and show only those having revenue above 300000.
 select salesperson, sum(quantity*price) as total_revenue from book2 
 group by salesperson having sum(quantity*price) > 300000;
  #8 find how many products each category has.
   select category, count(distinct product) as total_product from book2 
   group by category;