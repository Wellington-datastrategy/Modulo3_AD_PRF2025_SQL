-- ATIVIDADE 4 - UNIDADE 3
-- Combinações de Fatores - PRF 2025
-- Tabela: acidentes_prf_2025
-- Critério de cobertura mínima: >= 500 acidentes por combinação
-- Taxa global de acidentes fatais: 7,18%
-- Critério de acidente fatal: mortos >= 1

-- ============================================================
-- 1. TIPO DE PISTA + FASE DO DIA
-- Pergunta de negócio:
-- Como a taxa de acidentes fatais varia conforme a combinação
-- entre tipo de pista e fase do dia?
-- ============================================================

SELECT
    tipo_pista,
    fase_dia,
    COUNT(*) AS acidentes,
    SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) AS acidentes_fatais,
    ROUND(
        100.0 * SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS taxa_fatalidade
FROM acidentes_prf_2025
GROUP BY tipo_pista, fase_dia
HAVING COUNT(*) >= 500
ORDER BY taxa_fatalidade DESC;


-- ============================================================
-- 2. CAUSA DO ACIDENTE + TIPO DE ACIDENTE
-- Pergunta de negócio:
-- Quais combinações entre causa registrada e tipo de acidente
-- apresentam taxas de acidentes fatais acima da taxa global?
-- ============================================================

SELECT
    causa_acidente,
    tipo_acidente,
    COUNT(*) AS acidentes,
    SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) AS acidentes_fatais,
    ROUND(
        100.0 * SUM(CASE WHEN mortos >= 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS taxa_fatalidade
FROM acidentes_prf_2025
GROUP BY causa_acidente, tipo_acidente
HAVING COUNT(*) >= 500
ORDER BY taxa_fatalidade DESC;


-- ============================================================
-- REFERÊNCIA PARA INTERPRETAÇÃO
-- Taxa global de acidentes fatais: 7,18%
--
-- Observação metodológica:
-- Os resultados representam associações observadas na base.
-- Não permitem, isoladamente, estabelecer causalidade.
-- A cobertura mínima de 500 acidentes foi aplicada para evitar
-- interpretações baseadas em combinações com poucos registros.
-- ============================================================
