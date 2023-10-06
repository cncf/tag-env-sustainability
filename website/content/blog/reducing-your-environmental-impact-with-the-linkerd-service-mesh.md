---
title: Reducing your environmental impact with the Linkerd service mesh
description: Linkerd has always focused on having the smallest possible resource footprint. That makes it not only the most efficient and cost-effective service mesh on the market but also the most sustainable one. That's because Linkerd helps minimize emissions on various levels.
slug: 2023-reducing-env-impact-with-linkerd
weight: 1
date:   2023-10-10 10:00:00 +0000
author: Catherine Paganini
---
*Guest post as part of the [cloud native sustainability week](https://tag-env-sustainability.cncf.io/cloud-native-sustainability-week/)*

In the complex world of service meshes, Linkerd is known for its simplicity. But Linkerd has also focused on having the smallest possible resource footprint since its inception. That makes it not only the most efficient and cost-effective service mesh on the market but also the most sustainable one. In fact, due to its intelligent load balancing, adding Linkerd to your stack can actually reduce the overall resource footprint of your system as a whole. Too good to be true? It sounds like it, but it actually pans out. 

##  Resource consumption, a great proxy for environmental impact 

Sustainability is, unfortunately, still an afterthought when it comes to computer systems. That's why we are thrilled to see the TAG for Environmental Sustainability shining a light on this important topic and pushing for change. This lack of focus also means that we don't yet have a really precise way of measuring the environmental impact of our systems. However, there is a good proxy for it: resource consumption. Generally speaking, the more resources your system consumes, the higher the environmental impact. 


##  Linkerd's Rust-based micro-proxy

Almost every service mesh other than Linkerd uses the Envoy proxy — a powerful proxy that can do much more than a service mesh needs. While Envoy is a great project, using a big general-purpose proxy for a very narrow use case, like the service mesh, is very inefficient. 

Linkerd took a different approach. It is the only service mesh with a [purpose-built micro-proxy written in Rust](https://linkerd.io/2020/12/03/why-linkerd-doesnt-use-envoy/). It was designed specifically for service mesh use cases, and because the range of features needed is very specific, the Linkerd proxy is the smallest and most resource-efficient service mesh proxy. It uses only a [tenth of the resources (CPU and memory) that Envoy does](https://linkerd.io/2021/11/29/linkerd-vs-istio-benchmarks-2021/index.html). (While "sidecar-less" service meshes exist, they work by deploying larger, per-host proxies and come with significant security and operational caveats — see our writeup on [eBPF, sidecars, and the future of the service mesh](https://buoyant.io/blog/ebpf-sidecars-and-the-future-of-the-service-mesh)).  

##  Additional software = bigger resource footprint? Not necessarily.   

Each additional piece of software translates into consuming more system resources, right? In theory, yes, but if it helps you run your system more efficiently, you may actually decrease your footprint. 

The environmental impact of adding features such as zero-config and in-transit encryption (mTLS), as provided by Linkerd, is not zero — no software is. Whether you think that environmental (and financial) cost is viable or reasonable is a different discussion. You might be surprised to hear that Linkerd can minimize your impact even when compared to no service mesh. This efficiency gain is thanks to Linkerd's intelligent load balancing. Let's take a step back and examine how Kubernetes works first.

##  Distributing work improves with Linkerd over Native Kubernetes

Kubernetes allows us to more densely pack processes on computers. Servers have a certain capacity to do work, but there is always a gap between how much work they _can_ do and how much the system asks them to do. Kubernetes schedules work more efficiently on existing servers (bin packing), allowing us to run more stuff on the same hardware — a big win! 

Linkerd improves those efficiency gains even further by taking a different approach to endpoint selection. While Kubernetes balances its load based on connections, Linkerd instead does it based on requests. As a result, Linkerd saves you significant compute resources. Let's break that down.  

In the old world, applications would make one connection, send a request, get an answer, and close that connection — not very efficient when you have hundreds or thousands of requests per minute. Today, HTTP/2 and gRPC make a connection once and send multiple requests to avoid this inefficiency.

Kubernetes doesn't handle that out-of-the-box, though. Natively, Kubernetes simply directs the entire connection to a Pod and doesn't worry about how many requests are coming down the connection. This can be problematic: if you're running 10 Pods for a particular workload, and 50 requests come down a single connection, Kubernetes will send all 50 to the same single Pod. In the best case, the other nine Pods just sit idle; in the worst case, the one Pod doing all the work wasn't sized for this peak load and crashes.

This inefficiency happens because Kubernetes wasn't designed to look inside the connection and decipher each request – doing so requires a lot of knowledge of what exact protocol is being spoken, and is far out of scope for Kubernetes itself. As Kelsey Hightower famously said, "[Kubernetes is a platform for building platforms](https://twitter.com/kelseyhightower/status/935252923721793536)" – Kubernetes never intended to solve that particular problem since other projects could.

##  Minimizing unusable resources 

Imagine you want to fill up a box with rocks. The smaller the rocks, the less wasted space (air gaps between rocks). The same applies to Pods: sizing by peak demand tends to leave much larger amounts of unused capacity, requiring more Pods and costing you money. Allowing sizing of Pods by average demand instead of peak demand leverages more of your existing resources by not forcing you to reserve unused capacity, improving your horizontal scalability by allowing you to run more smaller Pods during peak loads.

This means that under load, Linkerd can distribute traffic across Pods much more effectively since it _does_ do the work to understand the protocol and be able to load-balance individual requests. This allows you to assign fewer compute resources to each Pod because you know the load will be equally distributed, and you, therefore, don't have to dedicate huge amounts of resources to the possibility of huge spikes. For example, Entain Australia, a sports betting company, wrote a great [CNCF case study on how Linkerd helped them significantly reduce latency and cost](https://www.cncf.io/case-studies/entain/) thanks to intelligent load balancing. 

This approach is not only more resource-efficient and environmentally friendly, requests are also processed faster because they aren't stuck in an overloaded pod queue. And since Linkerd is deliberately trying to choose low-latency Pods, the overall user experience can be better since overall latency is reduced.

##  Simplicity = sustainability

As we've seen, Linkerd can help you minimize your resource footprint in various ways. First, its small Rust micro-proxy makes it ten times more resource-efficient than Envoy-based alternatives (basically every other service mesh). Thanks to its intelligent load balancing, you can improve overall resource usage compared to using no service mesh. While the Linkerd team didn't set out to build the most sustainable service mesh on the market, our[ focus on simplicity and resource efficiency](https://linkerd.io/design-principles/) made it so. Sustainability is certainly an important area that is finally getting more attention. We are proud that our design principles align well with the TAG for Environmental Sustainability's mission — even if it was more accidental than planned. 

_Thanks to Jason Morgan and Flynn for walking me through everything. I learned a lot and hope readers will, too._ 
