-- Cria o banco de dados e a tabela de campanhas com dados fictícios
-- Banco: SQL Server

CREATE DATABASE estudos_sql;
GO
USE estudos_sql;
GO

CREATE TABLE campanhas (
  data         DATE,
  canal        VARCHAR(50),
  campanha     VARCHAR(100),
  investimento DECIMAL(10,2),
  cliques      INT,
  conversoes   INT,
  receita      DECIMAL(10,2)
);

INSERT INTO campanhas VALUES
('2026-10-01','Meta','Black Friday',500,1200,30,2400),
('2026-10-01','Meta','Remarketing',200,600,18,1500),
('2026-10-01','Google','Institucional',300,800,12,900),
('2026-10-01','Google','Search Marca',150,900,22,1800),
('2026-10-01','TikTok','Awareness',400,2000,8,600),
('2026-10-02','Meta','Black Friday',450,1100,25,2100),
('2026-10-02','Meta','Remarketing',180,550,15,1250),
('2026-10-02','Google','Institucional',280,760,10,780),
('2026-10-02','Google','Search Marca',160,950,24,1950),
('2026-10-02','TikTok','Awareness',380,1900,7,520),
('2026-10-03','Meta','Black Friday',520,1250,33,2650),
('2026-10-03','Meta','Remarketing',210,640,20,1700),
('2026-10-03','Google','Institucional',310,820,13,980),
('2026-10-03','Google','Search Marca',140,870,20,1650),
('2026-10-03','TikTok','Awareness',420,2100,9,700),
('2026-10-04','Meta','Black Friday',480,1150,28,2300),
('2026-10-04','Meta','Remarketing',190,580,16,1350),
('2026-10-04','Google','Institucional',290,790,11,850),
('2026-10-04','Google','Search Marca',155,910,23,1850),
('2026-10-04','TikTok','Awareness',390,1950,8,610);
