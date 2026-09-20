-- ATIVIDADE 1 - UNIDADE 3
-- Importação e validação da base PRF 2025
-- DuckDB

-- 1. Importação da base
CREATE TABLE IF NOT EXISTS acidentes_prf_2025 AS
SELECT *
FROM read_csv_auto(
    'dados_brutos/dados_abertos_prf-datatran2025.csv',
    encoding='latin-1'
);

-- 2. Validação estrutural
DESCRIBE acidentes_prf_2025;

-- 3. Validação quantitativa
SELECT COUNT(*) AS total_registros
FROM acidentes_prf_2025;