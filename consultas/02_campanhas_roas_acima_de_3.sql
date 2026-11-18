-- Pergunta 2: quais campanhas têm ROAS acima de 3?
--
-- O ROAS é calculado sobre o total de cada campanha (soma da receita
-- dividida pela soma do investimento), e não como média dos ROAS diários.
-- HAVING filtra depois do agrupamento; WHERE filtraria antes, linha a linha.

SELECT
  campanha,
  canal,
  SUM(investimento)                          AS investimento_total,
  SUM(receita)                               AS receita_total,
  ROUND(SUM(receita) / SUM(investimento), 2) AS roas
FROM campanhas
GROUP BY campanha, canal
HAVING SUM(receita) / SUM(investimento) > 3
ORDER BY roas DESC;
