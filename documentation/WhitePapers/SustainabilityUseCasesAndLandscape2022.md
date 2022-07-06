# Current Sustainability Efforts and Use Cases Within the Cloud Native Landscape

### Contributors
Huamin Chen, Marlow Weston, Niki Manoledaki, Eun Kyung Lee


<!-- 
Formatting convention:
## for top level topic
### for sub level topics and so on
-->

<!-- ## Use Cases -->
## Use Cases
<!--- TODO: add in details on these use cases --->
### Green/sustainable computing

System architecture and designs to optimize resource consumption, reduce environmental impact, and improve sustainability

### Carbon/Energy Accounting

System, services, and methodology to track and account carbon/energy consumption.

## Challenges for Carbon/Energy Accounting
Carbon emission for the Cloud computing system is largely composed of operational and embodied (or embeded) carbon emission. The operational carbon emissionis the amount of carbon pollution emitted during the operational or in-use phase of a Cloud computing system. The embodied carbon emission is the amount of carbon pollution emitted during the creation and disposal of Computing system (e.g., device, chip, servers, and etc.)

Quantifying the operational carbon emission is not trivial because of the following reasons:

* Multiple HW components enclosed in a server - power modeling is required for various HW components (e.g., CPU, Memory, GPU, Storage, I/O) for accurate quantification/estimation.

* Different HW for a service is used by multiple users/accounts –power modeling per different user (e.g., a/multiple software thread(s)) is a totally different problem for modeling. The SW/HW interaction should be well-understood for power modeling.

* Different generations/architecture/vendors of HW in Cloud Infrastructure - power modeling is required for different generations/architecture/vendors for example, Intel vs. AMD vs. ARM, Skylake vs. Sapphire Rapids, and ConnectX-5 vs. ConnectX-6.

* Dependencies of the services - a service may use different services. (e.g., Kubernetes uses COS service), applications may be distributed across datacenters and clouds.

* Services running in virtualized/containerized environments - power modeling is required for virtualized/containerized environments, which increases the complexity of modeling

* Separate fan/cooling controller in the server – The fan and other cooling components are often controlled by a separate controller, which requires additional modeling.

* Missing data – due to the limitation of exposing internal data in Cloud, accessing the key data to calculate the operation emission is prohibited. On-Prem data centers are sometimes lacking power measurement technology.

* Telemetry/ observability – a user often uses multiple hardware at the same time, reliable and high-granularity telemetry becomes more important. However, telemetry/observability overhead should be low relative to the services being executed on the server/cloud.

* AI/ML workloads – dramatic increase in using Artificial Intelligence (AI)/ Machine Learning (ML) workload leads to the strong need of dedicated GPU-based clusters. The characteristics of such workloads are different than traditional workloads and their power consumptions are significantly higher.

Quantifying embedded carbon emissions is also very challenging as manufactural details should be incorporated into the quantification. This is currently not the scope of this white paper. [We may want to put some directions though // +1, would this be guidance/best practice on methods to quantify these emissions or guidance on methods to mitigate these emissions?]

## Layers of the solutions

We can divide a system up into three general areas.  The first is what datacenter to use, if you have options.  The second is where to place the workload once you have chosen a datacenter.  The third is how to manage the resources on the node where you have chosen to place the resource.  All of these elements can be looked at individually.



| Area | Goal | Efforts |
| -------- | -------- | -------- |
| Multi Data Centers     | Intelligently choosing which datacenter to schedule on according to environmental impact, time of day, et cetera     |  Cluster Management    |
| Within Data Center     | Scheduling effectively according to workload, availability, and urgency of workload     | Power Management, K8S Scheduler Plugin   |
| Within a node     | Optimizing resources to handle workload specifications (which may include performance parameters) while minimizing resource consumption     |  Node Tuning, Pod Scaling    |


## Current Research

## Current Projects



## Current Landscape
<!-- ## Telemetry -->

<!--- TODO: add a diagram to illustrate data center composition --->
### Telemetry

### Cooling / BMC
* OCP Cooling Telemetry [Improve data center cooling facility efficiency through platform power telemetry](https://www.opencompute.org/documents/ocp-wp-dcf-improve-data-center-cooling-facility-efficiency-through-platform-power-telemetryr1-0-final-update-pdf)
* BMC Telemetry [Exposes Baseboard Management Controller data in Prometheus format.](https://github.com/gebn/bmc_exporter)
* (thermal???)

<!-- ### Software Agent -->

<!--- TODO: add a diagram to explain the relationship between workload and power sources  --->

### Methodology
* Runtime system power consumption estimate [Run-time estimation of system and sub-system level power consumption](https://en.wikipedia.org/wiki/Run-time_estimation_of_system_and_sub-system_level_power_consumption)

### Software Agent
* gProfiler [OS code profiling tool to visualize applications' execution sequences and resource usage down to the line of code level](https://docs.gprofiler.io/)
* Energy Consumption Metrology Agent [Energy consumption metrology agent](https://github.com/hubblo-org/scaphandre)
* PowerAPI [Python framework for building software-defined power meters](https://github.com/powerapi-ng/)
* Kubernetes Efficient Power Level Exporter [Kepler (Kubernetes-based Efficient Power Level Exporter) uses eBPF to probe energy related system stats and exports as Prometheus metrics](https://github.com/sustainable-computing-io/kepler)
* Open Telemetry [High-quality, ubiquitous, and portable telemetry to enable effective observability](https://opentelemetry.io/)
<!-- 
## Compute Node -->

<!-- ### Device and Power -->
<!--- TODO: add a diagram to illustrate computing devices and power draw --->

### Power Management
* Kubernetes Power Manager[Kubernetes Operator designed to expose and utilize Intel specific power management technologies in a Kubernetes Environment](https://github.com/intel/kubernetes-power-manager)

<!-- ## Energy Efficient Computing -->

### Scheduling 
* Power Driven Scheduling and Scaling with CPU telemetry in K8s [Power Driven Scheduling and Scaling with CPU telemetry in Kubernetes](https://github.com/intel/platform-aware-scheduling/tree/master/telemetry-aware-scheduling/docs/power)
* Energy aware scheduling [Paper] [Improving Data Center Efficiency Through Holistic Scheduling In Kubernetes](https://www.researchgate.net/publication/333062266_Improving_Data_Center_Efficiency_Through_Holistic_Scheduling_In_Kubernetes)
* Carbon-aware Kubernetes scheduler [Paper] [A Low Carbon Kubernetes Scheduler](http://ceur-ws.org/Vol-2382/ICT4S2019_paper_28.pdf)

Batch scheduling according to power costs (carbon, money, et cetera)

### Scaling
* On-demand: Serverless
* VPA [Vertical Pod Autoscaler (VPA) recommenders pluggable with the default VPA on OpenShift](https://github.com/openshift/predictive-vpa-recommenders)

### Tuning
* Node tuning [Manage node-level tuning by orchestrating the tuned daemon](https://docs.openshift.com/container-platform/4.10/scalability_and_performance/using-node-tuning-operator.html)
* CPU tuning: x86, arm
* GPU tuning

<!-- # Current Research/Initiaives -->

### Sustainability Initiatives
* Green Software Foundation [Building a trusted ecosystem of people, standards, tooling and best practices for green software](https://greensoftware.foundation/)
* Equinix [Article] ["Equinix Prices $1.2 billion of Green Bonds in its Fourth Offering to Advance Sustainability Initiatives"](https://www.equinix.com/newsroom/press-releases/2022/04/equinix-prices-1-2-billion-of-green-bonds-in-its-fourth-offering-to-advance-sustainability-initiatives)
* Etsy and Cloud carbon footprint.org [Cloud Carbon Footprint - Methodology](https://www.cloudcarbonfootprint.org/docs/methodology/)
* LF Energy [Leading the energy transition through global open source collaboration](https://www.lfenergy.org/)
* Energy Efficient High Performance Computing Working Group [Encourages implementation of energy conservation measures, energy efficient design in high performance computing (HPC)](https://eehpcwg.llnl.gov/)

### Emissions Reports

* IEA [Emissions - Global Energy and CO2 Status Report 2019](https://www.iea.org/reports/global-energy-co2-status-report-2019/emissions)
* European Environment Agency [EU Greenhouse Emission Intensity](https://www.eea.europa.eu/ims/greenhouse-gas-emission-intensity-of-1)

### Net Zero / Carbon Neutrality

* The Climate Pledge [Net-Zero Carbon by 2040](https://www.theclimatepledge.com/)
* WeTransfer [WeTransfer becomes Climate Neutral](https://wetransfer.com/blog/story/breaking-the-climate-neutral-barrier/)
* Adrian Cockroft, Amazon VP of Sustainability Architecture ["Cloud computing pioneer's new focus is on sustainability transformation"](https://www.aboutamazon.com/news/sustainability/cloud-computing-pioneers-new-focus-is-on-sustainability-transformation)
* Supercritical [Helping businesses achieve net zero](https://gosupercritical.com/)

### HPC Specific Models

* OSTI [Metrics for Evaluating Energy Saving Techniques for Resilient HPC Systems](https://www.osti.gov/servlets/purl/1140455)
* geopm [Extensible Power Manager](https://github.com/geopm/geopm)

### Programming Languages

* Energy Efficiency of Languages [The complete set of tools for energy consumption analysis of programming languages, using Computer Language Benchmark Game](https://github.com/greensoftwarelab/Energy-Languages)
