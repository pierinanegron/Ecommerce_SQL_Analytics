# E-Commerce Analytics: SQL Cohort Analysis

## ¿Qué es esto?
Análisis de cohort de clientes de una tienda de e-commerce.
Queremos entender: **¿Qué clientes son más leales?**

## El objetivo
Agrupar clientes por mes de primera compra y ver cuántos vuelven a comprar después.

## ¿Por qué importa?
- Si los clientes de octubre tienen 60% retención y los de diciembre 20%
- Entonces octubre fue mejor
- Replicamos lo que pasó en octubre

## Los datos
- Dataset: Brazilian E-Commerce (Kaggle)
- 100,000+ órdenes
- 32,000+ clientes
- Período: 2016-2018

## Las columnas
- **cohort_month**: Mes en que el cliente compró por PRIMERA VEZ
- **months_since_first**: Cuántos meses han pasado desde su primera compra
- **returning_customers**: Cuántos clientes VOLVIERON a comprar
- **cohort_size**: Total de clientes que entraron ese mes
- **retention_rate**: % de clientes que volvieron (returning_customers / cohort_size)

## Ejemplo de lectura
Si ves:
cohort_month = 2016-10-01
months_since_first = 0
returning_customers = 1234
cohort_size = 5000
retention_rate = 24.68%

Significa:
- En OCTUBRE 2016 entraron 5,000 clientes nuevos
- En ese MISMO mes (mes 0), 1,234 compraron = 24.68% hizo una compra

Si ves:
cohort_month = 2016-10-01
months_since_first = 1
returning_customers = 456
cohort_size = 5000
retention_rate = 9.12%

Significa:
- De los 5,000 clientes de octubre
- En NOVIEMBRE (1 mes después), 456 volvieron = 9.12% retención

## Archivos
- `queries/` → Las queries SQL
- `screenshots/` → Resultados
- `README.md` → Este archivo
- `insights.md` → Lo que aprendimos

## Técnicas SQL usadas
- **CTEs (WITH)**: Dividir la lógica en partes claras
- **Window Functions (ROW_NUMBER)**: Encontrar la primera compra
- **DATE_TRUNC**: Agrupar por mes
- **DATE_DIFF**: Calcular meses entre fechas
- **Aggregations**: COUNT, SUM, etc.

## Próximos pasos
Con este análisis, una empresa podría:
1. Identificar qué cohorts tienen mejor retención
2. Investigar QUÉ pasó en esos meses
3. Replicar esas estrategias
4. Mejorar la retención general