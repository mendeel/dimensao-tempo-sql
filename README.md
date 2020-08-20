# Tabela de dimensão de tempo

Tabela com dimensão de data/tempo com diversas colunas referentes às datas listadas. A consulta original e o CSV disponibilizado iniciam em 2019-01-01 e vai até 2023-12-31. Esses parâmetros são configuráveis no SQL.

**Importante:** este SQL foi criado no Amazon Redshift, portanto utiliza funções disponíveis nesta ferramenta e pode não funcionar em outros bancos que utilizam SQL.

## Colunas
|COLUNA (tipo) | DESCRIÇÃO |
|--|--|
| datekey (bigint) | ID interno da data |
| data (date)| Data (YYYY-MM-DD HH:mm:ss) |
|ano (bigint)|Ano da data
|mes (bigint)|Mês da data (sem 0)
|trimestre (bigint)| Trimestre da data (sem 0)
|inicio_semana (date)| Data da primeira segunda-feira da semana (YYYY-MM-DD HH:mm:ss)
|range_semana (string)|Dia de início e fim da semana (DD/MM A DD/MM)
|ano_mes (string)|Ano e mês (YYYY/MM)
|mes_ano (string)|Mês e ano (MM/YYYY)
|ano_mes_semana (string)|Ano e mês com semana (YYYY/MM SS)
|dia_da_semana (string)| Nome do dia (apenas 3 primeiros caracteres)
|dia_da_semana_completo (string)| Nome do dia completo
|mes_texto (string)| Nome do mês (apenas 3 primeiros caracteres)
|mes_texto_completo (string)| Nome do mês completo

## Exemplo do CSV
|COLUNA | EXEMPLO|
|--|--|
|datekey|0
|data|2019-01-01 00:00:00
|ano|2019
|mes|1
|trimestre|1
|inicio_semana|2018-12-31 00:00:00
|range_semana|(31/12 A 06/01)
|ano_mes|2019/01
|mes_ano|01/2019
|ano_mes_semana|2018/12 5
|dia_da_semana|TER
|dia_da_semana_completo|TERÇA-FEIRA
|mes_texto|JAN
|mes_texto_completo|JANEIRO

## Informações do CSV
**Codificação:** UTF-8
**Separador:** | (pipe)



