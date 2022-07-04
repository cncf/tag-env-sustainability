# Current Sustainability Efforts and Use Cases Within the Cloud Native Landscape

### Contributors
Huamin Chen, Marlow Weston, Niki Manoledaki

<!-- ## Use Cases -->
## Use Cases
<!--- TODO: add in details on these use cases --->

## Layers of the solutions

We can divide a system up into three general areas.  The first is what datacenter to use, if you have options.  The second is where to place the workload once you have chosen a datacenter.  The third is how to manage the resources on the node where you have chosen to place the resource.  All of these elements can be looked at individually.

### Intelligently choosing which datacenter to schedule on according to environmental impact, time of day, et cetera

#### Telemetry

#### Current Research

#### Current developed projects

### Within a datacenter, scheduling effectively according to workload, availability, and urgency of workload

#### Telemetry

#### Current Research

#### Current developed projects

### Within a node, optimizing resources to handle workload specifications (which may include performance parameters) while minimizing resource consumption

#### Telemetry

#### Current Research

#### Current developed projects

## Current Landscape
<!-- ## Telemetry -->

<!--- TODO: add a diagram to illustrate data center composition --->

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
* Power Driven Scheduling and Scaling with CPU telemetry in K8s[Power Driven Scheduling and Scaling with CPU telemetry in Kubernetes](https://github.com/intel/platform-aware-scheduling/tree/master/telemetry-aware-scheduling/docs/power)
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
* Equinix [Article] ["Equinix Prices $1.2 billion of Green Bonds in its Fourth Offering to Advance Sustainability Initiatives"](https://www.equinix.com/newsroom/press-releases/2022/04/equinix-prices-1-2-billion-of-green-bonds-in-its-fourth-offering-to-advance-sustainability-initiatives)
* Etsy and Cloud carbon footprint.org [Cloud Carbon Footprint - Methodology](https://www.cloudcarbonfootprint.org/docs/methodology/)
* LF Energy [Leading the energy transition through global open source collaboration](https://www.lfenergy.org/)
* Energy Efficient High Performance Computing Working Group [Encourages implementation of energy conservation measures, energy efficient design in high performance computing (HPC)](https://eehpcwg.llnl.gov/)

### Emission Reports

* IEA [Emissions - Global Energy and CO2 Status Report 2019](https://www.iea.org/reports/global-energy-co2-status-report-2019/emissions)
* European Environment Agency [EU Greenhouse Emission Intensity](https://www.eea.europa.eu/ims/greenhouse-gas-emission-intensity-of-1)

### HPC Specific Models

* OSTI [Metrics for Evaluating Energy Saving Techniques for Resilient HPC Systems](https://www.osti.gov/servlets/purl/1140455)
* geopm [Extensible Power Manager](https://github.com/geopm/geopm)

### Programming Languages

* Energy Efficiency of Languages [The complete set of tools for energy consumption analysis of programming languages, using Computer Language Benchmark Game](https://github.com/greensoftwarelab/Energy-Languages)
