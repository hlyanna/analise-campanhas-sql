# Análise de Campanhas de Mídia Paga com SQL

Análise de desempenho de campanhas de mídia paga (Meta Ads, Google Ads e TikTok Ads) usando SQL Server.

O objetivo é responder perguntas comuns no dia a dia de marketing de performance com consultas SQL: quanto cada canal investiu e faturou, quais campanhas têm o melhor retorno, quanto custa cada conversão e como o desempenho evolui ao longo do tempo.

## Perguntas de negócio

| # | Pergunta | Consulta |
|---|----------|----------|
| 1 | Quanto cada canal investiu e quanto gerou de receita? | [01_resumo_por_canal.sql](consultas/01_resumo_por_canal.sql) |
| 2 | Quais campanhas têm ROAS acima de 3? | [02_campanhas_roas_acima_de_3.sql](consultas/02_campanhas_roas_acima_de_3.sql) |
| 3 | Qual o ranking das campanhas dentro de cada canal? | [03_ranking_campanhas_por_canal.sql](consultas/03_ranking_campanhas_por_canal.sql) |
| 4 | Quanto custa cada clique e cada conversão, e qual campanha converte melhor? | [04_eficiencia_por_campanha.sql](consultas/04_eficiencia_por_campanha.sql) |
| 5 | Como investimento, receita e ROAS evoluíram dia a dia? | [05_evolucao_diaria.sql](consultas/05_evolucao_diaria.sql) |

Técnicas usadas: `GROUP BY`, funções de agregação (`SUM`, `ROUND`), `HAVING`, `ORDER BY` e funções de janela (`RANK() OVER (PARTITION BY ...)` e soma acumulada com `SUM() OVER`).

## Dados

A tabela `campanhas` traz o desempenho diário de cada campanha, de 01/10 a 04/10/2026:

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

## Resultados

No período, as campanhas investiram **R$ 6.105** e geraram **R$ 28.440** em receita, com 352 conversões e ROAS geral de **4,66**.

### 1. Resumo por canal

| Canal | Investimento | Receita | ROAS |
|-------|-------------:|--------:|-----:|
| Meta | R$ 2.730 | R$ 15.250 | 5,59 |
| Google | R$ 1.785 | R$ 10.760 | 6,03 |
| TikTok | R$ 1.590 | R$ 2.430 | 1,53 |

O Meta gerou a maior receita, mas o Google teve o melhor retorno por real investido.

### 2. Campanhas com ROAS acima de 3

| Campanha | Canal | Investimento | Receita | ROAS |
|----------|-------|-------------:|--------:|-----:|
| Search Marca | Google | R$ 605 | R$ 7.250 | 11,98 |
| Remarketing | Meta | R$ 780 | R$ 5.800 | 7,44 |
| Black Friday | Meta | R$ 1.950 | R$ 9.450 | 4,85 |

Três de cinco campanhas passaram da meta. A Institucional (Google) ficou logo abaixo, com ROAS de 2,97, e a Awareness (TikTok) teve 1,53.

### 3. Ranking dentro de cada canal

| Canal | Posição | Campanha | Receita |
|-------|--------:|----------|--------:|
| Google | 1º | Search Marca | R$ 7.250 |
| Google | 2º | Institucional | R$ 3.510 |
| Meta | 1º | Black Friday | R$ 9.450 |
| Meta | 2º | Remarketing | R$ 5.800 |
| TikTok | 1º | Awareness | R$ 2.430 |

No Meta, a campanha que mais fatura (Black Friday) não é a mais eficiente: o Remarketing tem ROAS 53% maior com 40% do investimento.

### 4. Eficiência por campanha

| Campanha | Canal | CPC | CPA | Taxa de conversão | Ticket médio |
|----------|-------|----:|----:|------------------:|-------------:|
| Search Marca | Google | R$ 0,17 | R$ 6,80 | 2,45% | R$ 81,46 |
| Remarketing | Meta | R$ 0,33 | R$ 11,30 | 2,91% | R$ 84,06 |
| Black Friday | Meta | R$ 0,41 | R$ 16,81 | 2,47% | R$ 81,47 |
| Institucional | Google | R$ 0,37 | R$ 25,65 | 1,45% | R$ 76,30 |
| Awareness | TikTok | R$ 0,20 | R$ 49,69 | 0,40% | R$ 75,94 |

O ticket médio é parecido entre as campanhas (R$ 76 a R$ 84). Então a diferença de resultado vem do custo por conversão: o CPA da Awareness é mais de 7 vezes o da Search Marca. A Awareness tem clique barato, mas converte apenas 0,40% dos cliques.

### 5. Evolução diária

| Data | Investimento | Receita | ROAS | Receita acumulada |
|------|-------------:|--------:|-----:|------------------:|
| 01/10 | R$ 1.550 | R$ 7.200 | 4,65 | R$ 7.200 |
| 02/10 | R$ 1.450 | R$ 6.600 | 4,55 | R$ 13.800 |
| 03/10 | R$ 1.600 | R$ 7.680 | 4,80 | R$ 21.480 |
| 04/10 | R$ 1.505 | R$ 6.960 | 4,62 | R$ 28.440 |

O ROAS diário ficou estável, entre 4,55 e 4,80. O dia 03/10 teve o maior investimento e também o melhor retorno.

## Conclusões e recomendações

- **Aumentar o investimento em Search Marca e Remarketing.** São as campanhas com maior ROAS e menor CPA, e juntas receberam só 23% do investimento. Antes de escalar, vale acompanhar se o retorno se mantém com mais verba, porque buscas pela marca têm volume limitado.
- **Revisar a campanha Institucional.** Com ROAS de 2,97, ela está logo abaixo da meta. Ajustes de palavras-chave ou de página de destino podem melhorar a taxa de conversão de 1,45%.
- **Avaliar a Awareness pelo objetivo certo.** O ROAS baixo é esperado para uma campanha de alcance. O ideal é medir essa campanha por métricas de topo de funil (alcance, CPM, aumento de buscas pela marca), e não só por venda direta. Se o objetivo for conversão, ela precisa de reestruturação.

## Como reproduzir

1. Abra o SQL Server Management Studio (SSMS).
2. Rode o script [`dados/01_criar_tabela_campanhas.sql`](dados/01_criar_tabela_campanhas.sql) para criar o banco e a tabela.
3. Rode as consultas da pasta [`consultas/`](consultas/).

## Ferramentas

- SQL Server Express
- SQL Server Management Studio (SSMS)
