-- Pergunta 4: quanto custa cada clique e cada conversão, e qual campanha converte melhor?
--
-- CPC  = investimento / cliques
-- CPA  = investimento / conversões
-- Taxa de conversão = conversões / cliques (em %)
-- Ticket médio = receita / conversões
--
-- 100.0 * força a divisão decimal; sem isso, INT / INT no SQL Server
-- descarta as casas decimais (ex.: 22 / 900 = 0).

SELECT
  campanha,
  canal,
  ROUND(SUM(investimento) / SUM(cliques), 2)        AS cpc,
  ROUND(SUM(investimento) / SUM(conversoes), 2)     AS cpa,
  ROUND(100.0 * SUM(conversoes) / SUM(cliques), 2)  AS taxa_conversao_pct,
  ROUND(SUM(receita) / SUM(conversoes), 2)          AS ticket_medio
FROM campanhas
GROUP BY campanha, canal
ORDER BY cpa;
