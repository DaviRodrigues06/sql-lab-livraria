CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    estoque INTEGER NOT NULL CHECK (estoque >= 0)
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL REFERENCES clientes(id),
    realizado_em DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('PAGO', 'PENDENTE', 'CANCELADO'))
);

CREATE TABLE itens_pedido (
    pedido_id INTEGER NOT NULL REFERENCES pedidos(id),
    livro_id INTEGER NOT NULL REFERENCES livros(id),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10, 2) NOT NULL CHECK (preco_unitario >= 0),
    PRIMARY KEY (pedido_id, livro_id)
);

CREATE INDEX idx_pedidos_cliente ON pedidos(cliente_id);
CREATE INDEX idx_itens_livro ON itens_pedido(livro_id);
