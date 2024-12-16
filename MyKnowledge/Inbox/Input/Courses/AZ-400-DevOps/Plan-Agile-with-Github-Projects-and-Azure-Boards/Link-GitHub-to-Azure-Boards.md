---
tags: azure cloud devops microsoft az-400 link github boards
date: 30th-October-2024
---

# Link GitHub to Azure Boards

**Azure Boards** is a powerful project management tool for planning and tracking work items, while **GitHub** serves as a widely-used platform for source control in software development. Integrating Azure Boards with GitHub allows you to link GitHub commits, pull requests, and issues directly to work items in Azure Boards, ensuring traceability and alignment of development activities with project goals.

---

### Setting Up the Integration

1. **Azure Boards App Installation**:
    
    - Install the **Azure Boards App** from the [GitHub Marketplace](https://github.com/marketplace).
    - The app enables communication between Azure Boards and GitHub, allowing links between GitHub code activity and Azure Boards work items.
2. **Authenticate Connection**:
    
    - You can authenticate using a **Username/Password** or a **Personal Access Token (PAT)**.
    - Follow [this guide](https://learn.microsoft.com/azure/devops) for setting up the connection securely.
3. **Adding or Removing Repositories**:
    
    - Once the Azure Boards App is connected, manage GitHub repositories through the **Azure Boards web portal**. You can add or remove repositories linked to an Azure Boards project.

---

### Supported Integration Scenarios

#### From GitHub:

- **All Repositories**: Support integration for a single repository or multiple repositories from an account or organization.
- **Manage Integration**: Add or remove repositories, or suspend/uninstall the Azure Boards-GitHub integration.

#### From Azure Boards:

- **Multi-Repository Support**: Connect multiple GitHub repositories to a single Azure Boards project.
- **Configuration Changes**: Easily add or remove repositories linked to Azure Boards projects.
- **Multi-Project Integration**: Allow a GitHub repository to connect with more than one Azure Boards project within the same Azure DevOps organization.

---

### Operational Benefits

With Azure Boards-GitHub integration, you can:

- **Link Work Items to GitHub Commits, Pull Requests, and Issues**: Use GitHub mentions (like `fix`, `fixes`, or `fixed`) in commits and pull requests to link them to Azure Boards work items.
- **Automated State Transitions**: Mark work items as Done or Completed based on commit mentions.
- **Full Traceability**:
    - Post comments to GitHub directly from Azure Boards for any links to commits, PRs, or issues.
    - See linked GitHub artifacts in the **Development** section of work items and as annotations on Kanban board cards.
- **Status Badges**: Add status badges from Kanban board columns directly to GitHub repositories for real-time tracking.

---

### Limitations

- **Querying Linked GitHub Artifacts**: Directly querying work items linked to GitHub artifacts isn’t supported, but you can query items with an **External Link Count** greater than zero.

---

### Additional Resources

For further setup and configuration:

- [Change GitHub repository access, suspend or uninstall integration](https://learn.microsoft.com/azure/devops).
- [Add or remove GitHub repositories](https://learn.microsoft.com/azure/devops).
- [Link GitHub commits, PRs, and issues to work items](https://learn.microsoft.com/azure/devops).

This integration makes collaboration easier, providing transparency and better alignment between development activities in GitHub and project tracking in Azure Boards.

Reference: [Azure Boards-GitHub integration](https://learn.microsoft.com/en-us/azure/devops/boards/github).