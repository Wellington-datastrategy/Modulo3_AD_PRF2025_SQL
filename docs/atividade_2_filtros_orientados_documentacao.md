# Atividade 2 — Filtros Orientados | PRF 2025

## Objetivo

Explorar acidentes fatais utilizando filtros e ordenação, registrando cinco padrões observados diretamente nos dados.

## Critério utilizado

Filtro principal:

```sql
WHERE mortos >= 1
```

Ordenação:

```sql
ORDER BY acidentes_fatais DESC
```

A unidade de análise é a ocorrência de acidente.

## Cinco observações

### 1. UF
Minas Gerais apresentou o maior número de acidentes fatais, com **647 ocorrências**, seguida por Paraná (**511**) e Bahia (**476**).

### 2. BR
A **BR-101** apresentou o maior número de acidentes fatais, com **682 ocorrências**, seguida pela **BR-116**, com **638**.

### 3. Causa
**Ausência de reação do condutor** apresentou o maior número de acidentes fatais entre as causas registradas, com **779 ocorrências**, seguida por **Transitar na contramão**, com **736**.

### 4. Tipo de acidente
**Colisão frontal** apresentou o maior número de acidentes fatais, com **1.396 ocorrências**, seguida por **Atropelamento de Pedestre**, com **902**.

### 5. Condição meteorológica
**Céu Claro** apresentou o maior número de acidentes fatais, com **3.419 ocorrências**, seguida por **Nublado**, com **830**.

## Cuidado metodológico

As observações representam **contagens absolutas de ocorrências fatais**. Elas não representam, isoladamente, medida de risco, taxa de fatalidade ou causalidade.

A comparação por UF e BR, por exemplo, não controla exposição ao tráfego, extensão da rodovia ou volume de veículos. Da mesma forma, o maior número de ocorrências em uma condição meteorológica não significa que essa condição seja mais arriscada.

## Produto da atividade

- `sql_atividade_2_filtros_orientados_prf2025.sql` — consultas utilizadas.
- `Atividade_2_Unidade_3_Filtros_Orientados_PRF2025.pptx` — apresentação da atividade.
- `atividade_2_filtros_orientados_documentacao.md` — registro textual das cinco observações.
