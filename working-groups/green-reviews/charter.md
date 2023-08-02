# Green Reviews Working Group Charter

## Introduction

This document outlines the charter for the Green Reviews Working Group, a [CNCF Working Group](https://github.com/cncf/toc/blob/main/workinggroups/README.md) under the [CNCF TAG Environmental Sustainability](https://github.com/cncf/tag-env-sustainability).

## Motivation

CNCF projects are becoming increasingly concerned and aware of the challenges related to environmental sustainability. Their objective is to integrate an environmental sustainability project review in each release cycle. Furthermore, they strive to empower end users to assess the sustainability of the cloud native projects within their systems.

The purpose of the Green Reviews Working Group is to help CNCF projects to review their cloud native sustainability footprint.

To support CNCF projects, project maintainers and contributors, there is a need for a systematic approach to assess every project's sustainability footprint. Implementing a structured review process for this purpose would greatly benefit the CNCF ecosystem, establishing it as a best practice. Such a process would enable stakeholders to comprehensively evaluate and enhance the sustainability of CNCF projects, promoting their long-term viability and environmental responsibility.

Green Reviews Working Group empowers the CNCF Environmental Sustainability TAG to pursue its goals of promoting environmentally sustainable practices in the CNCF ecosystem.

## Scope

- Act within the CNCF Environmental Sustainability TAG Charter.
- Provide metrics, guidelines, guidance, and processes for measuring and improving the sustainability footprint of CNCF projects.
- Initiate a CNCF project review at the discretion of the Working Group.
- Leverage existing tools, libraries, and frameworks for conducting CNCF project sustainability footprint reviews (for example, to automate certain processes) whenever possible. However, in the absence of suitable tooling, minimal solutions, such as scripts or the thinnest viable tools, may be developed, provided that such creations are formally approved by the CNCF Environmental Sustainability TAG.
- Be a point of contact for project maintainers to understand the outcome of the projects’ reviews.

## Goals

- Provide resources through a review process and methodology to help CNCF projects to evaluate their sustainability footprint[^1] and integrate environmental sustainability practices.
- Collaborate with CNCF project maintainers to produce meaningful sustainability footprint reviews.
- Communicate the results of the projects’ cloud native sustainability reviews.

## Non-Goals

- Build tooling for measuring or monitoring sustainability-related metrics from scratch.
- Contribute code to existing tooling and cloud native sustainability projects such as bug fixes or features.
- Providing any consultancy or guidance that goes beyond facilitating the projects’ sustainability footprint reviews.
- Work on the annual CNCF sandbox project reviews as they are managed separately from this working group.

## Deliverables

- Clarify the concept of sustainability footprint and identify its constituent components across various categories of CNCF projects.
- Document how to conduct the collaborative sustainability footprint review process of a CNCF projects with project maintainers[^2].
- Document methodologies for gathering sustainability-related metrics using existing tooling and provide guidance on how to automate generation of these metrics (for example, into the project's build pipeline) to enable efficient and consistent reviews of the sustainability footprint of CNCF projects.
- Develop the testing infrastructure to measure the sustainability footprint of CNCF projects, utilizing existing tools, libraries, and frameworks wherever possible. In cases where existing tooling falls short, the implementation may involve the creation of minimal solutions, such as scripts or the thinnest viable tools, to meet the comprehensive testing infrastructure requirements.
- Provide visualisation to communicate the outcomes of the sustainability footprint CNCF project reviews, for example, through dashboards for carbon and energy monitoring. As it's also stated in the above point, existing tools, libraries, and frameworks will be utilized to provide visualisation whenever feasible. In scenarios where existing resources prove insufficient to achieve the defined objectives, minimal tools may be developed to ensure comprehensive and effective visual representation.
- Publish the deliverables above on the TAG’s GitHub repository and any other mediums such as the TAG’s website, blog, and others as necessary.

## Working Group Archival

Guidelines for the working group archival are outlined as part of the TAG's governance documentation: [Environmental Sustainability TAG Working Group Archival Process](https://github.com/cncf/tag-env-sustainability/blob/main/governance/working-group-archival-process.md#working-group-archival-process-guidelines).

[^1]: See [Deliverables](#Deliverables) for how this will be achieved.

[^2]: Examples: [[UMBRELLA] Falco collaboration with CNCF tag-env-sustainability](https://github.com/falcosecurity/falco/issues/2435),  [TAG-Security Security Assessment (TSSA) Process](https://github.com/cncf/tag-security/tree/main/assessments).
