-- Pergunta: quanto cada canal investiu e quanto gerou de receita?
-- Também calcula o ROAS (receita / investimento) de cada canal.

SELECT
  canal,
  SUM(investimento)                AS investimento_total,
  SUM(receita)                     AS receita_total,
  SUM(receita) / SUM(investimento) AS roas
FROM campanhas
GROUP BY canal
ORDER BY receita_total DESC;
