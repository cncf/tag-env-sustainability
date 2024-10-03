---
title: "Green Reviews Working Group: Moving towards measuring the sustainability footprint of CNCF projects"
description: "In this blog post we will take a look at how the Green Reviews Working Group is contributing to moving towards continuously measuring the sustainability footprint of CNCF projects"
slug: 2024-green-reviews-working-group-measuring-sustainability
weight: 1
date:   2024-03-15 10:00:00 +0000
author: Antonio di Turi, Imma Valls, Kristina Devochko, Leonard Pahlke, Niki Manoledaki, Ross Fairbanks
---

## 介绍Green Reviews工作组及其使命

由于对云服务的需求不断增长，云计算对环境的影响越来越大，尤其是在生成人工智能（GenAI）等资源密集型应用中。为了识别和解决云原生和开源领域的环境可持续性挑战，一些云原生社区成员成立了一个环境可持续性技术咨询小组（TAG ENV），该小组在云原生计算基金会（CNCF）下运作。您可以在我们的[网站](https://tag-env-sustainability.cncf.io)上了解更多关于TAG ENV的信息.

TAG ENV为范围更窄的活动创建了被称为工作组的小组。目前，有两个工作组（WG）在TAG ENV下运作，其中一个是**Green Reviews WG**，我们将在本博客文章中对此进行介绍。Green Reviews WG制作的源代码、文档和其他相关内容可在以下GitHub存储库中获得：https://github.com/cncf-tags/green-reviews-tooling.

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/tag-working-groups.webp" alt="Overview of active Working Groups under CNCF TAG Environmental Sustainability"></p>

**[Green Reviews WG](https://github.com/cncf/tag-env-sustainability/tree/main/working-groups/green-reviews)**旨在评估CNCF项目的环境可持续性足迹，并就如何随着时间的推移降低足迹提供指导和建议。通过提供一个框架来收集这类与可持续性相关的见解，并将这些数据公开用于所有CNCF项目，我们正在为不断改善CNCF景观的整体生态足迹做出贡献。[Green Reviews WG 章程](https://github.com/cncf/tag-env-sustainability/blob/main/working-groups/green-reviews/charter.md)进一步拓宽了工作组的使命和愿景。
 
通过评估CNCF项目的环境可持续性足迹，工作组旨在提高项目维护者对其项目可持续性态势的认识，并为其提供有意义的见解。此外，工作组试图为项目维护者提供指导支柱，使其能够做出明智的决定，从而改善其项目在每次新发布时的可持续性状况。

最后，我们相信这些数据也将有助于CNCF项目的最终用户和采用者，并有助于在云原生和开源领域提高对环境可持续性的更广泛认识。

## 将Green Reviews WG的目标付诸行动

衡量软件的可持续性足迹并非易事。我们的愿景是，Green Reviews WG将计算每个要求可持续性足迹评估的CNCF项目版本的可持续性数据。为了实现这一愿景，我们的目标是开发一个可以与其他CNCF项目的现有软件生命周期很好地集成的工作流。为了实现这一目标，我们正在创建一个用于执行可持续性评估的自动化工作流。这是WG在2024年第一季度在KubeCon + CloudNativeCon Europe 2024的筹备阶段完成的主要目标[里程碑](https://github.com/cncf-tags/green-reviews-tooling/milestone/1)。该里程碑可以在项目存储库以及[路线图](https://github.com/cncf-tags/green-reviews-tooling?tab=readme-ov-file#roadmap)中找到。

为了实现这一目标，WG需要与CNCF项目密切合作。这是为了确保正确的软件在正确的平台上运行，并具有现实的测试用例，并满足所有技术要求。在这方面，值得一提的是WG和CNCF项目之间的责任分工，要求进行评估。更多详细信息可以在 **[Green Review WG Charter](https://github.com/cncf/tag-env-sustainability/blob/main/working-groups/green-reviews/charter.md)**中找到。

工作组将负责建立基础设施，包括执行可持续性足迹评估所需的所有硬件和软件。它还将负责定义和计算评估CNCF项目环境可持续性足迹所需的指标。

另一方面，CNCF项目将负责提供在Green Reviews WG技术平台上安装软件所需的配置。他们还需要提供WG将用于对各个项目进行基准测试的用例。

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/separation-responsabilities-cncf-projects-green-reviews-wg.webp" alt="Separation of responsabilities CNCF projects Green Reviews WG"></p>

换句话说，WG为CNCF项目提供了一个技术平台，包括必要的底层基础设施和工具，以评估其可持续性足迹。这个过程需要大量的实验。我们希望确保计算出的指标尽可能可靠。在撰写这篇博客文章时，还没有关于如何进行软件可持续性足迹评估的既定定义/行业标准。WG的调查平衡了现有工具和方法的应用，以及应用部署的最佳实践，例如通过应用GitOps实践和工具以及平台自动化。

### 构建评估CNCF项目可持续性足迹的工作流程

实际了解WG正在设计的第一版工作流的一个好方法是看看下面的架构图：

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/green-reviews-wg-workflow-vision.webp" alt="Separation of responsabilities CNCF projects Green Reviews WG"></p>

WG的工作流愿景是，每个要求进行可持续性足迹评估的版本都将触发[Green Reviews repo](https://github.com/cncf-tags/green-reviews-tooling)中指定的Github Action，这将启动基准测试管道。该管道的工作是：

1. 加速 Equinix 金属资源
2. 安装 Kubernetes 和所有需要的可观察性工具
3. 安装将被评估的软件
4. 执行必要的测试用例
5. 收集与可持续发展相关的指标
6. 发布可持续发展指标

我们很高兴地分享我们的云基础设施现已全面投入使用。我们的 Kubernetes (k8s) 集群托管在社区实验室的 Equinix Metal 服务器上。该集群使用 GitOps 方法，使用 Flux 部署可观察性工具，如 Kepler、Prometheus 和 Grafana。我们的基础设施设置记录在 [这里](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/infrastructure/about.md)。这些对于进行可持续性足迹评估至关重要。特别是 [Kepler](https://github.com/sustainable-computing-io/kepler)，它是一个 CNCF 项目，使用 eBPF 和 RAPL 在各种类型的云环境中提供准确的能源指标，从裸机到公共云中的 VM，并将其与 Pod 和其他 Kubernetes 资源相关联。

Flux 负责部署所有选定的可观察性工具和 CNCF 项目。在 GitHub Action 触发所有定义的使用案例后，Kepler 将生成能量指标并将其本地导出到 Prometheus。

### 可持续性指标和软件碳强度规范

该基础设施用于生成初始数据，以使用 [软件碳强度](https://learn.greensoftware.foundation/measurement#software-carbon-intensity-specification) (SCI)规范计算 Falco 的碳强度，该规范是由 [绿色软件基金会](https://greensoftware.foundation/)开发的即将成为 [ISO 标准](https://www.iso.org/standard/86612.html)的标准。该仪表板展示了 SCI 因素，如 Falco 的能耗、Equinix 地理位置的碳排放以及软件运行所依赖的硬件的嵌入式碳。该仪表板是一个公共的 Grafana 仪表板，表明我们对透明度和持续改进的承诺。

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/sci-grafana-dashboard.webp" alt="SCI index componentes Grafana dashboard"></p>

可持续性足迹指标不限于 SCI 规范，但我们将其作为北极星。这是一个展示其云原生参考架构的机会。有关这些测量的更多信息，请参阅项目的 [文档](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/measurement/sci.md)。要访问公共 Grafana 实例并查看仪表板，请按照 [此处](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/infrastructure/about.md#monitoring) 的步骤进行操作。

在撰写这篇博客文章时，尚未确定发布可持续发展指标的目的地。[CNCF devstats](https://devstats.cncf.io/)正在讨论作为另一种可能公开此类数据的地方。

### 可持续发展足迹评估和基准测试管道的后续步骤

Kubernetes集群的持续运行引发了人们对该解决方案可持续性的质疑。一些决策是迫不得已做出的，比如使用裸机服务器来获取准确的能源指标。但随着技术平台工作的进展，新的问题不断出现。

在进行可持续性足迹评估时，我们能否按需创建节点，而不是一直运行节点？另一个改进机会是，目前，Falco总是被部署，内核总是被测试，我们希望在2024年欧洲KubeCon + CloudNativeCon之后进行改进，以便我们在管道本身中使用最少的能量。这些问题对WG的使命至关重要，我们期待着社区的建议和贡献。

此外，可持续性足迹评估本身将是我们在下一个里程碑中需要解决的事情。WG的目标是使可持续性足迹评估管道对CNCF项目维护者（如Falco维护者）有用。随着我们进入项目的“审查”阶段，我们将继续与各个项目维护者合作。这种可持续性足迹评估的灵感来自TAG Security的安全评估（TSSA）等流程，该流程已用于CNCF项目。有关Green Reviews WG和CNCF项目维护者之间合作的更多信息，请参阅[文档](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/cncf-projects/cncf-projects.md)。欢迎对项目评估感兴趣的CNCF项目维护者[在此处](https://github.com/cncf/tag-env-sustainability/issues/223)标记他们的兴趣！

请记住，在撰写这篇博客文章时，所描述的愿景中只有部分组件正在生产中。如果您想了解有关Green Reviews WG正在进行的最新工作状态的更多信息，请加入我们的社区 [Green Reviews WGSlack频道](https://cloud-native.slack.com/archives/C060EDHN431)或[TAG ENV Slack频道](https://cloud-native.slack.com/archives/C03F270PDU6)，或查看GitHub上的[文档](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs)。

## 回顾Green Reviews WG至今的历程

自2023年北美KubeCon + CloudNativeCon正式宣布以来，Green Reviews WG（WG）一直在云原生生态系统中推进可持续发展。

回顾工作组的进展，我们想分享迄今为止取得的里程碑：在合作努力中，我们完成了前**100+**提交，并成功解决了前**10+**问题。该组的GitHub存储库正在逐步形成，这得益于参与讨论和获得动力，特别是与Falco项目团队进行的第一次合作，这将是在WG技术平台的帮助下进行可持续性足迹评估的CNCF试点项目。

在过去的几个月里，工作组面临着许多挑战：我们必须并行保持多个流，并确保持续的进展：设计工作流程，建立基础设施，根据定义的要求安装、配置和运行 Falco，以及决定计算可持续性指标的框架。

最近的里程碑更难，因为我们必须在解决方案的可扩展性与构建可复制的可持续性足迹评估工作流程的实际需求之间取得平衡。该项目还非常年轻，我们必须学习如何以透明、开源的方式最好地协作和记录每一步。

Falco项目也具有挑战性，因为许多WG贡献者并不熟悉这种安全软件的复杂性。确保Falco以正确的负载运行，特别是使用有意义的kernel_event_rate，是一项艰巨的任务，但幸运的是，Falco维护者和贡献者非常合作。

在 2024 年 KubeCon + CloudNativeCon 欧洲大会之前，WG 的目标是为社区提供可持续性足迹评估工作流程的第一个实现。在撰写这篇博文时，**版本 0.1** 已经启动并运行，但仍需要改进，包括：

- CNCF项目发布将触发的GitHub Actions工作流的定义；
- 按需配置 Equinix 服务器所需的步骤；
- 持续改进可持续发展指标的质量和数量；

请参阅 GitHub 上的 WG 的 [路线图](https://github.com/cncf-tags/green-reviews-tooling#roadmap)，了解未来的更新和增强。

## Green Reviews WG一直在寻找新的贡献者——请加入我们吧！💚

**Green Reviews WG**中正在进行的所有活动和交流都是透明的、公开的，并向所有人开放。该工作组完全由志愿者运营，并一直在寻找新的贡献者来帮助完成任务。我们总是有一些[“help wanted”标签的问题](https://github.com/cncf-tags/green-reviews-tooling/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22)，供大家捡起或配对！

如果您正在寻找在云原生可持续发展领域为项目提供技术贡献的方法，那么您来对地方了！我们的工作组是多元化和包容性的，我们很高兴欢迎所有想加入我们并为团队做出贡献的人。

有很多方法可以开始你的贡献者之旅。我们建议您查看下面的一些资源，这些资源应该提供足够的信息，帮助您开始阅读，如果您想进一步阅读。或者，您也可以参加我们的会议，与我们共同学习！

- 阅读博客[作为TAG环境可持续贡献者入门](https://tag-env-sustainability.cncf.io/blog/2023-getting-started-as-tag-env-contributor)。这是一份关于如何在TAG环境可持续性方面入门的通用指南，博客文章中提供的许多步骤也适用于绿色评论WG。
- 查看[Green Reviews WG章程](https://github.com/cncf/tag-env-sustainability/blob/main/working-groups/green-reviews/charter.md)。它概述了工作组的动机、范围、目标、非目标和交付成果。
- 阅读绿色评论工具 GitHub 存储库中的 [文档](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs)。
- 加入[CNCF Slack](https://slack.cncf.io)工作区中的WG Slack频道[#tag-env-wg-green-reviews](https://cloud-native.slack.com/archives/C060EDHN431)，并参加小组[会议](http://bit.ly/wg-green-reviews)。
- 查看工作组的积压，寻找适合初学者的问题，并查看[贡献指南](https://github.com/cncf-tags/green-reviews-tooling/blob/main/CONTRIBUTING.md)! 欢迎所有类型的贡献: 代码贡献、问题、对产品路线图等内容的建议、问题和文档。

**Green Reviews WG** 鼓励并欢迎任何人的贡献。如果你有想法，不要犹豫，通过提交[GitHub issue](https://github.com/cncf-tags/green-reviews-tooling/issues/new)或在Slack频道中发布来与小组分享。

我们正在经历一段激动人心的旅程，有许多合作、实验、研究、创新和边做边学的机会。我们一起努力，为更可持续的云原生和开源环境铺平道路，我们希望您从这篇博客中学到的知识能激励您加入我们的旅程！
