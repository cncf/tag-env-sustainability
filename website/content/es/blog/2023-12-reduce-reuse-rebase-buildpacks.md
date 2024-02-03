---
title: "Reducir, Reusar, Reemplazar: Contenedores sostenibles con Buildpacks"
description: Buildpacks son un solución amigable con el medio ambiente para construir contenedores
slug: 2023-12-reduce-reuse-rebase-buildpacks
weight: 1
date:   2023-12-19 00:00:00 +0000
author: Joe Kutner
---

<!-- cSpell:ignore buildpacks, buildpack -->
La construcción de contenedores puede ser desmedido. Cada actualización en el sistema operativo, nueva versión de dependencias y actualización de la cadena de herramientas (toolchain) resulta en una cantidad copiosa de energía usada para construir y reconstruir nuestras imágenes para los contenedores; a menudo innecesarias. Puede ser costoso a gran escala, por lo que Cloud Native Buildpacks fueron diseñados para realizar builds completos solo cuando un rebuild es realmente requerida.

Buildpacks transforman el código fuente en imágenes para contenedores. Pueden ser usados con o sin Docker para encapsular patrones comúnes en todos los builds, lo que hace la conteinerización más fácil y consistente para desarrolladores de aplicaciones. Buildpacks también provee caché avanzado y mecanismos de parchado para hacerlo una opción más amigables con el medio ambiente para la construcción de contenedores. En ciertos casos, Los Buildpacks previenen que muchas imágenes sean reconstruidas totalmente. Se trata de un gran cambio con respecto a otras tecnologías Cloud Native que pueden suponer que hay disponibles recursos limitados en la nube.

<p class="mt-5 mb-5"><img src="/images/blogs/2023-12-reduce-reuse-rebase-buildpacks/cnb-green-logo.png" alt="CNB logo with recycling"></p>

## Sobre el impacto ambiental de Cloud Native

Previo a la aparición del ecosistema de Cloud Native y al uso generalizado de la imágenes para los contenedores, nuestras apliaciones se desplegaban en servidores construidos a partir de _machine images_ que eran actualizadas con poca frecuencia y en una cadencia distinta que la de las aplicaciones.

Hoy día, muchas aplicaciones están acopladas al sistema operativo y sus paquetes dado a que usan un `Dockerfile` para definir sus imágenes. Como resultado, esas imagenes necesitan de reconstrucción frecuentemente para aplicar parches a los componentes a nivel de Sistema Operativo o simplemente, para actualizar las herramientas que ni siquiera son usadas por las aplicaciones. Peor, el mecanismo encargado del caché de las capas impuesto por el `Dockerfile` nos forza a reconstruir las capas que no necesitan ser reconstruidas.

El ecosistema cloud-native ha aportado productividad y mejoras operacionales al desarrollo de software. Pero hemos perdido de vista el desperdicio que esas tecnologías puede generar. Buildpacks, por otro lado, han sido diseñados para trabajar a gran escala (decenas de millones de imágenes) donde generar desperdicio tiene un costo real. Es por eso que los Buildpacks implementan mecanismos que requieren recursos mínimos.

## Reducir, Reusar, Reemplazar

Las imágenes de contenedores construidas a partir de un `Dockerfile` requieren una construcción completa cuando una nueva actualización del sistema opeartivo se encuentra disponible, incluso si tu aplicación no necesita una recompilación o reinstalación para ser compatible con la actualización (Por ejemplo, la actualización es [compatible con ABI]([https://](https://es.wikipedia.org/wiki/Interfaz_binaria_de_aplicaciones)). Este no es el caso cuando se usa Buildpacks.

Cuando una imágen base del sistema opeartivo se encuentra disponible para una imagen generada a través de un _buildpack_, las capas existentes que se posan sobre el sistema operativo son reusadas. Este proceso, ilustrado abajo, se le conoce como _rebasing_ o reconstrucción de la base. Las capas de la aplicación, con el mismo SHA, pueden ser posicionadas sobre las capas del nuevo sistema operativo. 

<p class="mt-5 mb-5"><img src="/images/blogs/2023-12-reduce-reuse-rebase-buildpacks/cnb-new-base.png" alt="Updating the operating system of a container image requires a rebuild if you're using Dockerfile"></p>

<p class="mt-5 mb-5"><img src="/images/blogs/2023-12-reduce-reuse-rebase-buildpacks/cnb-rebase.png" alt="Buildpacks rebase constructs a new container image using existing layers, without the need for build"></p>

El proceso que Buildpacks usa para _rebase_ en imágenes finalmente usa tanto capas existentes como nuevas capas de sistema opeartivo, sin necesidad de hacer una construcción. En esencia, _rebasing_ es un proceso simple. Inspeccionando una imágen de una aplicación, el proceso de _rebase_ puede determinar si se necesita o no una nueva versión base de la imagen de la aplicación existente (sea local o de un _registry_). Si una nueva versión existe, el proceso de _rebase_ actualiza la metadata de las capas de la aplicación para hacer referencia a una nueva versión de la imagen base. Esto es esencialmente una operación que edita un archivo JSON. Toma unos milisegundos y usa pocos recursos computacionales.

El proceso _rebase_ permite a desarrolladores de aplicaciones u operadores la actualización rápida de la imagen de sus aplicaciones cuando su imagen de ejecución haya cambiado. Usando el proceso de reconstrucción o _rebasing_ de capas, este comando evita una reconstrucción completa de la aplicación.

Puedes [aprender más del proceso rebase en la documentación de Buildpacks](https://buildpacks.io/docs/concepts/operations/rebase/). Pero _rebase_ no es el único mecanismo que es más sostenible que la construcción a través de un `Dockerfile`. Buildpacks pueden poner en caché artefactos para la construcción lo cuál habilita una compilación incremental y otras técnicas de ahorro. Estas capas puestas en caché no siempre se descartarán cuando sea necesario reconstruirlas, com lo harían las compilaciones hechas usando un `Dockerfile`

## Be As Green As Your Unit Tests

Container builds are not the biggest offender when it comes to the environmental impact of software. Electricity needed to mine bitcoin is [more than used by entire countries](https://www.theguardian.com/technology/2021/feb/27/bitcoin-mining-electricity-use-environmental-impact), but the growth of software that uses cryptographic techniques has brought new awareness to how our code affects the world around us. That's a good thing.

We have a responsibility to think about minimizing the required resources of the software we produce. The code we write has an impact on the world, and our choices matter.

To learn more about the relationship between open source software development and the environment, visit the [Environmental Sustainability Technical Advisory Group (TAG)](https://tag-env-sustainability.cncf.io/)
