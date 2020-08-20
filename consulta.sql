SELECT *
FROM (
WITH dayLocale AS (
	SELECT 0 AS dow, 'DOM' AS dia_da_semana, 'DOMINGO' AS dia_da_semana_completo
	UNION ALL
	SELECT 1 AS dow, 'SEG' AS dia_da_semana, 'SEGUNDA-FEIRA' AS dia_da_semana_completo
	UNION ALL
	SELECT 2 AS dow, 'TER' AS dia_da_semana, 'TERÇA-FEIRA' AS dia_da_semana_completo
	UNION ALL
	SELECT 3 AS dow, 'QUA' AS dia_da_semana, 'QUARTA-FEIRA' AS dia_da_semana_completo
	UNION ALL
	SELECT 4 AS dow, 'QUI' AS dia_da_semana, 'QUINTA-FEIRA' AS dia_da_semana_completo
	UNION ALL
	SELECT 5 AS dow, 'SEX' AS dia_da_semana, 'SEXTA-FEIRA' AS dia_da_semana_completo
	UNION ALL
	SELECT 6 AS dow, 'SAB' AS dia_da_semana, 'SÁBADO' AS dia_da_semana_completo
), monthLocale AS (
	SELECT 1 AS mes_numero, 'JAN' AS mes_texto, 'JANEIRO' AS mes_texto_completo
	UNION ALL
	SELECT 2 AS mes_numero, 'FEV' AS mes_texto, 'FEVEREIRO' AS mes_texto_completo
	UNION ALL
	SELECT 3 AS mes_numero, 'MAR' AS mes_texto, 'MARÇO' AS mes_texto_completo
	UNION ALL
	SELECT 4 AS mes_numero, 'ABR' AS mes_texto, 'ABRIL' AS mes_texto_completo
	UNION ALL
	SELECT 5 AS mes_numero, 'MAI' AS mes_texto, 'MAIO' AS mes_texto_completo
	UNION ALL
	SELECT 6 AS mes_numero, 'JUN' AS mes_texto, 'JUNHO' AS mes_texto_completo
	UNION ALL
	SELECT 7 AS mes_numero, 'JUL' AS mes_texto, 'JULHO' AS mes_texto_completo
	UNION ALL
	SELECT 8 AS mes_numero, 'AGO' AS mes_texto, 'AGOSTO' AS mes_texto_completo
	UNION ALL
	SELECT 9 AS mes_numero, 'SET' AS mes_texto, 'SETEMBRO' AS mes_texto_completo
	UNION ALL
	SELECT 10 AS mes_numero, 'OUT' AS mes_texto, 'OUTUBRO' AS mes_texto_completo
	UNION ALL
	SELECT 11 AS mes_numero, 'NOV' AS mes_texto, 'NOVEMBRO' AS mes_texto_completo
	UNION ALL
	SELECT 12 AS mes_numero, 'DEZ' AS mes_texto, 'DEZEMBRO' AS mes_texto_completo
)

SELECT
generate_series AS datekey, 
cdata::TIMESTAMP AS data, 
DATE_PART('y', cdata) AS ano, 
DATE_PART('mon', cdata) AS mes, 
DATE_PART('qtr', cdata) AS trimestre,
DATE_TRUNC('week', cdata) AS inicio_semana,
'(' || TO_CHAR(DATE_TRUNC('week', cdata)::DATE, 'DD/MM') || ' A ' || TO_CHAR(DATEADD('day',6,DATE_TRUNC('week', cdata))::DATE, 'DD/MM') || ')' AS range_semana,
TO_CHAR(DATE_TRUNC('y', cdata), 'YYYY') || '/' || TO_CHAR(DATE_TRUNC('mon', cdata), 'MM') AS ano_mes,
TO_CHAR(DATE_TRUNC('mon', cdata), 'MM') || '/' || TO_CHAR(DATE_TRUNC('y', cdata), 'YYYY') AS mes_ano,
TO_CHAR(DATE_TRUNC('y', DATE_TRUNC('week', cdata::date)), 'YYYY') || '/' || TO_CHAR(DATE_TRUNC('mon', DATE_TRUNC('week', cdata::date)), 'MM') || ' ' || 
CASE WHEN DATE_PART('day', DATE_TRUNC('week', cdata::date)) BETWEEN 1 AND 8 THEN '1'
WHEN DATE_PART('day', DATE_TRUNC('week', cdata::date)) BETWEEN 9 AND 15 THEN '2'
WHEN DATE_PART('day', DATE_TRUNC('week', cdata::date)) BETWEEN 16 AND 22 THEN '3'
WHEN DATE_PART('day', DATE_TRUNC('week', cdata::date)) BETWEEN 23 AND 29 THEN '4'
WHEN DATE_PART('day', DATE_TRUNC('week', cdata::date)) BETWEEN 24 AND 31 THEN '5'
END AS ano_mes_semana,
dl.dia_da_semana,
dl.dia_da_semana_completo,
ml.mes_texto,
ml.mes_texto_completo
FROM (SELECT '2019-01-01'::DATE + generate_series AS cdata, generate_series
FROM generate_series(0, 5 * 365, 1)) dateTable
INNER JOIN dayLocale dl ON dl.dow = DATE_PART('dow', dateTable.cdata)
INNER JOIN monthLocale ml ON ml.mes_numero = DATE_PART('mon', dateTable.cdata))