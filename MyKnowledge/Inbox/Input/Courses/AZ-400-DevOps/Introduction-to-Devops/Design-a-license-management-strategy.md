---
tags: azure cloud devops microsoft az-400 license strategy
date: 30th-October-2024
---

# Design a license management strategy

When planning a **license management strategy** for DevOps, assess your current DevOps implementation progress and resource needs. This planning will help streamline processes, manage costs effectively, and ensure the necessary resources are available.

---

#### Key Considerations in License Management

1. **DevOps Implementation Phase**:
    
    - Determine if you’re in the planning or active phase.
    - Identify the required resources based on your DevOps architecture draft.
2. **Current Resource Usage**:
    
    - Assess if you’ve implemented Git version control or created pipelines for building and releasing code.
    - Identify the tools already in use and those anticipated for the project.
3. **Parallel Job Requirements**:
    
    - Multiple teams working on separate solutions may need to avoid build queue delays.
    - Consider paying for parallel jobs to allow builds to run simultaneously, reducing queue dependencies.
4. **Questions to Guide Licensing**:
    
    - **DevOps phase**: Where are you in the DevOps lifecycle?
    - **User count**: How many users need access, and to which features?
    - **Queue wait tolerance**: What wait time is acceptable for builds and pipelines?
    - **Access levels**: Do all users need full access, or are they **Stakeholders**, **Basic users**, or existing **Visual Studio license holders**?
    - **Package management needs**: If using advanced package management, assess whether additional storage is required for Artifacts.
5. **Role-Based Access**:
    
    - Limit access to features according to user roles to optimize license costs.
6. **Pricing Updates**:
    
    - For the most recent pricing, review:
        - **Azure DevOps Pricing**: Visit the [Azure DevOps Pricing](https://azure.microsoft.com/en-us/pricing/details/devops/).
        - **GitHub Pricing**: Visit the [GitHub Pricing](https://github.com/pricing).

---

By assessing these aspects, you can create a **cost-effective and scalable license strategy** to support your DevOps environment efficiently.