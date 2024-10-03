---
title: "Green Reviews Working Group: Moving towards measuring the sustainability footprint of CNCF projects"
description: "In this blog post we will take a look at how the Green Reviews Working Group is contributing to moving towards continuously measuring the sustainability footprint of CNCF projects"
slug: 2024-green-reviews-working-group-measuring-sustainability
weight: 1
date:   2024-03-15 10:00:00 +0000
author: Antonio di Turi, Imma Valls, Kristina Devochko, Leonard Pahlke, Niki Manoledaki, Ross Fairbanks
---

## Introducing the Green Reviews Working Group and its mission

Cloud computing has a significant environmental impact that is rapidly growing due to the rising demand for cloud services, especially with resource-intensive applications like Generative Artificial Intelligence (GenAI). To identify and address environmental sustainability challenges in the cloud native and open source space, some of the cloud native community members started a Technical Advisory Group for Environmental Sustainability (TAG ENV) that operates under the Cloud Native Computing Foundation (CNCF) umbrella. You can learn more about TAG ENV on our [website](https://tag-env-sustainability.cncf.io).

TAG ENV has created subgroups known as Working Groups for more narrowly scoped activities. Currently, two Working Groups (WG) operate under TAG ENV, one of them being the **Green Reviews WG**, which we will look at in this blog post. Source code, documentation, and other relevant content produced by Green Reviews WG is available in the following GitHub repository: https://github.com/cncf-tags/green-reviews-tooling.

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/tag-working-groups.webp" alt="Overview of active Working Groups under CNCF TAG Environmental Sustainability"></p>

The main goal of the **[Green Reviews WG](https://github.com/cncf/tag-env-sustainability/tree/main/working-groups/green-reviews)** is to assess the environmental sustainability footprint of CNCF projects, as well as provide guidance and recommendations on how the footprint can be lowered over time. By providing a framework to gather this type of sustainability-related insights and making this data publicly available for all CNCF projects, we are contributing to continuous improvement of the overall ecological footprint of the CNCF landscape. The [Green Reviews WG Charter](https://github.com/cncf/tag-env-sustainability/blob/main/working-groups/green-reviews/charter.md) expands further on the mission and vision of the Green Reviews WG. 

By evaluating the environmental sustainability footprint of CNCF projects, the Working Group aims to raise awareness and provide meaningful insights for the project maintainers regarding the sustainability posture of their projects. In addition, the Working Group seeks to provide the guiding pillars for the project maintainers to make informed decisions that will improve the sustainability posture of their projects for every new release. 

Finally, we believe this data will also be helpful for the end users and adopters of the CNCF projects and contribute to even broader awareness around environmental sustainability in the cloud native and open source realm.

## Putting Green Reviews WG goals into action

Measuring the sustainability footprint of software is not an easy task. Our vision is that the WG will compute the sustainability data for every release of a CNCF project that requests a sustainability footprint assessment. To achieve such a vision, our goal is to develop a workflow that can integrate well with the existing software lifecycle of other CNCF projects. To achieve this, we are creating an automated workflow for performing sustainability assessments. This has been the main goal of the [milestone](https://github.com/cncf-tags/green-reviews-tooling/milestone/1) that the WG completed in Q1 of 2024 in the run-up of KubeCon + CloudNativeCon Europe 2024. The milestone can be found in the project repository, as well as the [Roadmap](https://github.com/cncf-tags/green-reviews-tooling?tab=readme-ov-file#roadmap).

To accomplish the goal, the WG needs to collaborate closely with the CNCF projects. This is to ensure that the right software is running on the right platform with realistic test cases and meets all the technical requirements. In this regard, it may be worth mentioning a separation of responsibilities between the WG and the CNCF project requesting the assessment. More granular information can be found in the **[Green Review WG Charter](https://github.com/cncf/tag-env-sustainability/blob/main/working-groups/green-reviews/charter.md)**.

The WG will be responsible for setting up the infrastructure, including all the needed hardware and software to perform the sustainability footprint assessment. It will also be responsible for defining and calculating the metrics that are needed to assess the environmental sustainability footprint of CNCF projects.

CNCF projects, on the other hand, will be responsible for providing the configuration that is needed to install the software on the Green Reviews WG technical platform. They also need to provide use cases that the WG will use to perform benchmarking of the respective projects.

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/separation-responsabilities-cncf-projects-green-reviews-wg.webp" alt="Separation of responsabilities CNCF projects Green Reviews WG"></p>

In other words, the WG provides a technical platform - including the necessary underlying infrastructure and tooling - for CNCF projects to assess their sustainability footprint. This process needs a lot of experimentation. We want to make sure that the metrics that are computed are as reliable as possible. At the point of writing this blog post, there is no established definition/industry standard of how to perform a software sustainability footprint assessment. The WG’s investigations balance exploration of the available tooling and methodologies with the application of the best practices for application deployment, for example by applying GitOps practices and tooling, and platform automation.

### Building the workflow for assessing the sustainability footprint of CNCF projects

A good way to practically understand the first version of the workflow that the WG is designing is to take a look at the following architecture diagram: 

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/green-reviews-wg-workflow-vision.webp" alt="Separation of responsabilities CNCF projects Green Reviews WG"></p>

The WG's workflow vision is that every release requesting a sustainability footprint assessment will trigger a Github Action specified in the [Green Reviews repo](https://github.com/cncf-tags/green-reviews-tooling) that will start a benchmarking pipeline. The pipeline’s job is to:

1. Spin up the Equinix Metal resources
2. Install Kubernetes and all the needed observability tools
3. Install the software that will be assessed
4. Execute the necessary test cases
5. Gather sustainability-related metrics 
6. Publish sustainability metrics

We are happy to share that our cloud infrastructure is now fully operational. Our Kubernetes (k8s) cluster is hosted on Equinix Metal servers from the community lab. The cluster uses a GitOps approach using Flux to deploy observability tools such as Kepler, Prometheus, and Grafana. Our infrastructure setup is documented [here](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/infrastructure/about.md). These are essential for conducting the sustainability footprint assessments. [Kepler](https://github.com/sustainable-computing-io/kepler), in particular, is a CNCF project that uses eBPF and RAPL to provide accurate energy metrics in various types of cloud environments, from bare metal to VMs in the public cloud, and associates them to Pods and other Kubernetes resources.

Flux is responsible for deploying all the selected observability tools and the CNCF projects. After the GitHub Action triggers all the defined use cases, Kepler will produce the energy metrics and export them natively to Prometheus. 

### Sustainability metrics and the Software Carbon Intensity specification

This infrastructure is used to generate the initial data to calculate the carbon intensity of Falco using the [Software Carbon Intensity](https://learn.greensoftware.foundation/measurement#software-carbon-intensity-specification) (SCI) specification, a soon-to-be [ISO standard](https://www.iso.org/standard/86612.html) developed by the [Green Software Foundation](https://greensoftware.foundation/). This dashboard showcases the SCI factors, such as the energy consumption of Falco, the carbon emissions of the Equinix geographical location, and the embedded carbon of the hardware the software is running on. The dashboard is a public Grafana dashboard, illustrating our commitment to transparency and continuous improvement.

<p class="mt-5 mb-5"><img src="/images/blogs/2024-03-15-green-reviews-working-group-moving-towards-measuring-the-sustainability-footprint-of-cncf-projects/sci-grafana-dashboard.webp" alt="SCI index componentes Grafana dashboard"></p>

The sustainability footprint metrics are not limited to the SCI specification, but we are using it as a North Star. It is an opportunity to show a cloud native reference architecture for it. More information about these measurements can be found in the project’s [docs](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/measurement/sci.md). To access the public Grafana instance and view the dashboard, follow the steps [here](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/infrastructure/about.md#monitoring).

The destination where to publish the sustainability metrics is not decided upon at the point of writing this blog post. [CNCF devstats](https://devstats.cncf.io/) is being discussed as another possible place where to make this type of data publicly available.

### Next steps for the sustainability footprint assessments and benchmark test pipeline

The continuous operation of a Kubernetes cluster raises questions about how sustainable this solution is. Some decisions were forced, like using bare metal servers to be able to retrieve accurate energy metrics. But new questions keep coming up as the work on the technical platform progresses.

Can we create nodes on-demand when conducting sustainability footprint assessments instead of running the nodes all the time? Another enhancement opportunity is that currently, Falco is always deployed and the kernel is always being tested, which we hope to improve after KubeCon + CloudNativeCon Europe 2024, so that we use the minimal amount of energy in the pipeline itself. These questions are crucial to the WG’s mission, and we are looking forward to the community's suggestions and contributions. 

In addition, the sustainability footprint assessment itself will be something that we need to tackle in the next milestone. The WG’s goal is to make the sustainability footprint assessment pipeline useful for CNCF project maintainers, such as Falco maintainers. We will continue to collaborate with the respective project maintainers as we enter the “review” phase of the project. This type of sustainability footprint assessment is inspired by the processes like TAG Security’s Security Assessment (TSSA) that is already utilized for CNCF projects. More information about the collaboration between Green Reviews WG and CNCF project maintainers can be found in the [docs](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs/cncf-projects/cncf-projects.md). **CNCF project maintainers who are interested in having their projects assessed are welcome to flag their interest [here](https://github.com/cncf/tag-env-sustainability/issues/223)!**

Please keep in mind that only some components of the described vision are in production at the time of writing this blog post. If you would like to find out more about the latest status of the work that’s being done in the Green Reviews WG, please join our community in the [Green Reviews WG Slack channel](https://cloud-native.slack.com/archives/C060EDHN431) or the [TAG ENV Slack channel](https://cloud-native.slack.com/archives/C03F270PDU6), or check out the [documentation](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs) on GitHub.

## Reflecting on Green Reviews WG's journey till now

Since its formal announcement at KubeCon + CloudNativeCon North America 2023, the Green Reviews Working Group (WG) has been on a journey, making progress in the realm of sustainability within the cloud native ecosystem.

Reflecting on the WG’s progress, we would like to share the milestones that have been achieved so far: in a collaborative effort, we reached our first **100+** commits and successfully addressed our first **10+** issues. The group’s GitHub repository is progressively taking shape, driven by engaging discussions and gaining momentum, especially with the very first collaboration with the Falco project team, which will be the pilot CNCF project to perform a sustainability footprint assessment with the help of the WG’s technical platform.

The WG faced many challenges in the past months: we had to keep multiple streams open in parallel and ensure that there was continuous progress: designing the workflow, setting up the infrastructure, installing, configuring, and running Falco according to the defined requirements, and deciding upon the framework for calculating sustainability metrics. 

The most recent milestone was even harder because we had to balance the scalability of the solution with the practical need to build a reproducible sustainability footprint assessment workflow. The project is still very young, and we had to learn how to best collaborate and document every step in a transparent, open source way.

The Falco project was also challenging because many of the WG contributors were not familiar with the complex nature of this security software. Ensuring that Falco was running with the correct load and specifically with a meaningful kernel_event_rate was challenging, but luckily the Falco maintainers and contributors were very collaborative. 

Before KubeCon + CloudNativeCon Europe 2024, the WG’s goal was to present the first implementation of a sustainability footprint assessment workflow to the community. At the point of writing the blog post, **version 0.1** is up and running, though it still needs improvements, including:

- The definition of the GitHub Actions workflow that the release of the CNCF project will trigger;
- The steps needed to provision Equinix servers on-demand;
- Continuous improvement of the quality and quantity of the sustainability metrics;

Please refer to the WG’s [Roadmap](https://github.com/cncf-tags/green-reviews-tooling#roadmap) on GitHub for future updates and enhancements.

## Green Reviews WG is always looking for new contributors - please come and join us! 💚

All the activities and communication that are going on in the **Green Reviews Working Group** are transparent, public, and open to everyone. The Working Group is fully volunteer-run and is always on the lookout for new contributors to help with tasks. We always have a few [issues with labels such as "help wanted"](https://github.com/cncf-tags/green-reviews-tooling/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22) in the repository that folks can pick up or pair on!

If you’re looking for ways to contribute technically to a project in the cloud native sustainability domain, then you are in the right place! Our Working Group is diverse and inclusive, and we’re happy to welcome everyone who would like to join us and contribute to the group.

There are many ways to begin your contributor journey. We recommend checking out some of the resources below that should provide enough information to get you started if you would like to read further. Or just join one of the meetings and learn with us along the way!

- Read the blog [Getting started as a TAG Environmental Sustainability Contributor](https://tag-env-sustainability.cncf.io/blog/2023-getting-started-as-tag-env-contributor). It’s a general guide on how to get started in the TAG Environmental Sustainability, and many of the steps provided in the blog post also apply to the Green Reviews WG.
- Check the [Green Reviews WG Charter](https://github.com/cncf/tag-env-sustainability/blob/main/working-groups/green-reviews/charter.md). It outlines the WG's motivation, scope, goals, non-goals, and deliverables.
- Read the [documentation](https://github.com/cncf-tags/green-reviews-tooling/blob/main/website/content/docs) in the green-reviews tooling GitHub repository.
- Join the WG Slack channel [#tag-env-wg-green-reviews](https://cloud-native.slack.com/archives/C060EDHN431) in the [CNCF Slack](https://slack.cncf.io) workspace and attend the group [meetings](http://bit.ly/wg-green-reviews).
- Check out the Working Group's backlog to find beginner-friendly issues to work on, and check the [contributing guide](https://github.com/cncf-tags/green-reviews-tooling/blob/main/CONTRIBUTING.md)! All types of contributions are welcome: code contributions, issues, suggestions for things like product roadmap, questions, and documentation.

The **Green Reviews WG** encourages and welcomes contributions from anyone. If you have an idea, don’t hesitate to share it with the group by submitting [a GitHub issue](https://github.com/cncf-tags/green-reviews-tooling/issues/new) or posting it in the Slack channel. 

We’re on an exciting journey with many opportunities for collaboration, experimentation, research, innovation, and learning by doing. Together we’re making an impact and paving the path for a more sustainable cloud native and open source landscape, and we hope that what you’ve learned from this blog post inspires you to join us on this journey!