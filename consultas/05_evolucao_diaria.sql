-- Pergunta 5: como investimento, receita e ROAS evoluíram dia a dia?
--
-- A receita acumulada usa SUM(...) OVER (ORDER BY data): uma função de janela
-- que soma a receita do primeiro dia até o dia da linha.

SELECT
  data,
  SUM(investimento)                          AS investimento_dia,
  SUM(receita)                               AS receita_dia,
  ROUND(SUM(receita) / SUM(investimento), 2) AS roas_dia,
  SUM(SUM(receita)) OVER (ORDER BY data)     AS receita_acumulada
FROM campanhas
GROUP BY data
ORDER BY data;
