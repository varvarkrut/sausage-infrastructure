### Индексы для таблицы 'order_product'
`CREATE INDEX idx_order_product_id ON order_product (order_id);`  
`CREATE INDEX idx_order_product_product_id ON order_product (product_id);`

### Индексы для таблицы 'product' 
`CREATE INDEX idx_product_id ON product (id);`  
`CREATE INDEX idx_product_name ON product (name);`  
`CREATE INDEX idx_product_price ON product (price);`  

### Индексы для таблицы 'orders'
`CREATE INDEX idx_orders_id ON orders (id);`