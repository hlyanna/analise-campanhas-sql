# Análise de Campanhas de Mídia Paga com SQL

Análise de desempenho de campanhas de mídia paga (Meta Ads, Google Ads e TikTok Ads) usando SQL Server.

O objetivo é responder perguntas comuns no dia a dia de marketing de performance com consultas SQL: quanto cada canal investiu e faturou, quais campanhas têm o melhor retorno e como o desempenho evolui ao longo do tempo.

## Perguntas de negócio

| # | Pergunta | Consulta |
|---|----------|----------|
| 1 | Quanto cada canal investiu e quanto gerou de receita? | [01_resumo_por_canal.sql](consultas/01_resumo_por_canal.sql) |
| 2 | Quais campanhas têm ROAS acima de 3? | em andamento |
| 3 | Qual o ranking das campanhas dentro de cada canal? | em andamento |

## Dados

A tabela `campanhas` traz o desempenho diário de cada campanha:

| Coluna | Descrição |
|--------|-----------|
| `data` | Dia da veiculação |
| `canal` | Plataforma de mídia (Meta, Google, TikTok) |
| `campanha` | Nome da campanha |
| `investimento` | Valor investido no dia (R$) |
| `cliques` | Cliques no anúncio |
| `conversoes` | Vendas atribuídas à campanha |
| `receita` | Receita gerada pelas conversões (R$) |

Os dados são fictícios e foram criados para fins de estudo.

## Principais resultados

**Resumo por canal (01/10 a 04/10/2026)**

| Canal | Investimento | Receita | ROAS |
|-------|-------------:|--------:|-----:|
| Meta | R$ 2.730 | R$ 15.250 | 5,6 |
| Google | R$ 1.785 | R$ 10.760 | 6,0 |
| TikTok | R$ 1.590 | R$ 2.430 | 1,5 |

- O Google teve o maior retorno por real investido, puxado pela campanha de Search de marca.
- O Meta gerou a maior receita total.
- O TikTok teve o menor ROAS, o que é esperado para uma campanha de awareness (foco em alcance, não em conversão direta).

## Como reproduzir

1. Abra o SQL Server Management Studio (SSMS).
2. Rode o script [`dados/01_criar_tabela_campanhas.sql`](dados/01_criar_tabela_campanhas.sql) para criar o banco e a tabela.
3. Rode as consultas da pasta [`consultas/`](consultas/).

## Ferramentas

- SQL Server Express
- SQL Server Management Studio (SSMS)
