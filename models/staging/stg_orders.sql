select 
o.orderId,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice,
o.ordercostprice,
c.customerid,
c.customername,
c.segment,
c.country,
p.productid,
p.catagory,
p.productname,
p.subcatagory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c on 
o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on
o.productid = p.productid