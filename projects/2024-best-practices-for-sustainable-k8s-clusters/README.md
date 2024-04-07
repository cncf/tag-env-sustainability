# Best practices for environmentally sustainable Kubernetes clusters - In Progress

- **Project Leads**:
  - [@JacobValdemar](https://github.com/JacobValdemar)
  - [@xamebax](https://github.com/xamebax)

- **TAG ENV Lead representative**: [@mkorbi](https://github.com/mkorbi)
- **Project started**: *2024-03-04*
- **Project completed at**: *N/A*
- **Project drive folder**: [Project drive](https://drive.google.com/drive/folders/1KVJGOtCGJk9WFn_iS5AxOCyfKa_CM0He)
- **Project tracking issue**: [#347](https://github.com/cncf/tag-env-sustainability/issues/347)

## Description

To quote the description from an earlier proposal on this subject ([#54](https://github.com/cncf/tag-env-sustainability/issues/54)):

> Kubernetes is the key driver and foundation of the cloud native universe. Within this project, we will work on the basic capabilities, best practices and scheduling mechanism as well as extensions to improve the K8s GHG impact.
>
> Where [there] are patterns, there are anti-patterns, where we improve for speed, resistance and security, there is space for configurations and setting with a negative impact on power consumption and the following chain.

Our ambition is to provide Kubernetes operators with basic, but useful recommendations for running Kubernetes clusters that do less damage to the environment. We want to start small and create a base to expand on in the future.

### Impact

Sustainability is still difficult to prioritize in tech organizations. We hope to have the following impact in organizations that adopt green practices:

- Organizations reduce risks related to capacity in a world with growing need for computing power.
- Achievable, measurable success stories increase confidence of Kubernetes operators and management in larger emission-reducing projects.

### Scope

#### In Scope

- Kubernetes flavors: Cloud-based Kubernetes clusters.
- Target audience: Kubernetes Administrators.
- Refer to other people’s data (“we implemented X and saved Y”) where possible.

#### Out of Scope

- Kubernetes flavors: bare-metal Kubernetes.
- Target audience: developers running applications on Kubernetes.
- Running rigorous experiments (want to rely on other success stories for data, or on experience-based estimations instead).
- Creating new tools.

### Goals and Non Goals

#### Goals

Enabling Kubernetes administrators to run more sustainable clusters and identify the best actions to lower their clusters carbon intensity / carbon footprint.

Summarize and vet available information. CNCF is a trustworthy source of information in the cloud-native landscape.

#### Non Goals

We do not have an ambition for a complete, exhaustive list of all actions, as we will try to focus on the highest impact, lowest effort actions (where possible).

#### Deliverables

- a guide / actionable list of best practices,
- extra material: background information.

We want to provide actions and optional extra context for operators with extra capacity. We are coming from an understanding of tight time budgets that can be spent on sustainability efforts.

#### Additional info and comments

- Reference to supporting material:
  - [Previously gathered tips on the subject](https://docs.google.com/document/d/1lgXe-37JKeIxrRQan9vzVdjzAu8SQzGXKiTOmU2jWkE/edit#heading=h.73pgf6pbinj0)
- Slack channel for discussion and collaboration on the project: ```#tag-env-k8s-best-practices```
