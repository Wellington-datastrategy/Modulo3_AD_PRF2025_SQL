# Análise de Dados PRF 2025 — SQL

## Módulo 03 – SQL para Análise de Dados

Projeto desenvolvido a partir dos Dados Abertos da Polícia Rodoviária Federal (PRF), com foco na análise de acidentes de trânsito registrados em 2025.

O projeto utiliza SQL para auditoria, exploração, criação de indicadores, análises bivariadas, consultas combinadas, cálculo de Lift, criação de Views, avaliação da qualidade dos dados e preparação de bases para análises posteriores.

---

## 🎯 Objetivo

Analisar os acidentes registrados pela PRF em 2025 e identificar padrões e fatores associados à ocorrência de acidentes fatais.

A variável-alvo utilizada no projeto é:

```text
acidente_fatal = 1 quando mortos >= 1
acidente_fatal = 0 quando mortos = 0
```

A unidade de análise é a **ocorrência de acidente**.

---

## 📊 Fonte dos Dados

- **Fonte:** Dados Abertos da Polícia Rodoviária Federal (PRF)
- **Ano:** 2025
- **Base:** Acidentes agrupados por ocorrência
- **Total de registros analisados:** 72.529 ocorrências

A base original foi preservada na pasta `dados_brutos/`.

---

## 🛠️ Tecnologias Utilizadas

- SQLite
- DB Browser for SQLite
- SQL
- Git
- GitHub
- CSV

Os arquivos CSV gerados podem ser reutilizados posteriormente em ferramentas como Excel, Python e Power BI.

---

## 📁 Estrutura do Projeto

```text
Modulo3_AD_PRF2025_Sql/
│
├── dados_brutos/
│   └── Base original da PRF
│
├── docs/
│   └── Readme_sql_proj_prf2025.md
│
├── resultados/
│   └── Resultados das consultas em formato CSV
│
├── sql/
│   ├── 01_auditoria.sql
│   ├── 02_criacao_view.sql
│   ├── 03_indicadores_gerais.sql
│   ├── 04_indicadores_uf.sql
│   ├── 05_indicadores_br.sql
│   ├── 06_serie_temporal.sql
│   ├── ...
│   └── 20_qualidade_dados_coalesce.sql
│
├── proj_prf_sql.db
├── .gitignore
└── README.md
```

---

## 🔎 Principais Análises

O projeto foi desenvolvido de forma sequencial, contemplando:

- Auditoria da base de dados;
- Verificação da estrutura da tabela;
- Contagem de registros;
- Criação da View `vw_acidentes_base`;
- Indicadores gerais;
- Indicadores por Unidade da Federação (UF);
- Indicadores por rodovia (BR);
- Evolução temporal;
- Análise por tipo de acidente;
- Análise por causa do acidente;
- Análise por fase do dia;
- Análise por condição meteorológica;
- Análise por tipo de pista;
- Consultas bivariadas;
- Consultas combinadas com dois fatores explicativos;
- Cálculo de Lift;
- Criação de Views analíticas;
- Avaliação de valores nulos;
- Padronização utilizando `COALESCE`;
- Exportação dos resultados para CSV;
- Geração da base analítica;
- Geração da base modelável preliminar.

---

## 🧮 Variável-Alvo

A variável `acidente_fatal` foi construída a partir da quantidade de mortos:

```sql
CASE
    WHEN mortos >= 1 THEN 1
    ELSE 0
END AS acidente_fatal
```

Essa variável permite separar as ocorrências em:

- `1` → acidente fatal;
- `0` → acidente não fatal.

---

## 📈 Análise com Lift

O projeto também utiliza o conceito de **Lift** para comparar a proporção de acidentes fatais de uma determinada categoria com a taxa global de acidentes fatais.

A interpretação utilizada é:

- **Lift > 1:** proporção fatal acima da média global;
- **Lift = 1:** proporção próxima à média global;
- **Lift < 1:** proporção fatal abaixo da média global.

O Lift é utilizado como medida de associação analítica e **não representa causalidade**.

---

## 🗃️ Bases Exportadas

Os resultados das consultas foram exportados em formato CSV e armazenados na pasta:

```text
resultados/
```

Entre os resultados estão:

- Indicadores gerais;
- Indicadores por UF;
- Indicadores por BR;
- Evolução mensal;
- Análises por tipo de acidente;
- Análises por causa;
- Análises por fase do dia;
- Análises por condição meteorológica;
- Análises por tipo de pista;
- Consultas bivariadas;
- Consultas combinadas;
- Indicadores com Lift;
- Base analítica;
- Base modelável preliminar.

---

## 🧠 Base Analítica e Base Modelável

Foram preparadas duas bases com objetivos diferentes.

### Base Analítica

Contém a variável `mortos` e foi preparada para análises descritivas e exploratórias.

### Base Modelável Preliminar

Não contém a variável `mortos`.

Essa exclusão busca evitar **data leakage**, uma vez que a quantidade de mortos está diretamente relacionada à definição da variável-alvo `acidente_fatal`.

A preparação final da base modelável será realizada posteriormente em Python.

---

## ▶️ Como Reproduzir o Projeto

### 1. Abrir o banco

Abra:

```text
proj_prf_sql.db
```

utilizando o **DB Browser for SQLite**.

### 2. Acessar o SQL

Abra a aba:

```text
Execute SQL
```

### 3. Executar os scripts

Os scripts estão organizados na pasta:

```text
sql/
```

Recomenda-se executar as etapas na ordem apresentada pelos arquivos.

### 4. Conferir os resultados

Antes da exportação, confira os resultados de cada consulta.

### 5. Exportar

Os resultados devem ser exportados em formato CSV para:

```text
resultados/
```

---

## 📚 Documentação

A documentação complementar do módulo está disponível em:

```text
docs/Readme_sql_proj_prf2025.md
```

Esse documento apresenta informações sobre fonte dos dados, ferramenta utilizada, execução do projeto, arquivos gerados, controle dos resultados, observações e referências.

---

## 📖 Metodologia e Referências

O projeto utiliza como referências:

- Dados Abertos da Polícia Rodoviária Federal;
- Dicionário de variáveis da PRF;
- Conteúdo e orientações do Módulo 03 – SQL para Análise de Dados;
- Metodologia CRISP-DM;
- Documentação técnica do SQLite;
- Documentação do DB Browser for SQLite.

---

## 🔁 Reprodutibilidade

O projeto foi organizado com separação entre:

- dados brutos;
- scripts SQL;
- resultados;
- documentação;
- banco de dados.

A organização dos scripts, os comentários e os cabeçalhos das consultas foram utilizados para facilitar a compreensão, manutenção e reprodução das análises.

---

## 👤 Autor

**Wellington Lima**

Projeto desenvolvido no contexto da formação em **Análise de Dados / SQL**, utilizando dados públicos da Polícia Rodoviária Federal.

---
