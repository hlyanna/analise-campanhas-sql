-- Pergunta 1: quanto cada canal investiu e quanto gerou de receita?
-- Também calcula o ROAS (receita / investimento) de cada canal.
--
-- GROUP BY canal junta todas as linhas do mesmo canal em uma só,
-- e o SUM soma os valores dentro de cada grupo.

SELECT
  canal,
  SUM(investimento)                          AS investimento_total,
  SUM(receita)                               AS receita_total,
  ROUND(SUM(receita) / SUM(investimento), 2) AS roas
FROM campanhas
GROUP BY canal
ORDER BY receita_total DESC;
