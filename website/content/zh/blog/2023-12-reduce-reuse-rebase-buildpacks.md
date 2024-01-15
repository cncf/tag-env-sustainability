---
title: 减少、重用、重置：使用Buildpacks构建可持续容器
description: 减少、重用、重置：使用Buildpacks构建可持续容器
slug: 2023-12-reduce-reuse-rebase-buildpacks
weight: 1
date:   2023-12-19 00:00:00 +0000
author: Joe Kutner
---

<!-- cSpell:ignore buildpacks,buildpack -->
容器构建可能非常浪费。每次操作系统更新、新的依赖版本和工具链升级都会消耗大量能源来构建和重建我们的容器镜像，通常是不必要的。在规模上会产生高昂的成本，这就是为什么 Cloud Native Buildpacks 的设计初衷是只在真正需要重新构建时才执行完整的构建。

Buildpacks 将应用程序源代码转换为容器镜像。它们可以与 Docker 一起使用，也可以不与 Docker 一起使用，以封装构建过程中的常见模式，使应用程序开发者更容易、更一致地进行容器化。Buildpacks 还提供高级缓存和修补机制，使它们成为容器构建的环保选择。在某些情况下，Buildpacks 可以防止许多镜像完全重新构建。这与其他云原生技术有很大区别，其他技术可能假设无限的云资源可供使用。

<p class="mt-5 mb-5"><img src="/images/blogs/2023-12-reduce-reuse-rebase-buildpacks/cnb-green-logo.png" alt="CNB logo with recycling"></p>

## 关于云原生对环境的影响

在云原生生态系统兴起和广泛使用容器镜像之前，我们将应用程序部署在由机器镜像构建的服务器上，这些服务器的更新频率与应用程序本身不同。

如今，许多应用程序与操作系统及其软件包耦合，因为它们使用 Dockerfile 来定义其容器镜像。因此，这些镜像经常需要重新构建，以应用补丁到操作系统级组件，或者仅仅是为了更新甚至未被应用程序使用的工具。更糟糕的是，Dockerfile 强制我们对不需要重新构建的层进行频繁的构建。

云原生生态系统为软件开发带来了极大的生产力和运营改进。但我们忽视了某些技术的浪费程度。而 Buildpacks 的设计目标是在规模上（即数千万个镜像）工作，其中浪费会产生实际成本。这就是为什么 Buildpacks 的重置机制所需的资源极少。

## 减少、重用、重置

通过 Dockerfile 构建的容器镜像，在有新操作系统更新可用时，即使你的应用程序不需要重新编译或重新安装以适应更新（即更新是[ABI 兼容](https://en.wikipedia.org/wiki/Application_binary_interface "ABI 兼容")），仍然需要进行完整的构建。但使用 Buildpacks 则不同。

当为由 Buildpack 生成的镜像提供了新的操作系统基础镜像时，可以重用已存在的位于操作系统之上的层。这个过程被称为重置，下图所示。应用程序层可以完全相同的 SHA，被提升到新的操作系统镜像层上。

<p class="mt-5 mb-5"><img src="/images/blogs/2023-12-reduce-reuse-rebase-buildpacks/cnb-new-base.png" alt="Updating the operating system of a container image requires a rebuild if you're using Dockerfile"></p>

<p class="mt-5 mb-5"><img src="/images/blogs/2023-12-reduce-reuse-rebase-buildpacks/cnb-rebase.png" alt="Buildpacks rebase constructs a new container image using existing layers, without the need for build"></p>

Buildpacks 的重置机制使用现有层和新的操作系统层构建了一个新的容器镜像，而无需进行构建。从根本上说，镜像重置是一个简单的过程。通过检查应用程序镜像，重置可以确定应用程序的基础镜像的较新版本是否存在（在本地或注册表中）。如果存在较新的版本，重置将更新应用程序镜像的层元数据，以引用较新的基础镜像版本。这实质上是一项编辑 JSON 文件的操作。它只需要毫秒级的时间，并使用极少的计算资源。

重置允许应用程序开发者或操作员在运行镜像发生变化时快速更新应用程序镜像。通过使用图像层的重置，这个命令避免了对应用程序进行完全重建的需要。

你可以在[Buildpacks 文档](https://buildpacks.io/docs/concepts/operations/rebase/ "Buildpacks 文档")中了解更多关于重置的内容。但重置并不是 Buildpacks 比 Dockerfile 构建更可持续的唯一机制。Buildpacks 还可以缓存构建产物，以实现增量编译和其他资源节约技术。这些缓存层在需要重新构建时不会像 `Dockerfile` 构建那样被丢弃。

## 与你的单元测试一样环保

在软件的环境影响方面，容器构建并不是最大的问题制造者。挖掘比特币所需的电力[超过了整个国家的用电量](https://www.theguardian.com/technology/2021/feb/27/bitcoin-mining-electricity-use-environmental-impact "超过了整个国家的用电量")，但使用加密技术的软件的增长为我们认识到我们的代码如何影响周围世界带来了新的意识。这是一件好事。

我们有责任考虑我们所生产软件所需的资源最小化。我们编写的代码对世界产生影响，我们的选择很重要。

要了解有关开源软件开发与环境之间的关系的更多信息，请访问[环境可持续性技术咨询组（TAG）](https://tag-env-sustainability.cncf.io/ "环境可持续性技术咨询组（TAG）")的网站。
