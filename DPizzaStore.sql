Create database DA_projects;
use DA_projects;
select * from dpizzastore;

create table customers(
customer_id int primary key auto_increment,
customer_name char(10),
phone_no varchar(15) not null unique check(phone_no regexp'^\\+91-[0-9]{10}$')
);
select count(*) from dpizzastore;

select count(order_details_id) from dpizzastore;
select * from dpizzastore;


# Order wise Details
select
Order_id, 
sum(total_price) as Total_price,
count(distinct pizza_id) as Unique_pizza_count,
sum(quantity) as Total_quantity,
min(order_date) as Order_date,
avg(unit_price) as Unit_price,
min(pizza_size) as Max_pizza_size,
max(pizza_size) as Min_pizza_size,
count(distinct pizza_category) as Unique_pizza_category_count
from dpizzastore group by order_id;

 # Pizza Wise Details 
select 
pizza_id,
min(pizza_name) as Pizza_Name,
sum(quantity) as Quantity,
sum(total_price) as Total_price, 
min(unit_price) as Unit_price,
min(pizza_size) as pizza_size,
min(pizza_ingredients) as Ingedients
from dpizzastore group by pizza_id;

select * from dpizzastore;
 
 # Order and Pizza Id Table 
select order_id,pizza_id from dpizzastore;
select * from pizza_order_id;
drop table dpizzastore;

select * from pizza_wise_details;
alter table pizza_wise_details  modify column pizza_id varchar(50) primary key;

alter table order_wise_details modify column Order_id varchar(50) primary key;
alter table order_wise_details modify column Order_id int auto_increment;

alter table pizza_order_id add constraint foreign key (order_id) references order_wise_details(Order_id);

alter table pizza_order_id add constraint foreign key (pizza_id) references pizza_wise_details(pizza_id);

alter table pizza_order_id modify column pizza_id varchar(50);

# Imported Inventory Table 
select * from inventory_table;

# Added new columns in Inventory table
alter table inventory_table add column Opening_stock float;
alter table inventory_table add column Closing_stock float;
alter table inventory_table add column UOM char(10);
alter table inventory_table add column Receiving float;
alter table inventory_table add column TransferIn float;
alter table inventory_table add column TransferOut float;
alter table inventory_table add column wastege float;
alter table inventory_table add column P_mix float;
alter table inventory_table add column Varience float;

drop table recipe;
create table recipe(
SKU_id varchar(255) default 0,
Item_Name varchar(255),
TheSpicyItalianPizza float default 0,
TheCalabresePizza float default 0,
TheNapolitanaPizza float default 0,
TheItalianCapocolloPizza float default 0,
TheMediterraneanPizza float default 0,
TheSicilianPizza float default 0,
TheChickenPestoPizza float default 0,
TheSouthwestChickenPizza float default 0,
TheSpinachPestoPizza float default 0,
TheSoppressataPizza float default 0,
TheFourCheesePizza float default 0,
TheBigMeatPizza float default 0,
TheClassicDeluxePizza float default 0,
TheSpinachandFetaPizza float default 0,
TheSpinachSupremePizza float default 0,
TheCaliforniaChickenPizza float default 0,
TheThaiChickenPizza float default 0,
TheProsciuttoandArugulaPizza float default 0,
TheGreekPizza float default 0,
TheFiveCheesePizza float default 0,
TheBrieCarrePizza float default 0,
TheHawaiianPizza float default 0,
TheGreenGardenPizza float default 0,
TheVegetablesVegetablesPizza float default 0,
TheBarbecueChickenPizza float default 0,
TheItalianVegetablesPizza float default 0,
ThePepperoniPizza float default 0,
TheChickenAlfredoPizza float default 0,
TheItalianSupremePizza float default 0,
ThePepperSalamiPizza float default 0,
TheMexicanaPizza float default 0,
ThePepperoniMushroomandPeppersPizza float default 0,
Total float default 0
);
SET SQL_SAFE_UPDATES = 0;
select * from recipe ;
delete from recipe where Item_name = Item_name;
select * from inventory_table;
delete from inventory_table where SKU_id= "SKU_id";
delete from recipe where sku_id=0;


insert into recipe(item_name) select ItemName from inventory_table;

insert into recipe(SKU_id) select SKU_Id from Inventory_table ;
select * from recipe;

alter table recipe add column Quantity float default 0; 

drop table recipe










