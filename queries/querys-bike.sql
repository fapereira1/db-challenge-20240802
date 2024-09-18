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


-- 2. Listar os Produtos que não tenham sido comprados
