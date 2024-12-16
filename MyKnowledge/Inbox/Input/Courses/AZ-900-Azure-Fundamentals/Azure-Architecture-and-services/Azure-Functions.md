---
tags: microsoft azure cloud functions devops
date: 01-10-2024
---

# Azure Functions
- Is an event-driven serverless compute option that doesn't require maintaining VMs or containers
- If you build an app using VMs or containers those resources have to be "running" in order for your app to function.
- An event wakes the function
	- alleviating the need to keep resources provisioned when there are not events

# Benefits of Azure Functions

- Using Functions is ideal when you're only concerned about the code running your service and not about the underlying platform or infrastructure.
- Functions are commonly used when you need to perform work in response to an event (often via a REST request), timer, or message from another Azure service, and when that work can be completed quickly, within seconds or less.

- Functions scale automatically based on demand so they may be a good choice when demand is a variable

- Functions runs your code when it triggers and automatically deallocates resources when the function is finished
- In this model Azure only charges you for the CPU time used while your function runs

- Functions can be either stateless or stateful.
	- When stateless (default) they behave as if they restart every time they respond to an event
	- When they're stateful (called Durable Functions) a context is passed through the function to track priority.

- Functions are a key component of serverless computing
	- Also a general compute platform for funning any type of code
- If the needs of a developer's app change you can deploy the project environment that isn't serverless
- This flexibility allows you to manage scaling, run on virtual networks, and even completely isolate the functions.