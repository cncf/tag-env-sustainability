---
title: "Event Wrap-Up: First Tokyo Local Meetup in CNCF Cloud Native Sustainability Week 2024"
description: "An event wrap-up blog post for Cloud Native Sustainability Week 2024 - Local Meetup Tokyo."
slug: 2024-10-cloud-native-sustainability-week-2024-tokyo
weight: 1
date:   2024-10-08 10:00:00 +0000
author: Sunyanan Choochotkaew (photo by Tatsuhiro Chiba and Damien Roux)
---

We are thrilled to share the highlights from organizing the first-time [Tokyo Local Meetup](https://community.cncf.io/events/details/cncf-cloud-native-community-japan-presents-cncf-cloud-native-sustainability-week-2024-local-meetup-tokyo/) hosted by [Cloud Native Community Japan (CNCJ)](https://community.cncf.io/cloud-native-community-japan/) during TAG ENV's [CNCF Cloud Native Sustainability Week 2024](https://tag-env-sustainability.cncf.io/events/cloud-native-sustainability-week/)! This event brought together passionate individuals from the tech community, united by a shared commitment to promoting sustainability through cloud-native and open-source practices. During the three hours, we delivered three keynotes, three lightning talks, and two engaging demos, along with ample networking time, all complemented by food and beverages generously sponsored by NTT DATA, Hitachi, and The Linux Foundation.

<p class="mt-10 mb-10"><img src="/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/groupphoto.jpg"></p>

## Keynote Highlights

Our first keynote speaker is *Kenta Sato*, who transitioned from a professional baseball player to a solution architect at AWS Japan. He opened our event with an engaging keynote titled *“AWSのサステナビリティへの取り組みのご紹介,”* highlighting AWS's multifaceted approach to sustainability. His insights showcased how the company’s commitment to sustainability serves as a powerful example for others in the industry. He emphasized three crucial perspectives: cloud sustainability, sustainability within the cloud, and leveraging cloud technology to promote sustainability. The [AWS Well-Architected Sustainability Workshop](https://catalog.workshops.aws/well-architected-sustainability/en-US) is an essential resource he left behind for attendees looking to incorporate sustainable practices into their cloud workloads.

Next, continuing from KubeDay Japan, *Hidetsugu Sugiyama*, Chief Technology Strategist at Red Hat, introduced the [IOWN Global Forum](https://www.linuxfoundation.jp/press-release/2023/06/linux-foundation-and-iown-global-forum-to-collaborate-for-future-smart-connected-world/)'s groundbreaking technology, particularly focusing on **Composable Disaggregated Infrastructure (CDI)** in comparison to off-the-shelf devices. He emphasized the importance of collecting common metrics at each layer for energy efficiency-aware optimization and highlighted that **Data-Centric Infrastructure as a Service (DCIaaS)** is a promising solution for developing energy efficiency aware program. Additionally, a wealth of resources from the IOWN Global Forum was shared, providing valuable insights for attendees.

Last but not least, our last keynote, *Yasumasa Suenaga*, Technical Lead at NTT DATA, underscored the pressing need for sustainability within IT and outlined [NTT DATA's vision for achieving a sustainable future by 2040](https://www.nttdata.com/global/en/news/press-release/2023/june/ntt-data-formulates-new-vision-for-net-zero-ghg-emmissions-by-2040). Suenaga emphasized the importance of the [Green Software Foundation (GSF)](https://greensoftware.foundation)’s initiatives, demonstrating that integrating sustainability into software practices is crucial for reducing the overall carbon footprint of IT systems. He encouraged attendees to explore the **Green Software for Practitioners** course, [now available also in Japanese](https://training.linuxfoundation.org/ja/training/green-software-for-practitioners-lfc131-jp/), and introduced the open-source, GSF’s Carbon Aware SDK.

![Sato Kenta](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/keynote1.jpg) | ![Hidetsugu Sugiyama](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/keynote2.jpg) | ![Yasumasa Suenaga](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/keynote3.jpg) |
|---|---|---|

## Lightning Talks 
After an hour of keynotes, we’ll pick up the pace with some dynamic moments featuring 3-minute lightning talks packed with impactful content. We have three speakers, *Scott Trent*, *Akiho Miyamura*, and *Ohri Yamaguchi*. 

Scott introduced the [SusQL operator](https://github.com/sustainable-computing-io/susql-operator/tree/main), of which he is a top contributor. SusQL integrates together with the energy metric collectors like Kepler and carbon emission API like Carbon Aware SDK to aggregate energy consumption and carbon emissions for user-specified workloads, particularly in AI model training. 

Akiho showcased how to use [Kepler](https://github.com/sustainable-computing-io/kepler) to monitor the energy consumption of local large language models on Kubernetes. His findings revealed that Llama 3.2B actually consumes more energy than Gemma 2.9B when processing the same prompt, highlighting some surprising trends in energy usage among different models. 

Lastly, we have Ohri presenting the newly announced [Carbon Footprint of Products (CFP) calculation rule](https://www.kankyouclub.or.jp/activity/doc/CFPCalculationRule_v1.1.pdf), developed through collaboration among nine companies at the Life Cycle Assessment Society of Japan (LCA) in March 2024. He demonstrated how to implement this rule using cloud providers and measurement tools like Kepler, and he also discussed the remaining challenges that need to be addressed.

![Scott Trent](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/lt1.jpg) | ![Akiho Miyamura](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/lt2.jpg) | ![Ohri Yamaguchi](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/lt3.jpg) |
|---|---|---|

## Demos and Networking
During the remaining hour of the networking session, we allowed attendees to engage in free-form networking and drive the conversation themselves. We initiated discussions with two side-by-side demonstrations: the [Carbon Aware SDK](https://carbon-aware-sdk.greensoftware.foundation) from *Yasumasa Suenaga* and the [SusQL](https://github.com/sustainable-computing-io/susql-operator/tree/main) from *Scott Trent*. These demonstrations showcased practical tools that attendees can utilize to enhance their sustainability initiatives.
The networking event fostered an open exchange of ideas, encouraging participants to share their experiences and insights. The unconference group discussions were particularly engaging, allowing attendees to delve deeper into topics of mutual interest and explore collaborative opportunities.

![Scott Trent](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/demo1.jpg) | ![Yasumasa Suenaga](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/demo2.jpg) |
|---|---

<p class="mt-10 mb-10 ml-10 mr-10"><img src="/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/networking1.jpg" alt="Networking session"></p>

![organizer](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/networking2.jpg) | ![group](/images/blogs/2024-10-cloud-native-sutainability-week-tokyo/networking3.jpg) |
|---|---

## Closing Thoughts
As we wrap up this event, we are grateful to all speakers, sponsors, attendees, and organizing members who made this gathering a success. The discussions sparked here will surely influence the future of sustainability in technology. We look forward to seeing how our collective efforts will continue to shape a more sustainable future, particularly in the cloud-native computing and open-source area!

## Call to Action
* **Check Out the Highlights from Our Keynotes:**
  * [AWS Well-Architected Sustainability Workshop](https://catalog.workshops.aws/well-architected-sustainability/en-US)
  * [IOWN Global Forum's Technology](https://iowngf.org/technology/)
  * [Green Software for Practitioners Course](https://training.linuxfoundation.org/ja/training/green-software-for-practitioners-lfc131)
* **Takeaways from Lightning Talks and Demos:**
  * Explore related open source projects:
    * [Kepler](https://github.com/sustainable-computing-io/kepler)
    * [SusQL operator](https://github.com/sustainable-computing-io/susql-operator/tree/main)
    * [Carbon Aware SDK](https://carbon-aware-sdk.greensoftware.foundation)
  * Learn about the [Carbon Footprint of Products (software) - CFP](https://www.kankyouclub.or.jp/activity/doc/CFPCalculationRule_v1.1.pdf)
* **Connect with Cloud Native Community Japan (CNCJ):**
  * Join the [Cloud Native Community Japan (CNCJ)](https://community.cncf.io/cloud-native-community-japan/)
  * Follow CNCJ Social Media
    * LinkedIn: [CNCJ LinkedIn Group](https://www.linkedin.com/groups/14517684/)
    * X: [@CloudNativeComm](https://x.com/CloudNativeComm)
* **Stay Updated with CNCF TAG Environmental Sustainability (TAG ENV):**
  * Join the conversation on Slack: CNCF Slack with *#tag-environmental-sustainability* and *#tag-env-cloud-native-sustainability-week*
  * Connect with TAG ENV on 
    * LinkedIn: [CNCF TAG Environmental Sustainability](https://www.linkedin.com/company/cncf-tag-environmental-sustainability/)
    * X: [@CNCFEnvTAG](https://x.com/CNCFEnvTAG)
