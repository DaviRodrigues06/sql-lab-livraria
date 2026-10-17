# SQL Lab — Livraria

Laboratório pessoal de **modelagem relacional e consultas SQL** sobre uma livraria fictícia. Os dados são inteiramente inventados.

## Modelo

| Tabela | Papel |
| --- | --- |
| `clientes` | Identificação de compradores |
| `livros` | Catálogo com preço e estoque |
| `pedidos` | Compra, data e estado |
| `itens_pedido` | Livros, quantidade e preço histórico de cada pedido |

`itens_pedido.preco_unitario` preserva o valor no momento da compra, mesmo que o preço no catálogo mude. As chaves estrangeiras ligam as tabelas; `CHECK` impede quantidades e preços inválidos.

## Executar no PostgreSQL

Crie um banco local vazio, por exemplo `livraria_lab`, e execute nesta ordem:

```bash
psql -d livraria_lab -f schema.sql
psql -d livraria_lab -f seed.sql
psql -d livraria_lab -f queries.sql
```

Os scripts de criação e carga são para um banco vazio; uma segunda execução sem recriar o banco gera conflitos de tabelas ou chaves. Os comandos acima presumem que seu `psql` já está configurado para se conectar ao banco local.

## Consultas incluídas

1. Faturamento apenas de pedidos pagos: **440,00**.
2. Total pago por cliente, incluindo quem ainda não comprou.
3. Quantidade vendida de cada livro, incluindo os sem venda.
4. Pedidos pagos acima de **150,00**.

Os resultados dos dados de exemplo são Ana 200, Carla 140, Bruno 100 e Diego 0; o pedido 1 é o único acima de 150. A consulta de quantidade ignora pedidos pendentes e cancelados.

## Próximos exercícios

- Filtrar vendas por mês e comparar períodos.
- Adicionar devoluções sem reescrever o histórico de pedidos.
- Verificar planos de execução com `EXPLAIN ANALYZE` e justificar índices.
- Integrar este modelo a uma API Java em um projeto separado.

Os scripts foram verificados com SQLite em memória para esquema, carga e resultados das quatro consultas. A execução específica no PostgreSQL ainda precisa ser conferida em um ambiente PostgreSQL.
