---
title: Adopción de Edge Computing con Kepler - una inmersión en la supervisión remota, el cuadro de mandos centralizado y la visualización
description: Kepler permite la supervisión remota, el control centralizado y la visualización del consumo energético, revolucionando la capacidad de observación de la energía en el perímetro.
slug: 2023-embracing-edge-computing-with-kepler
weight: 1
date: 2023-10-11 00:00:00 +0000
author: Parul Singh
---

_Publicación comunitaria invitada en el marco de [cloud native sustainability week](https://tag-env-sustainability.cncf.io/cloud-native-sustainability-week/)_

En el panorama tecnológico en constante evolución, la edge-computing ha cambiado las reglas del juego, permitiendo el procesamiento de datos en tiempo real más cerca de la fuente de datos. Kepler, con su integración con OpenTelemetry (OTEL), ha allanado el camino para explorar las opciones de supervisión remota y panel de control centralizado en el perímetro. Este revolucionario enfoque ofrece información muy valiosa sobre el consumo energético de los equipos y las cargas de trabajo, lo que supone un cambio fundamental en el ámbito de la observabilidad de la energía.

## Monitoreo Remoto Revolucionado

Las métricas de Kepler proporcionan información exhaustiva sobre el consumo de energía, lo que permite a los usuarios realizar análisis detallados. La migración de Prometheus al exportador OTLP agiliza el proceso al eliminar la pesada pila de monitorización basada en Prometheus. Los exportadores OTLP de Kepler, que funcionan en dispositivos periféricos, facilitan la recopilación centralizada de métricas y marcan el comienzo de una nueva era de supervisión eficiente de la potencia y la energía.

## El Poder de Centralizar Dashboards

La centralización de los cuadros de mando es la piedra angular de este cambio de paradigma. Con dispositivos edge operativos en varias ubicaciones, disponer de un cuadro de mandos centralizado resulta indispensable. Ofrece una visión unificada de todos los parámetros supervisados, garantizando una supervisión sin fisuras e identificando las cargas de trabajo y/o dispositivos que más energía consumen. La centralización de los cuadros de mando garantiza el fácil acceso a la información sobre el consumo energético de los equipos y las cargas de trabajo, lo que permite tomar decisiones a tiempo y resolver problemas de forma proactiva.

## El Poder de OpenTelemetry

Adoptar OpenTelemetry no es sólo una tendencia; es una necesidad. Este estándar abierto para la observabilidad garantiza una instrumentación, recopilación y exportación de datos telemétricos independiente del proveedor. La flexibilidad, la coherencia y el creciente ecosistema de OpenTelemetry, junto con el apoyo de los principales proveedores de observabilidad, lo posicionan como la mejor opción para las aplicaciones modernas.

<p class="mt-5 mb-5"><img src="/images/blogs/2023-09-cloud-native-sustainability-week/KEPLER-OTEL.webp" alt="Illustration of how Kepler integrates with OpenTelemetry components"></p>

## La Genialidad de la Arquitectura de Kepler

La arquitectura de Kepler captura métricas a nivel de pod/contenedor/procesos de forma eficiente. El recopilador OTEL actúa como intermediario, procesando y enrutando los datos a los destinos. Aprovechar Prometheus como backend, junto con la destreza de Grafana, transforma los datos sin procesar en visualizaciones significativas. Esta sinergia ofrece una experiencia fluida, que permite a los usuarios comprender datos complejos sin esfuerzo.

En conclusión, Kepler junto con OpenTelemetry y su enfoque en edge computing marcan un salto significativo en el panorama de la monitorización de energía. Siga [link](https://github.com/husky-parul/otel-observability) para los pasos de despliegue. Esté atento a más actualizaciones sobre [Kepler OTEL SDK instrumentation](https://github.com/sustainable-computing-io/kepler/issues/659).

Referencia: [Validated Patterns](https://validatedpatterns.io/learn/about-validated-patterns/)
