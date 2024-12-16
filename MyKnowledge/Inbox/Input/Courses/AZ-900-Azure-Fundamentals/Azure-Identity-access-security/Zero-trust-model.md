---
tags: azure microsoft security authenticate cloud devops zero-trust
date: 8th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Zero Trust model
>[!summary] 
>- Zero Trust assumes breech at the outset and verifies each request as it came from an uncontrolled network
>- Zero Trust security is based on three guiding Principles
>- Instead of assuming devices are safe it requires everyone to authenticate
>- Then grants access based on authentication instead of location.


- Security model that assumes the worst case scenario and protects resources with that expectation
	- Assumes breach at the outset, and then verifies each request as though it originated from an uncontrolled network

- Organizations need new security solutions that effectively adapts to today's complex environments.
	- Embraces the mobile workforce
	- protects people, devices applications, and data wherever they are located

>[!cue] Zero Trust
>Assumes worst case scenario
>Verify explicitly
>Use least privilege access
>Assume Breech
- To address the this new world of computing Microsoft highly reccomends
	- Zero Trust security model, based on these priciples.
		- Verify explicitly
			- Always authenticate and authorize based on all available data points
		- Use least privilege access
			- Limit user access with Just In Time and Just Enough Access (JIT/JEA) risk-based adaptive policies, and data protections
		- Assume breech
			- Minimize blast radius and segment access.  Verify end to end encryption. Use analytics to get visibility, drive threat detection, and improve defeneses.

# Adjusting to Zero Trust

- Zero trust flips old security model scenarios
	- Instead of assuming that a device is safe because it's within the corporate network, it requires everyone to authenticate.  Then grants access based on authentication rather than location.
![[Pasted image 20241008194319.png]]