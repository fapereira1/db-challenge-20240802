/*
  ---------------------------------------------------------------
  Nome do Arquivo : queries_bike_store.sql
  Data de Criação : 18/09/2024
  Autor           : Fábio Augusto Pereira
  Descrição       : Esse script contém as consultas do desafio codesh.

  Modificações:
  ---------------------------------------------------------------
*/

/*
  ---------------------------------------------------------------
   1. Listar todos Clientes que não tenham realizado uma compra
      Essa consulta busca todos os clientes que não têm pedidos associados na tabela orders.
  ---------------------------------------------------------------
*/
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


/*
  ---------------------------------------------------------------
   2. Listar os Produtos que não tenham sido comprados
      Essa consulta busca todos os produtos que não aparecem na tabela order_items, 
      ou seja, produtos que não foram comprados.  
---------------------------------------------------------------
*/
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


/*
  ---------------------------------------------------------------
   3. Listar os Produtos sem Estoque
      Essa consulta lista os produtos cujo estoque é zero 
      ou não possuem entrada na tabela stocks.
---------------------------------------------------------------
*/
SELECT p.*
FROM products p
LEFT JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity IS NULL OR s.quantity = 0;


/*
  ---------------------------------------------------------------
   4. Agrupar a quantidade de vendas que uma determinada Marca por Loja
      Nessa consulta, queremos agrupar o número de vendas (itens comprados) 
      por loja e marca.
---------------------------------------------------------------
*/
SELECT b.brand_name, s.store_name, SUM(oi.quantity) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY b.brand_name, s.store_name;