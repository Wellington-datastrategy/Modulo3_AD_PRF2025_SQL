-- ATIVIDADE 5 - UNIDADE 3
-- Views e Exportação - PRF 2025
-- Tabela: acidentes_prf_2025
-- Critério de acidente fatal: mortos >= 1

-- ============================================================
-- 1. VIEW: INDICADORES MENSAIS
-- ============================================================

CREATE OR REPLACE VIEW vw_indicadores_mensais AS
SELECT
    EXTRACT(YEAR FROM data_inversa) AS ano,
    EXTRACT(MONTH FROM data_inversa) AS mes,
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) AS acidentes_fatais,
    ROUND(
        100.0 * SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS perc_fatais
FROM acidentes_prf_2025
GROUP BY ano, mes;

-- Exportação
COPY vw_indicadores_mensais
TO 'resultados/vw_indicadores_mensais.csv'
WITH (HEADER, DELIMITER ',');


-- ============================================================
-- 2. VIEW: INDICADORES POR UF E BR
-- ============================================================

CREATE OR REPLACE VIEW vw_indicadores_uf_br AS
SELECT
    uf,
    br,
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) AS acidentes_fatais,
    ROUND(
        100.0 * SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS perc_fatais
FROM acidentes_prf_2025
GROUP BY uf, br;

-- Exportação
COPY vw_indicadores_uf_br
TO 'resultados/vw_indicadores_uf_br.csv'
WITH (HEADER, DELIMITER ',');


-- ============================================================
-- 3. VIEW: BIVARIADA POR TIPO DE ACIDENTE
-- ============================================================

CREATE OR REPLACE VIEW vw_bivariada_tipo_acidente AS
SELECT
    tipo_acidente,
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) AS acidentes_fatais,
    ROUND(
        100.0 * SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS perc_fatais
FROM acidentes_prf_2025
GROUP BY tipo_acidente;

-- Exportação
COPY vw_bivariada_tipo_acidente
TO 'resultados/vw_bivariada_tipo_acidente.csv'
WITH (HEADER, DELIMITER ',');


-- ============================================================
-- VALIDAÇÃO
-- ============================================================

SELECT * FROM vw_indicadores_mensais ORDER BY ano, mes;
SELECT * FROM vw_indicadores_uf_br ORDER BY total_acidentes DESC LIMIT 20;
SELECT * FROM vw_bivariada_tipo_acidente ORDER BY total_acidentes DESC;
