---
title: "Reduce, Reuse, Rebase: Sustainable Containers with Buildpacks"
description: Buildpacks are the greenest choice for container builds
slug: 2023-11-reduce-reuse-rebase-buildpacks
weight: 1
date:   2023-11-17 00:00:00 +0000
author: Joe Kutner
---

Container builds can be very wasteful. Every operating system update, new dependency version, and toolchain upgrade results in copious amounts of energy used to build and rebuild our container images; often unnecessarily. It can be costly at scale, which is why Cloud Native Buildpacks were designed to perform builds as efficiently as possible.

Buildpacks are the greenest choice for container builds because the rebaseable layers and advanced caching mechanisms they provide can prevent many images from being rebuilt at all. That's a big shift from many cloud native technologies that assume unlimited resources are available in the cloud.

<p class="mt-5 mb-5"><img src="/images/blogs/2023-11-reduce-reuse-rebase-buildpacks/cnb-green-logo.png" alt="CNB logo with recycling"></p>

## On the Environmental Impact of Cloud Native

Prior to the emergence of the cloud native ecosystem and widespread use of container images, we deployed our applications in servers built from machine images that were updated infrequently and on a different cadence from the application itself.

Today, many applications are coupled to the operating system and its packages because they use a Dockerfile to define their container images. As a result, those images frequently need rebuilds to apply patches to OS-level components, or simply to update tools that aren't even used by the application. Even worse, the layer caching mechanism imposed by Dockerfile forces us to frequently rebuild layers that don't even need to be rebuilt.

The cloud-native ecosystem has brought great productivity and operational improvements to software development. But we've lost sight of how wasteful some of those technologies can be.
Buildpacks, on the other hand, have been designed to work at a scale (i.e. tens millions of images) where being wasteful has real costs. That's why the Buildpacks rebase mechanism requires almost no resources.

## Reduce, Reuse, Rebase

Container images built from a Dockerfile require a full build when a new operating system update is available, even if your app doesn't required a re-compile or re-install to work with the update (i.e. the update is [ABI compatible](https://en.wikipedia.org/wiki/Application_binary_interface)). 

<p class="mt-5 mb-5"><img src="/images/blogs/2023-11-reduce-reuse-rebase-buildpacks/cnb-new-base.png" alt="Updating the operating system of a container image requires a rebuild if you're using Dockerfile"></p>

Updating the operating system of a container image requires a rebuild if you're using Dockerfile.But this isn't the case with Buildpacks.

<p class="mt-5 mb-5"><img src="/images/blogs/2023-11-reduce-reuse-rebase-buildpacks/cnb-rebase.png" alt="Buildpacks rebase constructs a new container image using existing layers, without the need for build"></p>

Rebase allows app developers or operators to rapidly update an app image when its run image has changed. By using image layer rebasing, this command avoids the need to fully rebuild the app.

Buildpacks rebase constructs a new container image using existing layers, without the need for build.At its core, image rebasing is a simple process. By inspecting an app image, rebase can determine whether or not a newer version of the app's base image exists (either locally or in a registry). If so, rebase updates the app image's layer metadata to reference the newer base image version. This is essentially a an operation that edits a JSON file. It takes milliseconds and uses very little compute resources. 

You can [learn more about rebase in the Buildpacks documentation](https://buildpacks.io/docs/concepts/operations/rebase/). But rebase isn't the only Buildpacks mechanism that's more sustainable that Dockerfile builds. Buildpacks can cache build artifacts to enable incremental compiliation, and other resource saving techniques. These cache layers won't always be discarded when you do require a re-build, like they would with Dockerfile builds.

## Be As Green As Your Unit Tests

Container builds are in no way the biggest offender when it comes to the environmental impact of software. Electricity needed to mine bitcoin is [more than used by entire countries](https://www.theguardian.com/technology/2021/feb/27/bitcoin-mining-electricity-use-environmental-impact). But the growth of software that uses cryptographic techniques has brought new awareness to how our code affects the world around us. That's a good thing.

We have a responsibility to think about the waste and sustainability of the software we produce. The code we write has an impact on the world, and our choices matter.

To learn more about the relationship between open source software development any the environment, visit the [Environmental Sustainability Technical Advisory Group (TAG)](https://tag-env-sustainability.cncf.io/)
