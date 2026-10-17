-- 1. Faturamento dos pedidos pagos. Resultado esperado: 440.00.
SELECT SUM(i.quantidade * i.preco_unitario) AS faturamento
FROM pedidos AS p
JOIN itens_pedido AS i ON i.pedido_id = p.id
WHERE p.status = 'PAGO';

-- 2. Total gasto por cliente, inclusive quem não comprou.
SELECT c.nome,
       COALESCE(SUM(i.quantidade * i.preco_unitario), 0) AS total_gasto
FROM clientes AS c
LEFT JOIN pedidos AS p ON p.cliente_id = c.id AND p.status = 'PAGO'
LEFT JOIN itens_pedido AS i ON i.pedido_id = p.id
GROUP BY c.id, c.nome
ORDER BY total_gasto DESC, c.nome;

-- 3. Livros vendidos em pedidos pagos (ordem decrescente).
SELECT l.titulo,
       COALESCE(SUM(CASE WHEN p.status = 'PAGO' THEN i.quantidade ELSE 0 END), 0) AS unidades_vendidas
FROM livros AS l
LEFT JOIN itens_pedido AS i ON i.livro_id = l.id
LEFT JOIN pedidos AS p ON p.id = i.pedido_id AND p.status = 'PAGO'
GROUP BY l.id, l.titulo
ORDER BY unidades_vendidas DESC, l.titulo;

-- 4. Pedidos pagos com valor acima de 150.
SELECT p.id, c.nome, SUM(i.quantidade * i.preco_unitario) AS total
FROM pedidos AS p
JOIN clientes AS c ON c.id = p.cliente_id
JOIN itens_pedido AS i ON i.pedido_id = p.id
WHERE p.status = 'PAGO'
GROUP BY p.id, c.nome
HAVING SUM(i.quantidade * i.preco_unitario) > 150
ORDER BY total DESC;
