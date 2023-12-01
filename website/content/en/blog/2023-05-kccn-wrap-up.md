---
title: Environmental Sustainability at KubeCon / CloudNativeCon EU 2023
description: KubeCon + CloudNativeCon Europe 2023 was the largest open source conference in Europe with 10k+ attendees and had a strong focus on cloud native sustainability.
slug: 2023-wrap-up-kccn-eu
weight: 1
date:   2023-05-21 10:00:00 +0000
author: Leonard Pahlke, Kristina Devochko, Niki Manoledaki
---

KubeCon + CloudNativeCon Europe 2023 was the biggest open source conference in Europe to date with 10000+ in-person and 5000+ virtual attendees, a multitude of companies and a diverse set of talks spread over 20 different tracks. Strong focus on sustainability in software was prominent at KubeCon+CloudNativeCon Europe 2023. It was amazing to see it mentioned on the big stage during multiple keynote and breakout sessions. Important issues like energy consumption, carbon emissions and overall environmental impact of cloud applications and infrastructure were raised in relation to sustainability in tech topics. The cloud-native community is becoming more aware of the issues related to environmental sustainability. The CNCF Environmental Sustainability Technical Advisory Group (TAG ENV)  is here to support, guide, and lead this process with the cloud native community.

TAG ENV is composed of volunteer open-source contributors who advocate for cloud-native environmental sustainability. For more information about TAG ENV, visit our website [tag-env-sustainability.cncf.io](http://tag-env-sustainability.cncf.io) and the GitHub repository [github.com/cncf/tag-env-sustainability](http://github.com/cncf/tag-env-sustainability). Everything we do in the TAG is open to all and we welcome new contributors. If you are interested in this topic, you are welcome to join one of our public meetings, which occur twice a month, and can be found through [this calendar](https://tockify.com/cncf.public.events/monthly?search=TAG%20Environmental%20Sustainability). Also, make sure to join our [CNCF Slack](https://slack.cncf.io/) channel [#tag-env-sustainability](https://cloud-native.slack.com/archives/C03F270PDU6)!

Below, we recap the talks about environmental sustainability at the conference and gather voices from the TAG ENV community about the event(s).

## Environmental Sustainability related talks at KubeCon / CloudNativeCon EU 2023

### Kubernetes Scheduling, Scaling and Resource Tuning

* **Power-Aware Scheduling in Kubernetes** ([sched](https://sched.co/1HyWC), [recording](https://youtu.be/Wn0S6CTXGS4)): This talk discusses the lack of power consideration in the Vanilla Kubernetes scheduler, leading to potential power-related issues in data centers. It introduces a new scheduler feature called power-aware scheduling, which enforces power caps and optimizes pod placement to improve workload stability and protect power supply infrastructures in large Kubernetes clusters. This enhanced scheduling strategy is implemented through plugins and can enhance resource utilization, workload reliability, and enable safe scalability of server hardware and data center infrastructure in Kubernetes clusters.
* **GreenCourier: Towards Sustainable Serverless Computing** ([sched](https://sched.co/1HyXM), [recording](https://youtu.be/E02sFT5wqEw)): This talk delves into GreenCourier, a solution aimed at reducing carbon emissions in Serverless Computing (Function-as-a-Service) by implementing an intelligent scheduling policy for Kubernetes that considers the carbon-efficiency of geographically interconnected clusters. It also discusses the integration of GreenCourier with Knative and Liqo for establishing geographically distributed Kubernetes multi-cluster topologies.
* **Building a Sustainable, Carbon-Aware Cloud: Scale Workloads and Reduce Emissions** ([sched](https://sched.co/1HyPo), [recording](https://youtu.be/s7K7QkhWnFU)): This talk explored the concept of carbon awareness in building sustainable cloud-native applications, focusing on leveraging the KEDA project to achieve proactive scaling and reduce carbon emissions for Kubernetes workloads, without requiring code or workload changes. In addition the talk discusses the benefits of innovation in this area for business scenarios and energy cost management.
* **Evolution of on-Node Adaptive Power Tuning** ([sched](https://sched.co/1Hycj), [recording](https://youtu.be/_SqebJmYteQ)): This talk highlighted the need for more adaptive on-node systems to optimize resource usage and decrease power consumption and cooling costs, presenting a vision of more intelligent and efficient systems through the combination of TuneD and Kubernetes Power manager for adaptive power-tuning models.

### Introduction to Environmental Sustainability

* **Accelerate Sustainable Computing with Community Collaboration** ([sched](https://sched.co/1HyPf), [recording](https://youtu.be/qRnhAex9aZI)): This talk highlighted the potential of open source collaboration in addressing the climate crisis by exploring how sustainable computing, following the cloud native approach, can drive energy-efficient technology advancements, and emphasizes how important it is to upstream communities in accelerating these efforts.
* **The State of Green Software + Cloud Native** ([sched](https://sched.co/1Hzd3), [recording](https://youtu.be/VCIdFHhp4No)): This session provided updates from the CNCF Environmental Sustainability TAG, discussing the Cloud Native Sustainability landscape, collaborating organizations, the Cloud Native Sustainability maturity model, addressing challenges, offering guidance, and introducing cloud native projects for building a more sustainable tech stack.
* **Be the Change Our Planet Seeks: How YOU Can Contribute to Running Environment-Friendly Workloads on Kubernetes** ([sched](https://sched.co/1HyW9), [recording](https://youtu.be/ppe0ptZEcvw)): This talk emphasized the importance of sustainable software engineering and highlighted how developers and platform engineers can utilize Kubernetes in an eco-friendly manner, providing insights, actionable steps, and practical advice on applying sustainable principles to Kubernetes workloads.

### Company Use case

* **Minimizing Energy Consumption in Bare Metal K8s Clusters** ([sched](https://sched.co/1HybW), [recording](https://youtu.be/jsBSNCuSI74)): This talk focused on the need to reduce energy consumption in infrastructures like Kubernetes, particularly when running on-premises on bare metal, discussing the various aspects that influence power consumption, steps to reduce overall consumption of Kubernetes clusters, and exploring possibilities throughout the hardware and software stack, sharing experiences, examples, and considerations for implementation.
* **Scale Down Your Environmental Impact** ([sched](https://sched.co/1Hybr), [recording](https://youtu.be/6tmc-2BqV50)): This talk discussed the responsibility of the tech industry to evolve in response to the European climate law's greenhouse gas emission reduction targets. It questioned the scalability of the efficiency and environmental benefits of Kubernetes, especially for smaller companies and individuals, and examined the sustainability perspective of Kubernetes compared to its alternatives. Finally the talk considered the environmental price tag and strategies to minimize impact, while exploring when the Kubernetes adoption journey becomes environmentally productive through visualization of its energy usage scaling across different contributors and enterprises.

### Observability

* **Sustainability Through Accountability in a CNCF Ecosystem** ([sched](https://sched.co/1HyYK), [recording](https://youtu.be/QvSCbdOaUn0)): This talk explored the challenges of accounting for carbon footprint and energy consumption in multi-tenant cloud native services and demonstrated how CNCF projects, like Rook, Open-Telemetry and Jaeger, can be combined to estimate per-user energy consumption in a storage system. This talk showcased the potential for building sustainable computing futures within the CNCF ecosystem and inspiring further innovations.

## We are excited to see where this area is heading

KubeCon + CloudNativeCon EU 2023 in Amsterdam was a turning point for the emerging issue of cloud native environmental sustainability. Talks ranged from keynote sessions on energy monitoring with eBPF-based Kepler project and carbon-aware scheduling with KEDA to sessions on how environmental sustainability interacts with serverless computing, how to contribute to the ENV TAG community, and how to scale down your workloads to reduce the carbon emissions of your operations. We invite you to watch the recordings of these talks and continue the conversation with us in TAG ENV!

Open source contributors from different parts of the cloud native ecosystem are creating technical solutions to reduce the impact of cloud computing on climate change. Through various initiatives, TAG ENV aims to support and amplify these projects and the community of open source contributors who aim to make a positive impact for our planet. At KubeCon + CloudNativeCon, folks from TAG ENV organized a project meeting and did a talk on the TAG’s activities to raise awareness about the importance of growing the community of like-minded people who can collaborate on establishing common patterns and best practices for environmental sustainability in the cloud native space. In our meetings, we discuss ways to raise awareness through various forms of outreach (blog posts, events, best practice documentation), creating a maturity model for cloud native environmental sustainability, demonstrating tools, etc. Ultimately, we strive to make environmental sustainability a core consideration when designing and deploying cloud native software. In the following sections, community members share their impressions of the conference.

## An exciting experience

<!-- markdownlint-disable no-blanks-blockquote -->

> [eduardoriveror](http://github.com/eduardoriveror): Cloud metrics on energy consumption and how to visualize them.

> [guidemetothemoon](http://github.com/guidemetothemoon): I was very excited to join TAG Environmental Sustainability project meeting to meet other like-minded community members and participate in good discussions on how we can collaborate further on spreading awareness around the topic in cloud native space. I was also happy to see sustainability being mentioned in the keynote + watching the sessions related to reducing energy consumption of the servers. I was excited for all the sessions that were related to sustainability basically :).

> [nikimanoledaki](http://github.com/nikimanoledaki): There is a surge in momentum around the topic of cloud-native environmental sustainability thanks to KubeCon + CloudNativeCon EU 2023 in Amsterdam, which coincidentally happened during Earth week. There were multiple keynotes, talks, and feature announcements about this important topic. It is also very exciting that the CNCF Environmental Sustainability TAG itself is growing as a community: we held the first official project meeting, the room for the TAG talk was full, and we welcomed many newcomers in our first post-KubeCon TAG meeting! I highly encourage folks to go through the list of talks at KCCN EU 2023 listed on the ENV TAG website now that uploads are available.

> [david-m-m](http://github.com/david-m-m): It became obvious that sustainability becomes a trending topic which will gain even more traction in the coming years. Very nice to see that many groups are working on sustainability from different angles.

> [AntonioDiTuri](http://github.com/AntonioDiTuri): It was my first Kubecon, my expectations were high but being there in Amsterdam was something else. I was very excited when, during the keynotes the carbon-aware KEDA Operator was presented. During my master thesis my professor and I were working to engineer a green layer for k8s. At that time I barely knew what k8s was and my cloud native career was about to begin. In 2019 we had some good intuitions, and after 4 years I could see those intuitions becoming reality in a project maintained by Azure. I remember I was very frustrated because I had to learn a lot of material on my own, I felt like I was alone in my quest. If only my teacher would have been connected to the community my effort could have been much more helpful to other members and to the planet. In those years I always thought about how I could take some sustainable actions in my field of expertise. Later when I heard about the TAG I had fire in my heart and I thought: “no more excuses, this is the right time to get started”

## The hallway track

The hallway track is an unofficial track at KubeCon that describes the conversations and discussions held before and after talks, usually in the hallway on the way to or from another talk.

> [eduardoriveror](http://github.com/eduardoriveror): Kepler and KEDA, better usage of cloud resources and power consumption.

> [guidemetothemoon](http://github.com/guidemetothemoon): I had great discussions related to the talk that I presented regarding sustainability in Kubernetes - discussions were with people who weren't thinking about this topic at all in context of cloud native and Kubernetes specifically. Also enjoyed some of the discussions during the TAG project meeting regarding measurement PUE of what is power vs. energy - seeing those heated discussions was really great because it was clear that all of us who were participating were very engaged in the topic.

> [nikimanoledaki](http://github.com/nikimanoledaki): There is a growing interest from cloud users to be able to report, monitor, and reduce the energy consumption and carbon emissions with cloud-native tooling. The tools and techniques available for this are at various stages. A large number of the talks on cloud-native environmental sustainability focus on these use cases and the challenges and solutions available today. For example, there is a lot of interest in KEDA's carbon-aware scheduler, reporting Scope 1/2/3 emissions with carbon dashboards, the Green Software Foundation's Carbon Software Intensity (SCI) index, tools such as Kepler and Scaphandre for energy monitoring, optimisations through green cloud patterns (GreenOps!) and new technologies such as WebAssembly, and leveraging FinOps techniques, to name just a few.

> [david-m-m](http://github.com/david-m-m): Most interesting were topics around measuring and improving energy consumption / carbon footprint. Focus definitely on actual implementations.

> [AntonioDiTuri](http://github.com/AntonioDiTuri): Unluckily I came to know about the sustainability area too late during the Kubecon. I only managed to talk to a member of the sustainability TAG on the last day cause I noted down the name during the keynotes. I am trying to catch up now.

## Upcoming Collaborations

> [eduardoriveror](http://github.com/eduardoriveror): I would like to collaborate spreading the word of the TAG via meetups, talks but also preparing technical demos on how to better use resources in Kubernetes and to visualize this in Grafana dashboards.

> [guidemetothemoon](http://github.com/guidemetothemoon): I'm looking forward to creating content on the topic in the form of blog posts and speaking engagements. I'd love to contribute to content creation as part of TAG as well. Another area I will be looking into is testing out the cloud native tools for sustainability and creating guides and recommendations on how to adopt, integrate and use those tools so that it can make it easier for others to understand what the value of the tools is (on concrete examples) and how to get started.

> [nikimanoledaki](http://github.com/nikimanoledaki): I'm excited for the Environmental Sustainability chapter in the GitOps WG where we have been looking at energy benchmark tests for tools such as Flux and ArgoCD using eBPF-based Kepler! There is a lot of interest in applying these technical solutions for GreenOps and exchanging lessons learned. The Environmental Sustainability TAG is a wonderful open-source community and forum for these conversations.

> [david-m-m](http://github.com/david-m-m): Figuring out smart metrics for sustainability and relating them to strategies for optimizations.

> [AntonioDiTuri](http://github.com/AntonioDiTuri): I would like to join a strong tech community thriving for excellence. I would like to help build a good code base that could help other people and increase the awareness around the sustainability area. I would love to do something practical and achieve in the long term significant results in terms of carbon reduction on the work we daily do.

## Join TAG ENV

If you are interested in joining the CNCF TAG Environmental Sustainability, check out our [repository](https://github.com/cncf/tag-env-sustainability) (have a look through the [issues](https://github.com/cncf/tag-env-sustainability/issues)!), join our [#tag-env-sustainability](https://cloud-native.slack.com/archives/C03F270PDU6) Slack channel on the [CNCF server](https://slack.cncf.io/). Do join our meetings - these are open to all, take place twice a month, and can be found in [this calendar](https://tockify.com/cncf.public.events/monthly?search=TAG%20Environmental%20Sustainability).
