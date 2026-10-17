INSERT INTO clientes (id, nome, email) VALUES
    (1, 'Ana', 'ana@example.com'),
    (2, 'Bruno', 'bruno@example.com'),
    (3, 'Carla', 'carla@example.com'),
    (4, 'Diego', 'diego@example.com');

INSERT INTO livros (id, titulo, preco, estoque) VALUES
    (1, 'Java na Pratica', 80.00, 12),
    (2, 'SQL Essencial', 60.00, 8),
    (3, 'Algoritmos', 100.00, 5),
    (4, 'Arquitetura de Software', 120.00, 3),
    (5, 'Redes de Computadores', 90.00, 7);

INSERT INTO pedidos (id, cliente_id, realizado_em, status) VALUES
    (1, 1, '2026-01-10', 'PAGO'),
    (2, 2, '2026-01-12', 'PAGO'),
    (3, 1, '2026-02-03', 'PENDENTE'),
    (4, 3, '2026-02-04', 'PAGO'),
    (5, 2, '2026-02-06', 'CANCELADO');

INSERT INTO itens_pedido (pedido_id, livro_id, quantidade, preco_unitario) VALUES
    (1, 1, 1, 80.00),
    (1, 2, 2, 60.00),
    (2, 3, 1, 100.00),
    (3, 4, 1, 120.00),
    (4, 2, 1, 60.00),
    (4, 1, 1, 80.00),
    (5, 1, 3, 80.00);
