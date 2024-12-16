---
tags:
  - azure
  - microsoft
  - devops
  - cloud
  - security
  - authenticate
  - role-based
  - access-control
  - security
cssclasses:
  - cornell-left
  - cornell-border
date: 7th-October-2024
---

# Role-based access control
>[!summary] Role based access control
>- Built-in roles describing common access rules for cloud resources
>- When you assign individuals or groups to roles they recieve all associated permissions
>- RBAC is applied in terms of scope which is a resource or set of resources that this access applies to
>- If you grant access at the parent scope those permissions are inherited by all child scopes
- When there is multiple IT and engineering teams
  - How can you control what access they have to the resources in your cloud environment?
    - Principle of least privilege says you should only grant access up to the level needed to complete the task
      - If you only need read access to a storage blob then you should only be granted read access to the storageblob.
      - Write access to that blob shouldn't be granted, nor should read access to other storage blobs
      - It's a good security practice to follow

>[!cue] RBAC
>Each role has a
>set of access
>permissions
- Managing that level of premissions for an entire team would become tedious
  - Instaed of defining the detailed access requirements for each individual
    - Azure enables you to control access through Azure role-based access control (Azure RBAC)

- Azure provides built-in roles that describe common access rules for cloud resources
  - You can also define your own roles
  - Each role has an associated set of access permissions that relate to that role
    - When you assign individuals or groups to one or more roles, they recieve all the associated access permissions

- Hire a new engineer and add them to Azure RABC group for engineers
  - They automatically get the same access as the other engineers in the same Azure RBAC group.
  - Add additonal resources and point Azure RBAC at them, everyone in that Azure RBAC group will now have those permissions on the new resources as well as the existing resources.

# Role-based access control applied to resources

- Is applied to scope
  - A resource or set of resources that this access applies to.

>[!cue] RBAC Applied
>Is applied to scope
>A resource or set of
>resouces that access
>applies to
- Following diagram shows relationship between roles and scopes
- Management group, subscription, or resource group might be given the role of owner
  - They have increased control and authority.
- An observer
  - might be given a role of Reader for the same scope, enabling them to review or observe the management group, subscription or resource group


![2024-10-08-at-18-09-25.png](2024-10-08-at-18-09-25.png)

- Scopes Include:
  - A management group (collection of multiple resources)
  - A single subscription
  - A resource group
  - A single resource

- Observers, users managing resources, admins, and automated processes illustrate the kinds of users or accounts that would typically be assigned each of the various roles.

- Azure RBAC is hierarchical
  - When you grant access at a parent scope
    - those  permissions are inherited by all child scopes EX:
      - When you assign the Owner role to a user at the management group scope
        - the user can manage everything in all subscriptions within the management group
      - When you assign the Reader role to a group at the subscription scope
        - The members can view every resource group and resource within the subscription

>[!cue] RBAC
>Is Azure RBAC
>hierarchical?

# How is Azure RBAC enforced?

- Azure RBAC is enforced on any action that's initiated against an Azure resource that passes through Azure Resource Manager.
  - Resource Manager is a management service that provides a way to organize and secure your cloud resources.

- Access Resource Manager from the Azure portal, Azure Cloud Shell, Azure PowerShell, and the Azure CLI.
- Azure RBAC doesn't enforce access permissions at the application or data level
  - Application security must be handled by your application

- Azure RBAC uses an allow model
  - When assigned a role Azure RBAC allows you to perform actions win the scope of that role.
    - If one role assignment grants you read permissions to a resource group and a different role assignment grants you write permissions to the same resource group
      - You have both read and write permissions on that resource group.

