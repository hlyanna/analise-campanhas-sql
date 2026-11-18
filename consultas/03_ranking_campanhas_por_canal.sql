-- Pergunta 3: qual o ranking das campanhas, por receita, dentro de cada canal?
--
-- RANK() é uma função de janela: numera as linhas sem juntá-las.
-- PARTITION BY canal faz o ranking recomeçar do 1 em cada canal,
-- e ORDER BY SUM(receita) DESC coloca a maior receita em 1º lugar.

SELECT
  canal,
  campanha,
  SUM(receita) AS receita_total,
  RANK() OVER (PARTITION BY canal ORDER BY SUM(receita) DESC) AS posicao_no_canal
FROM campanhas
GROUP BY canal, campanha
ORDER BY canal, posicao_no_canal;
