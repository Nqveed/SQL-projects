select * from product
select *,first_value(product_name) over w as
 most_exp_product,
last_value(product_name) over w  as least_exp_product 
from product
window w  as ( partition by  product_category order by price desc 
range between unbounded preceding and 
 unbounded following )
select *,first_value(product_name) over(partition by product_category 
order by price desc) most_exp_product,
last_value(product_name) over(partition by product_category 
order by price desc range between unbounded preceding and 
 unbounded following ) least_exp_product
from product
select *,first_value(product_name) over w as
 most_exp_product,
last_value(product_name) over w  as least_exp_product,
nth_value(product_name,3) over w as second_most_exp_product
from product
window w  as ( partition by  product_category order by price desc 
range between unbounded preceding and 
 unbounded following )
 select *,ntile(3)over(order by price desc) as buckets
  from product where product_category='Phone'
 select product_name, price,
 case when x.buckets=1 then 'Expensive Phones'
      when x.buckets=2 then 'Mid Range Phones'
	  when x.buckets=3 then 'Cheaper Phones'end phone_category
from (	  
 select *,ntile(3)over(order by price desc) as buckets
  from product where product_category='Phone') x
select product_name,(cume_dist_percentage||'%') as cume_dist_percentage
from 
(select *, cume_dist() over (order by price desc) as cume_distribution,
  round (cume_dist() over(order by price desc):: numeric * 100,2) as
  cume_dist_percentage
  from product) x where x.cume_dist_percentage<=30
select product_name,per_rank  from(
select*, percent_rank() over(order by price ) percentage_rank,
 round(percent_rank() over(order by price )::numeric*100,2) 
  per_rank
 from product)x where x.product_name='Galaxy Z Fold 3'
  

