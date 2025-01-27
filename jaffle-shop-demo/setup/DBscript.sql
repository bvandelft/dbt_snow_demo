-- Execute this code from the worksheet in Snowsight with the Accountadmin Role

create or replace warehouse compute_wh;
create or replace database raw;
create or replace database analytics;
create or replace schema raw.demo;
create or replace schema raw.show;

create table raw.demo.customers 
( id varchar,
  name varchar
);

copy into raw.demo.customers (id, name)
from 's3://dbt-tutorial-public/long_term_dataset/raw_customers.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 

create table raw.demo.orders
( id varchar,
  customer varchar,
  ordered_at datetime,
  store_id varchar,
  subtotal integer,
  tax_paid integer,
  order_total integer
);

copy into raw.demo.orders (id, customer, ordered_at, store_id, subtotal, tax_paid, order_total)
from 's3://dbt-tutorial-public/long_term_dataset/raw_orders.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

create table raw.demo.order_items 
( id varchar,
  orderid varchar,
  sku varchar
);

copy into raw.demo.order_items (id, orderid, sku)
from 's3://dbt-tutorial-public/long_term_dataset/raw_order_items.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

create table raw.demo.products
( sku varchar,
  name varchar,
  type varchar,
  price integer,
  description varchar
);

copy into raw.demo.products (sku, name, type, price, description)
from 's3://dbt-tutorial-public/long_term_dataset/raw_products.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

create table raw.demo.supplies
( id varchar,
  name varchar,
  cost integer,
  perishable boolean,
  sku varchar
);

copy into raw.demo.supplies (id, name, cost, perishable, sku)
from 's3://dbt-tutorial-public/long_term_dataset/raw_supplies.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

create table raw.demo.stores
( id varchar,
  name varchar,
  opened_at date,
  tax_rate float
);

copy into raw.demo.stores (id, name, opened_at, tax_rate)
from 's3://dbt-tutorial-public/long_term_dataset/raw_stores.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );


grant all on database raw to role PC_DBT_ROLE;
grant all on database analytics to role PC_DBT_ROLE;

grant all on schema raw.demo to role PC_DBT_ROLE;
grant all on schema raw.show to role PC_DBT_ROLE;
grant all on schema analytics.public to role PC_DBT_ROLE;

grant all on all tables in database raw to role PC_DBT_ROLE;
grant all on future tables in database raw to role PC_DBT_ROLE;

grant all on all tables in database analytics to role PC_DBT_ROLE;
grant all on future tables in database analytics to role PC_DBT_ROLE;
