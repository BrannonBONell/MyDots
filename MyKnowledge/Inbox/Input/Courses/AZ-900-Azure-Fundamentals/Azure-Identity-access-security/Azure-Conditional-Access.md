---
tags: microsoft azure cloud devops security authenticate credential conditional access
date: 7th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Conditional Access

>[!summary] Conditional Access
>- Tool to allow or deny access to resources based on identity and signals
>- Signals include who the user is, where and what device the user is requesting access from
>- Conditional access collects signals makes a decision based on the signals and enforces that decision by allowing or denying access or challenging for a MFA response
>- Enforcement is the action that carries out the decision


- Is a tool Microsoft Entra ID uses to allow or deny access to resources based on identity signals.
	- These signals include who the user is, where, and what device the user is requesting access from

>[!cue] Signals
>What are signals?
- Helps IT administrators:
	- Empower users to be productive wherever and whenever
	- Protect the organization's assets.

- Provides a more granular MFA experience for users
	- User might not be challenged for a second authentication factor if they're at a known location
		- May be challenged for a second authentication factor if their sign-in signals are unusual or they're at an unexpected location

>[!cue] Decisions
>Conditional Access collects
>signals based on those signals
>it can allow or deny access
>or challenge for a MFA response
- During sign-in Conditional Access collects signals from the user makes decisions based on those signals then enforces that decision by allowing or denying the access request or challenging for a MFA response.
![[Pasted image 20241007111422.png]]

- The signal might be the users location, device, or application that the user is trying to access.

- Based on these signals
	- The decision might be to allow full access if the user is signing in from their usual locations
	- Signing in from an unusual location or a location that's marked as high risk
		- Access might be blocked entirely or possibly granted after the user provides a second form of authentication

- Enforcement is the action that carries out the decision
	- The action is to allow access or require the user to provide a second form of authenticfation

# When can I use Conditional Access?

- Conditional Access is useful when:

>[!cue] When?
>is conditional access
>useful?
	
- Require MFA to access an app depending on the requester
	- role, location or network

- Require MFA administrators but not regular users or for people connecting from outside your corporate network

- Require access to services only through approved client apps
	- Limit which email apps are able to connect to your email service

- Require users to access your app only from managed devices.
	- A managed device is a device that meets your standards for security and compliance.

- Block access from untrusted sources, such as access from unknown or unexpected locations.