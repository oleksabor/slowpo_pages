---
layout: post
title: several Rebus subscribers for the same event
date: 2021-09-09 16:15 +03:00
tags: [c#]
category: dev
description: configure Rebus to publish one event for several subscriber instances
---

Today I've learned that 
[Rebus events are not sent for all subscriber instances by default](https://stackoverflow.com/questions/57366162/rebus-subscribing-to-events-in-asp-net-core).

> When you subcsribe to an event, you're binding the topic to the subscriber's input queue. 
If you have two distinct subscribers, they should have different input queue names, and then they will each get a copy of the event

So you should configure Rebus to allow `subscriber1` and `subscriber2` to consume the same `SampleEvent` message.

There is [Rebus multiple subscribers sample](https://github.com/rebus-org/RebusSamples/tree/master/PubSubCentralized) available.

The sample shows dedicated input queue configuration for each subscriber and publish messages instead of sending.

To have the same message consumed by two subscribers you have to configure:
* unique queue per subscriber 
  
  `_.Transport(t => t.UseSqlServer(transportOptions, queue));`

  the `queue` name should be unique for each subscriber 
* run `IBus.Subscribe<T>` when subscriber is ready for incoming messages.
  The `Subscribe` should be executed to configure `topic` to `address` subscription.  
* `IBus.Publish` should be executed to broadcast event to all queues
* Type based routing on each subscriber for the same destination address

  `_.Routing(r => r.TypeBased().Map<SampleEvent>("sampleEvent"));`
* centralized subscriptions storage (optional)

  `_.Subscriptions(s => s.StoreInSqlServer(connection, "sampleEventSubs", isCentralized: true));`
  
  however the [Azure bus sample](https://github.com/rebus-org/RebusSamples/tree/master/PubSubNative) does not require this step e.g.

The centralized subscriptions SQL store has list of subscribers queue names (aka `addresses`) and message types (aka `topics`) to be published to.

The Azure Service Bus has in-built topic routing feature to copy event for each subscriber and this feature is used by Rebus.
