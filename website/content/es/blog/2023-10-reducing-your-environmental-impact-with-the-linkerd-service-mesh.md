---
title: Reduciendo tu impacto ambiental con la service mesh Linkerd
description: Linkerd siempre se ha centrado en tener la menor huella de recursos posible. Esto la convierte no sólo en la service mesh más eficiente y rentable del mercado, sino también en la más sostenible. Esto se debe a que Linkerd ayuda a minimizar las emisiones en varios niveles.
slug: 2023-reducing-env-impact-with-linkerd
weight: 1
date:   2023-10-10 00:00:00 +0000
author: Catherine Paganini
---
*Publicación de invitado como parte del [cloud native sustainability week](https://tag-env-sustainability.cncf.io/cloud-native-sustainability-week/)*

En el complejo mundo de las service mesh, Linkerd es conocido por su simplicidad. Pero Linkerd también se ha centrado en tener la menor huella de recursos posible desde sus inicios. Esto la convierte no sólo en la service mesh más eficiente y rentable del mercado, sino también en la más sostenible. De hecho, debido a su inteligente balanceo de carga, agregar Linkerd a tu stack puede reducir la huella general de recursos de tu sistema en conjunto. ¿Demasiado bueno para ser verdad? Parece que sí, pero en realidad si funciona.

## Consumo de recursos, un buen proxy para el impacto ambiental

Desafortunadamente, la sostenibilidad sigue siendo una idea tardía cuando se trata de sistemas informáticos. Es por eso que estamos encantados de ver que el TAG para Environmental Sustainability arroja luz sobre este importante tema e impulsa el cambio. Esta falta de enfoque también significa que todavía no tenemos una forma realmente precisa de medir el impacto ambiental de nuestros sistemas. Sin embargo, existe un buen indicador para eso: el consumo de recursos. En términos generales, cuantos más recursos consuma tu sistema, mayor será el impacto ambiental.

## Linkerd un micro-proxy basado en Rust

Casi todas las service mesh, excepto Linkerd, utilizan el proxy Envoy - un potente proxy que puede hacer mucho más de lo que necesita una service mesh. Si bien Envoy es un gran proyecto, usando proxy de uso general para un caso de uso muy limitado, como service mesh, es muy ineficiente.

Linkerd adoptó un enfoque diferente. Es la service mesh con un [micro-proxy escrito en Rust para proposito específico](https://linkerd.io/2020/12/03/why-linkerd-doesnt-use-envoy/). Fue diseñado específicamente para casos de uso de service mesh y, debido a que la gama de características necesarias es muy específica, el proxy Linkerd es el proxy de service mesh más pequeño y más eficiente en recursos.

Utiliza solo una [décima parte de los recursos (CPU y memoria) que utiliza Envoy](https://linkerd.io/2021/11/29/linkerd-vs-istio-benchmarks-2021/index.html). (While "sidecar-less" service meshes exist, they work by deploying larger, per-host proxies and come with significant security and operational caveats — see our writeup on [eBPF, sidecars, and the future of the service mesh]

Si bien existen service mesh "sin sidecar", funcionan mediante la implementación de proxies más grandes por host y vienen con importantes limitantes operativas y de seguridad; consulte nuestro artículo sobre [eBPF, sidecars y el futuro de la service mesh](https://buoyant.io/blog/ebpf-sidecars-and-the-future-of-the-service-mesh)).  

## ¿Software adicional = mayor huella de recursos? No necesariamente

Cada software adicional se traduce en consumir más recursos del sistema, ¿verdad? En teoría, sí, pero si te ayuda a ejecutar tu sistema de manera más eficiente, en realidad puede reducir su huella.

El impacto ambiental de agregar características como zero-config e in-transit encryption (mTLS), proporcionadas por Linkerd, no es cero; ningún software lo es. Si se piensa que el costo ambiental (y financiero) es viable o razonable es una discusión diferente. Quizás te sorprenda saber que Linkerd puede minimizar su impacto incluso en comparación con ninguna red de servicios. Esta ganancia de eficiencia se debe al inteligente load balancing de Linkerd. Demos un paso atrás y examinemos primero cómo funciona Kubernetes.

## La distribución de trabajo mejora con Linkerd sobre Kubernetes nativo

Kubernetes nos permite empaquetar procesos de manera más densa en las computadoras. Los servidores tienen cierta capacidad para trabajar, pero siempre hay una brecha entre la cantidad de trabajo que *pueden* hacer y la cantidad que el sistema les pide que hagan. Kubernetes programa trabajo de manera más eficiente en servidores existentes (empaquetado de contenedores), lo que nos permite ejecutar más cosas en el mismo hardware: ¡una gran victoria!

Linkerd mejora aún más esas ganancias de eficiencia al adoptar un enfoque diferente para la selección de terminales. Mientras que Kubernetes equilibra su carga en función de las conexiones, Linkerd lo hace en función de las solicitudes. Como resultado, Linkerd te ahorra importantes recursos de computo. Analicemos eso.

En el viejo mundo, las aplicaciones establecían una conexión, enviaban una solicitud, obtenían una respuesta y cerraban esa conexión, lo que no era muy eficiente cuando había cientos o miles de solicitudes por minuto. Hoy en día, HTTP/2 y gRPC establecen una conexión una vez y envían múltiples solicitudes para evitar esta ineficiencia.

Sin embargo, Kubernetes no maneja eso de manera inmediata. De forma nativa, Kubernetes simplemente dirige la conexión entera a un Pod y no se preocupa por cuántas solicitudes llegan a través de la conexión. Esto puede ser problemático: si está ejecutando 10 Pods para una carga de trabajo particular y 50 solicitudes provienen de una sola conexión, Kubernetes enviará las 50 al mismo Pod. En el mejor de los casos, los otros nueve Pods simplemente permanecen inactivos; en el peor de los casos, el Pod que hace todo el trabajo no estaba dimensionado para esta carga pico y falla.
<!-- cSpell:ignore Hightower -->
Esta ineficiencia se debe a que Kubernetes no fue diseñado para mirar dentro de la conexión y descifrar cada solicitud; hacerlo requiere mucho conocimiento de qué protocolo exacto se está hablando y está fuera del alcance del propio Kubernetes. Como dijo Kelsey Hightower: "[Kubernetes es una plataforma para construir plataformas](https://twitter.com/kelseyhightower/status/935252923721793536)" - Kubernetes nunca tuvo la intención de resolver ese problema en particular, ya que otros proyectos sí podrían hacerlo.

## Minimizar los recursos inutilizables

Imagina que quieres llenar una caja con piedras. Cuanto más pequeñas son las rocas, menos espacio se desperdicia (espacios de aire entre las rocas). Lo mismo se aplica a los Pods: el dimensionamiento según la demanda máxima tiende a dejar cantidades mucho mayores de capacidad sin utilizar, lo que requiere más Pods y te cuesta dinero. Permitir dimensionar los Pods según la demanda promedio en lugar de la demanda máxima aprovecha más sus recursos existentes al no obligarlo a reservar capacidad no utilizada, lo que mejora su escalabilidad horizontal al permitirle ejecutar más pequeños Pods durante las cargas pico.

<!-- cSpell:ignore Entain -->
Esto significa que bajo carga, Linkerd puede distribuir el tráfico entre Pods de manera mucho más efectiva ya que *hace* el trabajo de comprender el protocolo y equilibrar la carga de las solicitudes individuales. Esto le permite asignar menos recursos de computo a cada Pod porque sabe que la carga se distribuirá equitativamente y, por lo tanto, no tiene que dedicar grandes cantidades de recursos a la posibilidad de que se produzcan grandes picos. Por ejemplo, Entain Australia, una empresa de apuestas deportivas, escribió un excelente [caso de uso de CNCF sobre cómo Linkerd les ayudó a reducir significativamente la latencia y el costo](https://www.cncf.io/case-studies/entain/) gracias a sistemas inteligentes balanceo de carga.

Este enfoque no solo ahorra más recursos y es más amigable con el medio ambiente, sino que las solicitudes también se procesan más rápido porque no queden atrapadas en una cola de pods sobrecargada. Y dado que Linkerd intenta deliberadamente elegir Pods de baja latencia, la experiencia general del usuario puede ser mejor ya que se reduce la latencia general.

## Simplicidad = sostenibilidad

Como hemos visto, Linkerd puede ayudarle a minimizar su huella de recursos de varias maneras. En primer lugar, su pequeño microproxy en Rust lo hace diez veces más eficiente en recursos que las alternativas basadas en Envoy (básicamente cualquier otra service mesh). Gracias a su balanceo de carga inteligente, puede mejorar el uso general de recursos en comparación con el uso sin una service mesh. Si bien el equipo de Linkerd no se propuso construir la service mesh más sostenible del mercado, nuestro[enfoque en la simplicidad y la eficiencia de los recursos](https://linkerd.io/design-principles/) lo logró. Sin duda, la sostenibilidad es un área importante que finalmente está recibiendo más atención. Estamos orgullosos de que nuestros principios de diseño se alineen bien con la misión del TAG Environmental Sustainability, incluso si fue más accidental que planeado.

*Gracias a Jason Morgan y Flynn por guiarme en todo. Aprendí mucho y espero que los lectores también lo hagan.*
