---
tags: microsoft azure cloud security authentication methods devops
date: 6th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Authentication Methods

>[!summary] Azure Authentication
>- Azure supports standard password, SSO, MFA, and passwordless
>- SSO enables a user to sign in one time and use that credential to access multiple resources and apps from different providers
>- MFA requires 2 or more elements to authenticate, elements fit three categories, Something the user knows, has, or is.
>- Microsoft Entra Multifactor authentication, provides MFA capabilities, Entra MFA enables the user to choose an additional form of authentication during sign-in
>- Types of passwordless authentication, Microsoft Hello for Business, Microsoft Authenticator App, FIDO2 security keys.

- Authentication is the process of establishing the identity of the person, service, or device
	- Requires to provide credential to prove who they are
		- Authentication is like when your presenting and ID while traveling
		- Doesn't confirm that you have a ticket it just proves that you are who you say you are.
	
>[!cue] Authentication
>what does Azure
>support as authentication
>methods?
 
- Azure supports multiple authentication methods
- standard passwords
		- single sign on (SSO)
		- multifactor authentication (MFA)
		- and passwordless

- Security and convenience seemed to be at odds with each other
	- Thankfully now new authentication solutions provide both security and convenience.

- The Diagram shows the security level compared to the convenience.
	- Passwordless authentication is high security and high convenience while password on their own are low security but high convenience.
![[Pasted image 20241007102040.png]]

# What is single sign-on (SSO)

- (SSO) enables a user to sign in one time and use that credential to access multiple resources and applications from different providers.
	- For SSO to work
		- The different applications and providers must trust the initial authenticator
		
>[!cue] SSO
> Sign in one time
> access to multiple
> resources and apps
> from different providers 
- More identities mean more passwords to remember and change.
- Password policies can vary among applications
- As complexity requirements increase, it becomes more difficult for users to remember them
- The more passwords a user has the greater the risk of a credential-related security incident.

- Consider the process of managing all those identities.
- More strain is placed on help desks as the deal with account lockouts and password reset requests.
- If a user leaves an organization
	- tracking down all those identities and ensuring they're disabled can be challenging
- if an identity is overlooked
	- This might allow access when it should have been eliminated.

- SSO only need to remember one ID and one password.  
	- Access across applications is granted to a single identity that is tied to the user.
	- As users change roles or leave an organization
		- access tied to a single identity.
	- This greatly reduces the effort5 needed to change or disable accounts
- Using SSO for accounts makes it easier for users to manage their identities and for IT to manage users.

> [!important] Important
> SSO is only as secure as the initial authenticator because the subsequent connections are all based on the security of the initial authenticator.

# What's multifactor authentication?

- MFA is the process of prompting a user for an extra form of identification during the sign in process
- Helps protect against password compromise in situations where the password was compromised but the second form wasn't

>[!cue] MFA
>2 or more elements
>to authenticate
>Something the user
>knows, has, or is
- MFA provides additional security for your identities by requiring two or more elements to fully authenticate. These elements fall into three categories:
	- Something the user knows
		- this might be a challenge question
	- Something the user has
		- this might be a code that's sent to the user's mobile phone
	- Something the user is
		- this is typically some sort of biometric property, such as a fingerprint or face scan.

- MFA increases identity security by limiting the impact of credential exposure.
- An attacker who has a user's password would also need to have possession of their phone or their fingerprint to fully authenticate.

- MFA should be enabled wherever possible because it adds enormous benefits to security.

# What's Microsoft Entra multifactor authentication (MFA)?
>[!cue] Entra MFA
>Microsoft MFA capabilites
- Entra multifactor authentication is a service that provides MFA capabilities
	- Entra  MFA enables users to choose an additional form of authentication during sign-in
		- such as a phone call or a mobile app notification

# Passwordless authentication

- Features like MFA are a great way to secure your organization
	- users often get frustrated with the additional security layer on top of having to remember their passwords.
	- People are more likely to comply when its easy and convenient to do so.
	- Passwordless authentication methods are more convenient because the password is removed and replaced with something you have
		- Plus something you are or something you know

>[!cue] Passwordless
>needs to be set up on a
>device before it can work
>once registered Azure now
>knows it's associated with you
>provide something you know
>or are and be authenticated. 
- Passwordless authentication needs to be set up on a device before it can work.
	- Your computer is something you have.
		- Once it's been registered or enrolled
			- Azure now knows that it's associated with you.
		- Now that the computer is known
			- once you provide something you know or are (pin or fingerprint)
				- You can be authenticated without using a password

- Each organization has different needs when it comes to authentication
	- Microsoft global Azure and Azure Government offer the following three passwordless authentication options that integrate with Microsoft Entra ID:
		- Windows Hello for Business
		- Microsoft Authenticator app
		- FIDO2 security keys

# Windows Hello for Business

- Is ideal for information workers that have their designated Windows PC.
	- The biometric and PIN credentials are directly tied to the user's PC
		- prevents access from anyone other than the owner
	- With public key infrastructure (PKI) integration as built-in support for (SSO)
		- Windows Hello for Business provides a convenient method for seamlessly accessing corporate resources onsite and in the cloud.

# Microsoft Authenticator App

- An employees phone can become a passwordless authentication method.
	- You can use the Authenticator App as a passwordless option.

- Authenticator App turns any iOS or Android phone into a strong passworless credential.
	- Users can sign in to any platform or browser by getting a notification to their phone
		- matching a number displayed on the screen to the one on their phone
			- then using their biometric (touch or face) or PIN to confirm
		- Refer to Download and install the Microsoft Authenticator app for installation details.

# FIDO2 security keys

- FIDO (FAST IDentity Online) Alliance helps to promote open authentication standards and reduce the use of passwords as a form of  authentication.
	- FIDO2 is the latest standard that incorporates the web authentication (WebAuthn) standard

>[!cue] FIDO2
>external security key or platform
>key built into a device
>typicall USB devices can 
>also use Bluetooth or NFC

- FIDO2 security keys are a unphishable standards-based passwordless authentication method that can come in any form factor
	- (FIDO) is an open standard for passwordless authentication.
		- FIDO allows users and organizations to leverage the standard to sign-in to their resources without a username or password by using an external security key or a platform key built into a device.

- Users can register and then select a FIDO2 security key at the sign-in interface as their main means of authentication.
	- These FIDO2 security keys are typically USB devices
		- could also use Bluetooth or NFC.
	- With a hardware device that handles the authentication
		- security of an account is increased as there's no password that could be exposed or guessed.