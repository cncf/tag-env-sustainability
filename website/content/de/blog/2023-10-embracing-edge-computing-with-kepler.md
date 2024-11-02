---
title: Edge-Computing mit Kepler – Einblick in Remote-Monitoring, zentrales Dashboarding und Visualisierung
description: Kepler ermöglicht das Remote-Monitoring, zentrales Dashboarding und die Visualisierung des Energieverbrauchs und revolutioniert damit die Energie-Überwachung am Edge.
slug: 2023-embracing-edge-computing-with-kepler
weight: 1
date:   2023-10-11 00:00:00 +0000
author: Parul Singh
---

*Gastbeitrag der Community im Rahmen der [Cloud Native Sustainability Week](https://tag-env-sustainability.cncf.io/cloud-native-sustainability-week/)*

In der sich ständig weiterentwickelnden Technologielandschaft hat sich Edge Computing als Game-Changer etabliert, der die Verarbeitung von Echtzeitdaten näher an der Datenquelle ermöglicht. Kepler, mit seiner Integration in OpenTelemetry (OTEL), hat den Weg für die Erkundung von Remote-Monitoring und zentralen Dashboard-Optionen am Edge geebnet. Dieser revolutionäre Ansatz bietet wertvolle Einblicke in den Energieverbrauch von Geräten und Workloads und stellt einen entscheidenden Wandel im Bereich der Energie-Überwachung dar.

## Revolutioniertes Remote-Monitoring

Kepler-Metriken bieten umfassende Einblicke in den Energieverbrauch und ermöglichen den Nutzern detaillierte Analysen. Der Umstieg vom Prometheus- auf den OTLP-Exporter vereinfacht den Prozess, indem er den umfangreichen, auf Prometheus basierenden Observability Stack eliminiert. Die OTLP-Exporter von Kepler, die auf Edge-Geräten betrieben werden, erleichtern die zentrale Metriksammlung und läuten eine neue Ära des effizienten Energie- und Leistungsmonitorings ein.

## Die Kraft der Zentralisierung von Dashboards

Die Zentralisierung von Dashboards ist ein Grundpfeiler dieses Paradigmenwechsels. Mit Edge-Geräten, die an verschiedenen Standorten betrieben werden, wird ein zentrales Dashboard unverzichtbar. Es bietet einen einheitlichen Überblick über alle überwachten Parameter, gewährleistet nahtloses Monitoring und identifiziert arbeitsintensive Anwendungen und/oder Geräte mit hohem Energieverbrauch. Die Zentralisierung von Dashboards stellt sicher, dass Einblicke in den Energieverbrauch von Geräten und Workloads jederzeit verfügbar sind, was eine zeitnahe Entscheidungsfindung und proaktive Problemlösung ermöglicht.

## Die Kraft von OpenTelemetry

OpenTelemetry zu nutzen ist kein Trend, sondern eine Notwendigkeit. Dieser offene Standard für Observability gewährleistet anbieterneutrale Instrumentierung, Sammlung und Export von Telemetriedaten. Die Flexibilität, Konsistenz und das wachsende Ökosystem von OpenTelemetry, zusammen mit der Unterstützung durch führende Observability-Anbieter, machen es zur bevorzugten Wahl für moderne Anwendungen.

<p class="mt-5 mb-5"><img src="/images/blogs/2023-09-cloud-native-sustainability-week/KEPLER-OTEL.webp" alt="Illustration, wie Kepler mit OpenTelemetry-Komponenten integriert wird"></p>

## Die architektonische Brillanz von Kepler

Die Architektur von Kepler erfasst effizient Metriken auf Pod-/Container-/Prozessebene. Der OTEL-Collector fungiert als Vermittler, verarbeitet und leitet Daten an Ziele weiter. Durch die Nutzung von Prometheus als Backend, kombiniert mit der Leistungsfähigkeit von Grafana, wird Rohdaten in aussagekräftige Visualisierungen umgewandelt. Diese Synergie bietet ein nahtloses Erlebnis und ermöglicht es den Nutzern, komplexe Daten mühelos zu verstehen.

Abschließend lässt sich sagen, dass Kepler zusammen mit OpenTelemetry und seinem Fokus auf Edge Computing einen bedeutenden Sprung im Bereich der Leistungsüberwachung darstellt. Folgen Sie [diesem Link](https://github.com/husky-parul/otel-observability) für die Bereitstellungsschritte. Bleiben Sie dran für weitere Updates zur [Instrumentation des Kepler OTEL SDK](https://github.com/sustainable-computing-io/kepler/issues/659).

Referenz: [Hybrid Cloud Patterns](https://hybrid-cloud-patterns.io/learn/about/)
