-- ATIVIDADE 2 - UNIDADE 3
-- Filtros Orientados - PRF 2025
-- Objetivo: explorar acidentes fatais usando filtros e ordenação.
-- Filtro principal: mortos >= 1

-- 1. UF
SELECT
    uf,
    COUNT(*) AS acidentes_fatais
FROM acidentes_prf_2025
WHERE mortos >= 1
GROUP BY uf
ORDER BY acidentes_fatais DESC;

-- 2. BR
SELECT
    br,
    COUNT(*) AS acidentes_fatais
FROM acidentes_prf_2025
WHERE mortos >= 1
GROUP BY br
ORDER BY acidentes_fatais DESC;

-- 3. Causa do acidente
SELECT
    causa_acidente,
    COUNT(*) AS acidentes_fatais
FROM acidentes_prf_2025
WHERE mortos >= 1
GROUP BY causa_acidente
ORDER BY acidentes_fatais DESC;

-- 4. Tipo de acidente
SELECT
    tipo_acidente,
    COUNT(*) AS acidentes_fatais
FROM acidentes_prf_2025
WHERE mortos >= 1
GROUP BY tipo_acidente
ORDER BY acidentes_fatais DESC;

-- 5. Condição meteorológica
SELECT
    condicao_metereologica,
    COUNT(*) AS acidentes_fatais
FROM acidentes_prf_2025
WHERE mortos >= 1
GROUP BY condicao_metereologica
ORDER BY acidentes_fatais DESC;
