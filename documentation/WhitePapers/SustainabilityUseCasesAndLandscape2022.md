# Current Sustainability Efforts and Use Cases Within the Cloud Native Landscape

### Contributors
Huamin Chen, [Marlow Weston](https://github.com/catblade), Niki Manoledaki, Eun Kyung Lee, Chen Wang, Chris Lloyd-Jones, 
[Parul Singh](https://github.com/husky-parul), [Przemysław Perycz](https://github.com/pperycz), [Christopher Cantalupo](https://github.com/cmcantalupo)

Formatting convention:

## for top level topic
### for sub level topics and so on

Suggestions please use comments instead of inline with text
-->

<!-- ## Use Cases -->
## Use Cases
<!--- TODO: add in details on these use cases --->
### Green/sustainable computing

System architecture and designs to optimize resource consumption, reduce environmental impact, and improve sustainability

## Challenges for Carbon/Energy Accounting
Carbon emission for the Cloud computing system is largely composed of operational and embodied (or embeded) carbon emission. The operational carbon emissionis the amount of carbon pollution emitted during the operational or in-use phase of a Cloud computing system. The embodied carbon emission is the amount of carbon pollution emitted during the creation and disposal of Computing system (e.g., device, chip, servers, and etc.)

Green computing refers to the architecture and design of software and systems that optimize resource consumption, reduce environmental impact, and improve sustainability.

### Carbon/Energy Accounting

Carbon and energy accounting refer to systems, services, and methodologies to track and account for carbon and energy consumption.

Operational carbon emissions refer to the amount of carbon pollution emitted during the operational or in-use phase of a Cloud computing system.

The embodied carbon emission is the amount of carbon pollution emitted during the creation and disposal of the hardware (HW) and physical components of a Computing system, including hardwear such as devices, chips, servers, etc.

Quantifying the operational carbon emission is not trivial due to the following reasons:

* Multiple HW components enclosed in a server - power modeling is required for various HW components (e.g., CPU, Memory, GPU, Storage, I/O) for accurate quantification/estimation.
* Different HW for a service is used by multiple users/accounts –power modeling per different user (e.g., a/multiple software thread(s)) is a totally different problem for modeling. The SW/HW interaction should be well-understood for power modeling.
* Different generations/architecture/vendors of HW in Cloud Infrastructure - power modeling is required for different generations/architecture/vendors for example, Intel vs. AMD vs. ARM, Skylake vs. Sapphire Rapids, and ConnectX-5 vs. ConnectX-6.
* Dependencies of the services - a service may use different services. (e.g., Kubernetes uses COS service), applications may be distributed across datacenters and clouds.
* Services running in virtualized/containerized environments - power modeling is required for virtualized/containerized environments, which increases the complexity of modeling
* Separate fan/cooling controller in the server – The fan and other cooling components are often controlled by a separate controller, which requires additional modeling.
* Missing data – due to the limitation of exposing internal data in Cloud, accessing the key data to calculate the operation emission is prohibited. On-Prem data centers are sometimes lacking power measurement technology.
* Telemetry & observability – a user often uses multiple HW at the same time, reliable and high-granularity telemetry becomes more important. However, telemetry/observability overhead should be low relative to the services being executed on the server/cloud.
* AI/ML workloads – dramatic increase in using Artificial Intelligence (AI)/ Machine Learning (ML) workload leads to the strong need of dedicated GPU-based clusters. The characteristics of such workloads are different than traditional workloads and their power consumptions are significantly higher.
* Confidential workloads - evolve from VM use case to confidential container (SGX/SEV/TDX), the TEE (Trusted Execution Environment)
and the usage of bounce buffer/SWIOTLB might cost more energy. However, the confidential workload is hard to be observered due to
security concern.

Quantifying embedded carbon emissions is also very challenging as manufactural details should be incorporated into the quantification. This is currently not the scope of this white paper. <!-- We may want to put some directions though // +1, would this be guidance/best practice on methods to quantify these emissions or guidance on methods to mitigate these emissions? -->

## Layers of the solutions

| Area | Goal | Efforts |
| -------- | -------- | -------- |
| Multi Data Centers     | Intelligently choosing which datacenter to schedule on according to environmental impact, time of day, et cetera     |  Cluster Management    |
We can divide a system up into three general areas:

1. Which datacenter to use, if there are mulitple options available.
2. Where to place the workload once a datacenter is chosen.
3. How to manage the resources on the node allocated for a resource to run on.

All of these elements can be investigated further individually.

| Area | Goal | Efforts |
| -------- | -------- | -------- |
| Multi Data Centers     | Intelligently choosing which datacenter to schedule on according to environmental factors such as whether the region is powered by renewables, the region's Marginal Emissions Rate, Power Usage Effectiveness (PUE), time of day, etc.     |  Cluster Management    |
| Within Data Center     | Scheduling effectively according to workload, availability, and urgency of workload     | Power Management, K8S Scheduler Plugin   |
| Within a node     | Optimizing resources to handle workload specifications (which may include performance parameters) while minimizing resource consumption     |  Node Tuning, Pod Scaling    |


## Current Research and Development

### Runtime System Power Measurement

[A summarization of topics and research up to 2016](https://en.wikipedia.org/wiki/Run-time_estimation_of_system_and_sub-system_level_power_consumption)

### Energy Conservation and Carbon Reduction

#### Scheduling
At scheduling phase, energy to be consumed by the workload can be reduced by intelligent schedulers that are aware of carbon footprint in a data center, thermal temperature and cooling, caching aware, or server power efficiency.


#### Tuning, Scaling, and Configuration
At runtime, energy consumed by workload can be reduced at HW level through DVFS based scaling, at SW level through runtime paramter tuning and re-configuration or at the orchestration level through scale-to-zero automation. 

### Green System Architecture
Green HW/SW systems either improve sub system efficiency or change the way that computation is conducted.

For instance, programs written in [energy efficient langugages](https://haslab.github.io/SAFER/scp21.pdf) or running on more [optimized runtimes](https://hal.inria.fr/hal-03275286/document) are generally "greener".

On the other hand, architectures that address the root cause of energy waste, including idle power and data center cooling, are evaluated to be more environmental friendly. For instance, Federated Learning spreads model training to devices that do not require expensive cooling is [evaluated](https://www.cam.ac.uk/research/news/can-federated-learning-save-the-world) to reduce carbon footprint in aggregate.

## Current Landscape
<!-- ## Telemetry -->

<!--- TODO: add a diagram to illustrate data center composition --->
### Telemetry

### Smart Data Centers
* ECO-Qube is a holistic management system which aims to enhance energy efficiency and cooling performance by orchestrating both hardware and software components in edge computing applications [ECO-Qube](https://eco-qube.eu/)
* [Patchwork Kilt](https://openuk.uk/patchworkkilt/) - A blueprint for sustainable data centres.
* [Open Compute Sustainability Project](https://www.opencompute.org/projects/sustainability) - Leveraging the expertise of the OCP community, we offer an open framework and resources for OCP members and data center industry – vendors, suppliers, and end users - to deploy industry best practices that promotes reusability and circularity.  

### Cooling / BMC
* OCP Cooling Telemetry [Improve data center cooling facility efficiency through platform power telemetry](https://www.opencompute.org/documents/ocp-wp-dcf-improve-data-center-cooling-facility-efficiency-through-platform-power-telemetryr1-0-final-update-pdf)
* BMC Telemetry [Exposes Baseboard Management Controller data in Prometheus format.](https://github.com/gebn/bmc_exporter)
* (thermal???)

<!-- ### Software Agent -->

<!--- TODO: add a diagram to explain the relationship between workload and power sources  --->

### Methodology
* Runtime system power consumption estimate [Run-time estimation of system and sub-system level power consumption](https://en.wikipedia.org/wiki/Run-time_estimation_of_system_and_sub-system_level_power_consumption)
* [Software Carbon Intensity (SCI) Standard](https://github.com/Green-Software-Foundation/sci) - A specification that describes how to calculate a carbon intensity for software applications.
* [Green Software Patterns](https://patterns.greensoftware.foundation/) - An online open-source database of software patterns reviewed and curated by the Green Software Foundation across a wide range of categories.
* [SCI Guidance](https://sci-data.greensoftware.foundation/) - The SCI Guidance project details various approaches on how to understand the different methodologies that are available for calculating energy, carbon intensity,embodied emissions and functional unit values which are the core components of the SCI calculation.

### Software Agent
* gProfiler [OS code profiling tool to visualize applications' execution sequences and resource usage down to the line of code level](https://docs.gprofiler.io/)
* Energy Consumption Metrology Agent [Energy consumption metrology agent](https://github.com/hubblo-org/scaphandre)
* Scaphandre [Energy Consumption Metrology Agent](https://github.com/hubblo-org/scaphandre)
* PowerAPI [Python framework for building software-defined power meters](https://github.com/powerapi-ng/)
* [Kubernetes-based Efficient Power Level Exporter: ](https://github.com/sustainable-computing-io/kepler) <br>
  Kepler leverages eBPF programs to probe per-container energy consumption related to system counters and exports them as Prometheus metrics. These metrics help end users monitor their containers’ energy consumption and help cluster administrators make intelligent decisions towards achieving their energy conservation goals. The [Kepler Model Server](https://github.com/sustainable-computing-io/kepler-model-server) is an internal program that provides Kepler with ML models for estimating power consumption on Kubernetes workloads. The Kepler Model Server pre-trains its models with node energy statistics (labels) and node performance counters (features) as Prometheus metrics on a variety of different Kubernetes clusters and workloads. Once the models achieve an acceptable performance level, Kepler Model Server exports them via flask routes and Kepler can then access them to calculate per-pod energy consumption metrics given per-pod performance counters. Unlike other similar projects, the Kepler Model Server also continuously trains and tunes its pre-trained models using node data scraped by Kepler’s Power Estimate Agents from client clusters. This gives Kepler the ability to further adapt its pod energy consumption calculation capabilities to serve clients’ unique systems.<br>
* [Container Level Energy-efficient VPA Recommender for Kubernetes](https://github.com/sustainable-computing-io/clever): <br>Vertical Pod Autoscalers in Kubernetes allow for automatic CPU and memory request and limit adjustment based on historical resource usage measurements. A VPA deployment has three main components: VPA Recommender, VPA Updater, and VPA Admission Controller. It is possible to replace the default VPA Recommender with a custom Recommender. CLEVER, an intelligent recommender, uses this feature to ensure the QoS or performance of the workloads are not compromised when you try to adjust the CPU frequencies of your cluster. Here’s how it works: assume you have a frequency tuner deployed in your cluster to update the frequency of the CPUs frequencies as per a target metrics or energy consumption budget.  Intuitively, when you lower down the frequencies, you do save energy but the performance of workloads also decreases. To counter this you can obtain information like ClusterState and CPU frequencies for the nodes after the frequencies were changed. CLEVER recomputes the new recommendation for CPU requests for pods managed by the VPA based on the updated CPU frequencies. That’s how CLEVER guarantees a similar QoS for a workload by lowering the frequencies to reduce energy but at the same time increasing CPU allocation.<br>
* Open Telemetry [High-quality, ubiquitous, and portable telemetry to enable effective observability](https://opentelemetry.io/)
* Green Metrics Tool [A holistic framework to measure the energy / co2 of your application.](https://docs.green-coding.berlin/)
* Cloud Carbon Footprint [Measure, monitor, and reduce carbon emissions from the cloud](https://www.cloudcarbonfootprint.org/docs/)
* [InfluxData Telegraf Collector](https://github.com/influxdata/telegraf) - an open source, plugin-based agent for collecting, processing, aggregating, and writing metrics. Includes multiple input plugins that help determine energy consumption, e.g. [intel_powerstat](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/intel_powerstat) (exposes CPU & DRAM power consumption, CPU temperature, TDP, CPU and uncore frequencies, C-State residencies), [ipmi_sensor](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/ipmi_sensor) (exposes IPMI sensor data), [redfish](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/redfish) (exposes CPU temperature, fan speed, power supply and voltage data as exposed by [DMTF's Redfish](https://redfish.dmtf.org/) interfaces), and a high number of plugins that help determine utilization of individual resources that in turn help identifying where the power is consumed. A rich set of available output plugins makes it easy to integrate with various metrics destinations.
* [Carbon QL](https://github.com/Green-Software-Foundation/carbon-ql) - The intent of this project is to build a single API codenamed carbonQL that you can use to measure your software emissions for every runtime environment.
* [Isotope](https://azuremarketplace.microsoft.com/en-en/marketplace/apps/avanade-5299580.amp_isotope_access?tab=overview) - Using [Azure Arc](https://azure.microsoft.com/en-us/products/azure-arc) to measure estimated carbon emissions.

## Compute Node
* [Cloud Carbon Footprint](https://www.cloudcarbonfootprint.org/) - Get to know the carbon footprint of your cloud usage - and reduce it.

<!-- ### Device and Power -->
<!--- TODO: add a diagram to illustrate computing devices and power draw --->

### Power Management
* Kubernetes Power Manager [Kubernetes Operator designed to expose and utilize Intel specific power management technologies in a Kubernetes Environment](https://github.com/intel/kubernetes-power-manager)

<!-- ## Energy Efficient Computing -->

### Scheduling 
* Power Driven Scheduling and Scaling with CPU telemetry in K8s [Power Driven Scheduling and Scaling with CPU telemetry in Kubernetes](https://github.com/intel/platform-aware-scheduling/tree/master/telemetry-aware-scheduling/docs/power)
* Energy aware scheduling [Paper] [Improving Data Center Efficiency Through Holistic Scheduling In Kubernetes](https://www.researchgate.net/publication/333062266_Improving_Data_Center_Efficiency_Through_Holistic_Scheduling_In_Kubernetes)
* Carbon-aware Kubernetes scheduler [Paper] [A Low Carbon Kubernetes Scheduler](http://ceur-ws.org/Vol-2382/ICT4S2019_paper_28.pdf)
* [Carbon Aware SDK](https://github.com/Green-Software-Foundation/carbon-aware-sdk): A [Green Software Foundation](https://greensoftware.foundation) project, to time-shift & region shift software to do more when the electricity is clean and do less when the electricity is dirty; by measuring the "Electricity Marginal Carbon Intensity (CO2eq/KHw)."

Batch scheduling according to power costs (carbon, money, et cetera)

### Scaling
* On-demand: Serverless
* Predictive VPA [Predictive Vertical Pod Autoscaler (VPA) recommenders pluggable with the default VPA on OpenShift](https://github.com/openshift/predictive-vpa-recommenders)
* CLEVER [Container Level Energy-efficient VPA Recommender pluggable with the default VPA on Kubernetes](https://github.com/sustainable-computing-io/clever)
* [Carbon Aware SDK](https://github.com/Green-Software-Foundation/carbon-aware-sdk): A [Green Software Foundation](https://greensoftware.foundation) project, to scale software to do more when the electricity is clean and do less when the electricity is dirty; by measuring the "Electricity Marginal Carbon Intensity (CO2eq/KHw)."

### Tuning
* Node tuning [Manage node-level tuning by orchestrating the tuned daemon](https://docs.openshift.com/container-platform/4.10/scalability_and_performance/using-node-tuning-operator.html)
* CPU tuning: x86, arm
* GPU tuning

### Sustainability Initiatives
* Green Software Foundation [Building a trusted ecosystem of people, standards, tooling and best practices for green software](https://greensoftware.foundation/)
  The Green Software Foundation (GSF) exists to change how we build software, [so there are zero harmful environmental effects](https://greensoftware.foundation/articles/theory-of-change-defining-strategy-gsf), a foundation with over 42 member organizations.
  Key pillars are Knowledge, Tech Culture, and Tooling; which are delivered through a [standards working group](https://standards.greensoftware.foundation/), an [open source working group](https://opensource.greensoftware.foundation/), a [community working group](https://community.greensoftware.foundation/), and a [policy working group](https://policy.greensoftware.foundation/).
  The GSF has created a [software carbon intensity (SCI)](https://github.com/Green-Software-Foundation/software_carbon_intensity) standard, which has been submitted to ISO (International Standards Organisation) for ratification, to ensure we measure carbon consistently. This standard is being implemented in code through the [Carbon Aware SDK](https://github.com/Green-Software-Foundation/carbon-aware-sdk) (a tool to do more when the energy grid is green, and less when it is dirty), the [Carbon Pipeline](https://github.com/Green-Software-Foundation/Carbon_CI_Pipeline_Tooling) (measuring carbon in the CICD process, and [CarbonQL](https://github.com/Green-Software-Foundation/carbon-ql) - a standardized API for measuring carbon according to the SCI standard.
* Equinix [Article] ["Equinix Prices $1.2 billion of Green Bonds in its Fourth Offering to Advance Sustainability Initiatives"](https://www.equinix.com/newsroom/press-releases/2022/04/equinix-prices-1-2-billion-of-green-bonds-in-its-fourth-offering-to-advance-sustainability-initiatives)
* Etsy and Cloud carbon footprint.org [Cloud Carbon Footprint - Methodology](https://www.cloudcarbonfootprint.org/docs/methodology/)
* LF Energy [Leading the energy transition through global open source collaboration](https://www.lfenergy.org/)
* Energy Efficient High Performance Computing Working Group [Encourages implementation of energy conservation measures, energy efficient design in high performance computing (HPC)](https://eehpcwg.llnl.gov/)
* [Green Software Training](https://learn.greensoftware.foundation/) - This initiative will teach you how to build, maintain and run greener applications irrespective of the application domain, industry, organization size or type, programming language, or framework; leading to a [Green Software Certification](https://training.linuxfoundation.org/training/green-software-for-practitioners-lfc131/) backed by the Linux Foundation.
* Linux Foundation's SustainabilityCon [The first sustainability-focused track by the Linux Foundation](https://events.linuxfoundation.org/open-source-summit-north-america/about/sustainabilitycon/)

### Emissions Reports

### Carbon Emissions Reports

* IEA [Emissions - Global Energy and CO2 Status Report 2019](https://www.iea.org/reports/global-energy-co2-status-report-2019/emissions)
* European Environment Agency [EU Greenhouse Emission Intensity](https://www.eea.europa.eu/ims/greenhouse-gas-emission-intensity-of-1)
* electricityMap's [real-time CO2 emission data](https://app.electricitymap.org)
* [SCI Reporting](https://github.com/Green-Software-Foundation/sci-reporting) - Creating the infrastructure, and processes to store, host, and publicly report SCI scores, and other related reporting requirements within the SCI specification. 
* WattTime API [Provides insight into a electricity grid’s marginal emissions rate](https://www.watttime.org/api-documentation/#introduction)

### Net Zero / Carbon Neutrality

* The Climate Pledge [Net-Zero Carbon by 2040](https://www.theclimatepledge.com/)
* WeTransfer [WeTransfer becomes Climate Neutral](https://wetransfer.com/blog/story/breaking-the-climate-neutral-barrier/)
* Adrian Cockroft, ex-Amazon VP of Sustainability Architecture ["Cloud computing pioneer's new focus is on sustainability transformation"](https://www.aboutamazon.com/news/sustainability/cloud-computing-pioneers-new-focus-is-on-sustainability-transformation)
* Supercritical [Helping businesses achieve net zero](https://gosupercritical.com/)

### HPC Specific Models

* OSTI [Metrics for Evaluating Energy Saving Techniques for Resilient HPC Systems](https://www.osti.gov/servlets/purl/1140455)
* GEOPM [Extensible Power Manager](https://geopm.github.io):<br>
The Global Extensible Open Power Manager (GEOPM) is a framework for
exploring power and energy optimizations on heterogeneous platforms.
The GEOPM software is split into two packages: The GEOPM Service and
the GEOPM Runtime. The GEOPM Service provides user-space access to low
level hardware metrics and configuration knobs. The GEOPM Runtime
leverages the GEOPM Service to tune hardware settings in reaction to
hardware metrics and application feedback. The application feedback is
collected through light weight asynchronous profiling hooks injected
with callbacks into middle-ware packages. The GEOPM Runtime has a
plugin architecture for selecting between optimization
algorithms. Some of the built in algorithms target energy efficiency,
and others optimize performance within a power bound.  The port of
GEOPM to Kubernetes is ongoing. There is an [experimental
branch](https://github.com/geopm/geopm/tree/cloud#experimental-branch)
called ``cloud`` with implementations of new features that support
Kubernetes.  These features will be migrated into the main ``dev``
branch as they each become production ready. Additional documentation
may be found in the [service readme
file](https://github.com/geopm/geopm/tree/cloud/service#kubernetes-support)
and in the [runtime k8
directory](https://github.com/geopm/geopm/tree/cloud/k8).

### Programming Language Efficiency Analysis

* Energy Efficiency of Languages [The complete set of tools for energy consumption analysis of programming languages, using Computer Language Benchmark Game](https://github.com/greensoftwarelab/Energy-Languages)
