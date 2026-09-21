-- ATIVIDADE 2 - UNIDADE 3
-- Indicadores Básicos - PRF 2025
-- Tabela: acidentes_prf_2025
-- Consultas validadas no DuckDB

-- ============================================================
-- 1. ACIDENTES POR UF
-- Pergunta de negócio:
-- Quantos acidentes foram registrados em cada UF e quais
-- unidades federativas concentram maior volume de ocorrências?
-- ============================================================

SELECT
    uf,
    COUNT(*) AS acidentes
FROM acidentes_prf_2025
GROUP BY uf
ORDER BY acidentes DESC;


-- ============================================================
-- 2. MORTES POR BR
-- Pergunta de negócio:
-- Quais BRs concentram o maior número de mortes registradas?
-- ============================================================

SELECT
    br,
    SUM(mortos) AS total_mortes
FROM acidentes_prf_2025
GROUP BY br
ORDER BY total_mortes DESC;


-- ============================================================
-- 3. ACIDENTES FATAIS POR MÊS
-- Pergunta de negócio:
-- Como os acidentes fatais se distribuíram ao longo de 2025?
-- Critério: ocorrência com pelo menos uma morte (mortos >= 1).
-- ============================================================

SELECT
    DATE_TRUNC('month', data_inversa) AS mes,
    COUNT(*) AS acidentes_fatais
FROM acidentes_prf_2025
WHERE mortos >= 1
GROUP BY mes
ORDER BY mes;
