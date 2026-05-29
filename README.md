# Análisis de Cohortes de Retención - E-commerce (Olist Dataset)

##  Descripción del Proyecto
Este proyecto realiza un análisis de cohortes basado en el tiempo para evaluar la retención y el comportamiento de recompra de los usuarios en una plataforma de comercio electrónico utilizando "Google BigQuery (SQL)". El objetivo principal es identificar qué porcentaje de clientes regresa a comprar mes a mes tras su primera adquisición.

## Principales Hallazgos (Insights de Negocio)
* Baja Retención Inicial: Se observa una caída crítica drástica en el Mes 1, donde la retención promedio no supera el 0.55%. Esto indica una debilidad severa en la fidelización de clientes.
* Crecimiento de Adquisición: El volumen de usuarios nuevos (`cohort_size`) creció exponencialmente, pasando de 700 usuarios en enero de 2017 a más de 6,500 en mayo de 2018. El esfuerzo de marketing funciona para atraer tráfico, pero no retiene clientes.
* Estabilización a Largo Plazo: Existe una base mínima de "superusuarios" que mantiene compras recurrentes estables de entre el 0.05% y el 0.20% hasta 18 meses después de su primera compra.

## Tecnologías y Origen de Datos
* Fuente de Datos: Conjunto de datos público de Olist (un marketplace brasileño) obtenido a través de Kaggle.
* Procesamiento:* Carga de archivos y ejecución de consultas en Google BigQuery empleando funciones de ventana (`ROW_NUMBER() OVER`, `DATE_TRUNC`, `DATE_DIFF`) y expresiones de tabla comunes (CTEs).

## Estructura del Repositorio
* `/queries/cohort_retention.sql`: Consulta optimizada utilizando la lógica de mapeo mediante el identificador único del cliente (`customer_unique_id`).
* `/data/cohort_results.csv`: Resultados tabulares exportados del análisis.