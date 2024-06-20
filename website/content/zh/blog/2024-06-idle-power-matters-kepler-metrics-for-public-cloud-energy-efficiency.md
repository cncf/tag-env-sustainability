---
title: "不要忽视闲置功率: Kepler的公有云能耗利用率指标"
description: "这篇博客文章旨在强调在公共云等多租户环境中闲置功率的影响及其在软件能源归属和核算方面的透明度需求和影响。"
slug: 2024-06-idle-power-matters-kepler-metrics-for-public-cloud-energy-efficiency
weight: 1
date:   2024-06-06 10:00:00 +0000
author: Sunyanan Choochotkaew, Marcelo Amaral, Huamin Chen
---

相较于负载直接产生的功率，空闲功率，通常包括开机功率和控制（管理）平面进程消耗的功率。在多个租户共享计算的公共云环境中，空闲功率的划分和归因是一项具有挑战性的工作。由于在最大利用率下空闲功率占节点总功率的比例可以达到20%到60%。这篇博客文章旨在强调透明、细粒度的能源指标的重要性，这些指标区分了公共云计算中软件能源归属中的闲置功率和动态（负载）功率。[Kepler](https://sustainable-computing.io)通过区分闲置功率和动态（负载）功率的做法和解决方案，在多个租户共享的公有云环境下实现了透明，细粒度能源指标，完成了这项挑战。

## 量化软件可持续性指标

根据国际能源署（[International Energy Agency (IEA)](https://www.iea.org/about)）在数据中心和数据网络传输（[Data Centres and Data Transmission Networks segment](https://www.iea.org/energy-system/buildings/data-centres-and-data-transmission-networks)）中的内容，据估计，2022年全球数据中心用电量约为全球最终电力需求的1-1.3%，过去几年的年增长率为20-40%。[EU Energy Efficiency Directive (EED)](https://energy.ec.europa.eu/topics/energy-efficiency/energy-efficiency-targets-directive-and-rules/energy-efficiency-directive_en)将要求装机容量大于500千瓦的欧盟数据中心从2024年5月起报告其总能耗。

绿色软件基金会（[Green Software Foundation (GSF)](https://greensoftware.foundation)）是一个是在Linux基金会下成立的一个非营利组织，尝试打造一个值得信赖的绿色软件建设生态系统。它为软件系统定义了一个计算碳排放率的新标准SCI[Software Carbon Intensity (SCI)](https://sci.greensoftware.foundation)。这个规范已经在2024年1季度纳入[ISO standard status](https://greensoftware.foundation/articles/sci-specification-achieves-iso-standard-status)这标志着绿色软件建设之旅中的一个重要里程碑。

Software Carbon Intensity计算基于一下公式：

<b>SCI = ((E * I) + M) per R</b>

名词解释（给出英文原文供参考）：

- E – 软件所消耗的能源/Energy consumed by a software system
- I - 区域特定碳强度/region-specific carbon Intensity
- M – 操作系硬件系统的具体碳排放/embodied eMissions of the hardware needed to operate a software system
- R – 功能单元，参考对比的基础单元/functional unit,  a Reference unit for comparison.

该标准允许使用细粒度数据。这种类型的数据可以包括数据中心、单个机器（例如，VM/节点）、单个服务（例如，API调用或ML训练运行）、执行包（例如，pod或容器）或单个进程的信息。

能耗表示一段时间内的累计用电量。关于虚拟机多租户环境的功率计算，[Greenhouse Gas Protocol (GHG)](https://ghgprotocol.org)提供了以下具体指南：

<b> P(vm) = U(vm) ⋅ Size(vm) ⋅ P(dyn) + P(base)/n </b>

> 这个公式参考了[ICT Sector Guidance built on the GHG Protocol Product Life Cycle Accounting and Reporting Standard](https://ghgprotocol.org/sites/default/files/2023-03/GHGP-ICTSG%20-%20ALL%20Chapters.pdf)`6-34页的内容。

名词解释（给出英文原文供参考）：
- P(vm) - VM的用电量/power consumption of the VM
- U(vm) - VM的利用率/utilization of the VM
- Size(vm) - VM的大小/size of the VM
- P(dyn) - 设备的动态能耗/dynamic power range of the device
- P(base) - 系统的空闲/基础/开机能耗/Idle, or base, power consumption is when the VMM is operating but no VMs are executed on the system
- n - VM的数量/the number of VMs running on the server

为了实现更环保的软件，我们需要在应用程序的设计、开发和交付过程中降低功耗和SCI（Software Carbon Intensity）分数。

## 空闲功率：隐藏在公有云下的能耗

在2019年，[RightScale's survey](https://resources.flexera.com/web/media/documents/rightscale-2019-state-of-the-cloud-report-from-flexera.pdf)的调研中显示，在800家组织中，超过94%的组织已经采用了云计算，31%的组织优先考虑公共云，54%的组织计划在12个月内将其工作负载迁移到公共云，以提高资源效率。[Accenture's report in 2020](https://newsroom.accenture.com/news/2020/cloud-migrations-can-reduce-co2-emissions-by-nearly-60-million-tons-a-year-according-to-new-research-from-accenture)强调公共云迁移可以大幅减少碳排放（高达84%）和能源消耗（高达64%）。

公共云作为多租户环境运行，用户在其中购买在众多用户之间共享的计算资源。各种工具，如[CodeCarbon](https://codecarbon.io)，[CarbonTracker](https://carbontracker.org)，[Scapphandre](https://github.com/hubblo-org/scaphandre)，和[Kepler](https://sustainable-computing.io)，可用于估计与代码执行包装或实时资源利用率观察相关联的能源消耗和碳排放。

然而，确定如何将功耗归因于基础设施服务仍然具有挑战性。GSF的SCI标准规定，能源消耗应包括保留或供应的硬件消耗的所有能源，而不仅仅是应用程序运行时使用的硬件。这包括空闲功率，不仅包括静态功率，还包括应用程序运行所需的功能项目（如kubelet或控制平面）所消耗的能量。

根据[SPECpower基准](https://www.spec.org/power_ssj2008/)，活动空闲功耗可以变化很大，在最大利用率下功耗的20%到60%之间。从绝对值来看，这从100瓦到1300瓦不等，相当于一个家庭中经典灯泡或空调的功耗（尽管碳排放存在差异）。当考虑GPU功耗时，空闲功率可能甚至更高。

## 空闲功率审计和透明度的重要性

空闲功率和动态功率之间的区别在研究文献中得到了广泛的研究[1](https://ieeexplore.ieee.org/document/9139675). 大多数当前用于测量应用程序功耗的工具往往忽略了这一区别。将空闲功率与动态功率隔离是至关重要的，原因包括将功耗公平地归因于应用程序，并帮助创建更准确的功率模型。

动态能源消耗与资源使用直接相关。另一方面，空闲功率是与资源利用率无关的基本功耗。使用资源利用率来估计功耗的功率模型将仅准确地反映动态功率。空闲功率是一种恒定的功耗，必须归因于所有正在运行的应用程序。

为了说明公平分配闲置能源的想法，可以想象一种共管公寓，业主无论是否使用自己的房屋，都要向房主协会（HOA）支付费用。公寓中较大的家庭可能会支付更高的费用，就像分配了更多资源的虚拟机或具有更多进程的应用程序应该承担更大比例的闲置电力使用一样。

Kepler通过对闲置和动态能源的仔细跟踪，促进了电力使用的更公平分配，并完善了电力消耗模型。在Kepler中，空闲功率和动态功率消耗的总和被称为绝对功率消耗。

为了进一步说明闲置电力归属中透明度的重要性，请参阅以下示例`按资源请求`参考[OpenCost规范](https://www.opencost.io/docs/specification)其中工作负载成本是通过“最大（请求，使用）”来计算的。

<p class="mt-5 mb-5"><img src="/images/blogs/2024-06-idle-power-matters-kepler-metrics-for-public-cloud-energy-efficiency/idle_power_blog_example.webp" alt="Example of Power Attribution in Multi-tenant Environments"></p>

假设我们有一个16核服务器X的线性功率模型的服务器，由一个简单的公式描述，如下所示，其中Idle=200，Coeff=8：

<b>Power Consumption (P) = Idle Power (Idle) + Dynamic Power Consuming Factor (Coeff) * Resource Utilization (x)</b>
<b>能耗 (P) = 空闲功率 (Idle) + 负载功率因子(Coeff) * 资源利用率(x)</b>

让我们来分析一下上图所示的估计能耗。我们将考虑一个服务器托管两个客户端或应用程序，它们请求相同数量的资源，但在各种场景中使用它们的方式不同。我们还将检查一个只有一个客户端的场景进行比较。

- 情况1: 两个客户请求并使用了相同数量的资源

> 在第一种情况下，客户端A和客户端B都使用节点CPU的10%（因此每个客户端使用总利用率的50%），节点的总功耗为360W。由于两个客户端使用和请求的资源量相同，因此任何能源消耗分配都是公平的。然后，使用每个客户端的资源消耗的分数（50%）并乘以绝对能量消耗，将180W与每个客户端相关联。

- 情况2: 一名客户被调离

> 在第二种情况下，客户端B被调离，将客户端A单独留在服务器上。这里，总节点功率为280W，完全分配给客户端A。该功率基于功率模型，其中空闲功率为200W。如第一种情况所示，使用20%节点CPU的两个应用程序的负载功率为160W，这意味着每个客户端的负载功耗为80W。因此，由于客户端A在第二种情况下仍消耗10%的CPU，因此其负载功耗保持在80W。

- 情况3: 资源利用率更高的新客户

> 现在考虑第三种资源利用率不均衡的情况：客户端A仍然使用10%的CPU，但客户端B现在使用节点40%的CPU。如果我们只使用节点的绝对功耗600W，客户端B 80%的资源利用率导致总功耗为480W其中客户端A占120W。但是，如果我们隔离200W的空闲能耗，客户端B的功耗将为420W（320W用于负载+100W用于空闲能耗），而客户端A的能耗将为180W（80W用于负载，因为它仍使用10%的CPU+100W作为空闲能耗）。

- 情况四: 资源利用率较低的新客户

> 情况四与第三种情况类似，但客户B使用的资源比客户A少，这进一步说明了闲置功率分配不公平的可能性。

在第三种情况下，隔离闲置电源可以增强可预测性和清晰度。该方法划分恒定功率（不受资源使用的影响），并仅根据资源使用情况定义动态功率。具体来说，根据功率模型，客户端A的负载功率为80W。通过基于资源比率和绝对功率来分配空闲功率，客户端A获得40W的空闲功率，而客户端B获得160W的空闲电力。绝对功率而言，客户端A仅接收到40W的空闲功率，而客户端B具有160W的空闲功率。

这些闲置功率的不平等分布凸显了不公平，因为闲置功率消耗与资源利用率无关。基于资源请求应用功耗比率并不能准确地反映与实际资源利用率相对应的实际动态功耗。

仅仅基于资源利用率，很难证明向一个客户端提供比另一个客户端更多的空闲功率是合理的。空闲功率的公平分配可以考虑应用程序的大小，也可以在所有应用程序之间均匀地分配空闲功率成本。

**译者注：**
我们不妨假设用户A的能耗恒定为80w的负载能耗，然后考察在情况1～4中，不同空闲功率计算方式对于用户A总能耗的影响。

## 估算闲置功率的挑战

既然我们了解了隔离和报告空闲功率的重要性，让我们深入研究Kepler如何应对估计空闲功率的挑战，尤其是在某些信息（如共处一地的虚拟机数量）可能被掩盖的云环境中。

在裸机上，当服务器利用率接近零时，我们可以通过识别功耗的最小点来估计空闲功率[2，3]。然而，我们计划通过回归分析来扩展这个模型，以发现繁忙系统中的空闲功率。

由于未知的物理规格和租户（VM）数量，估计虚拟专用云中的空闲功率是一项挑战。为了解决这个问题，我们开发了一个训练框架，专注于单独提取和训练动态功率模型。这种方法减少了对未知因素的依赖，并增强了虚拟机的节能优化[4](https://www.computer.org/csdl/proceedings-article/mascots/2023/10387542/1TKR5vzaWXe).

正如我们在上一篇博客文章中所讨论的那样[5](https://www.cncf.io/blog/2023/10/11/exploring-keplers-potentials-unveiling-cloud-application-power-consumption/)，我们禁用了在虚拟机上运行的容器的空闲电源。我们仍然需要解决闲置电力的归属和核算问题。为了找到平衡，我们正在开发一种基于有限信息估计虚拟机空闲功率的方法，特别是在物理核心固定到虚拟核心而没有过度规划并且虚拟机模拟相同CPU架构的情况下。对于这些，我们可以使用在类似CPU架构上训练的功率模型来基于内核计数来估计VM空闲功率。例如，如果我们的64个核的模型预测空闲功率为160W，那么具有8个虚拟核的VM将估计大约20W（即160/8）。

然而，需要注意的是，如示例的情况2所示，在不了解所有共享租户所请求的资源的情况下，云浪费可能仍无法在用户级别得到充分考虑。

## 结论

用户层面的完全能耗核算仍然是一个挑战，需要在行业内进行进一步的研究和合作。公共云效率的透明、细粒度的能源指标十分重要，需要解决诸如空闲功率归属和估计等挑战。Kepler这样的工具为可持续的云计算实践铺平了道路。

### 收获

- SCI标准量化了软件系统的碳排放率，并促进了可持续性的细粒度数据使用。从业者之间的合作对于在软件设计、开发和交付过程中集体降低SCI指标至关重要。

- 透明的能源指标，如Kepler提供的每个功能单元的闲置和动态功率，对于促进可持续和节能的云计算实践至关重要。

- 尽管取得了进展，但仍存在一些问题，需要在行业内进行进一步的研究和合作。

## 采取行动

- <b>阅读[Green Software](https://learn.greensoftware.foundation)的相关资料</b>
- <b>探索和尝试[Kepler](https://sustainable-computing.io)</b>
- <b>加入CNCF Slack [#kepler-project](https://cloud-native.slack.com/archives/C05QK3KN3HT)讨论组 </b>

### 参考文献:

[1] Guillaume Fieni, Romain Rouvoy, Lionel Seinturier. SmartWatts: Self-Calibrating Software-Defined Power Meter for Containers. IEEE CCGRID 2020.
https://ieeexplore.ieee.org/document/9139675

[2] Marcelo Amaral, Huamin Chen, Tatsuhiro Chiba, Rina Nakazawa, Sunyanan Choochotkaew,  Eun Kyung Lee,  Tamar Eilam. Kepler: A framework to calculate the energy consumption of containerized applications. IEEE CLOUD WIP 2023. https://www.computer.org/csdl/proceedings-article/cloud/2023/048100a069/1QJi0ffK3ug

[3] Marcelo Amaral, Huamin Chen, Tatsuhiro Chiba, Rina Nakazawa, Sunyanan Choochotkaew,  Eun Kyung Lee,  Tamar Eilam. Process-based Efficient Power Level Exporter. IEEE CLOUD 2024 (in press).  

[4] Advancing Cloud Sustainability: A Versatile Framework for Container Power Model Training. IEEE MASCOTS Workshop 2023.
https://www.computer.org/csdl/proceedings-article/mascots/2023/10387542/1TKR5vzaWXe

[5] Exploring Kepler’s potentials: unveiling cloud application power consumption, https://www.cncf.io/blog/2023/10/11/exploring-keplers-potentials-unveiling-cloud-application-power-consumption/