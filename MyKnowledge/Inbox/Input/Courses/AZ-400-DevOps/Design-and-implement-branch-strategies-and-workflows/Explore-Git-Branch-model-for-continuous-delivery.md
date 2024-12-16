---
tags: azure cloud devops microsoft az-400 git branch CD model
date: 3rd-November-2024
---
# Explore Git branch model for continuous delivery

This Git branching model optimizes the process of shipping enhancements while ensuring code quality, without slowing down delivery. The strategy uses feature branches, release branches, and pull requests to maintain a ready-to-release main branch.

---

### Branching Strategy Overview

- **Main Branch**:
    
    - **Purpose**: Solely for production releases.
    - **Requirements**:
        - Always in a production-ready state.
        - Protected by branch policies.
        - All changes flow through pull requests only.
        - Tagged with Git tags upon release.
- **Feature Branches**:
    
    - **Purpose**: For developing new features and bug fixes.
    - **Guidelines**:
        - Use feature flags to manage long-running branches.
        - Changes to main flow through pull requests only.
        - Name branches descriptively, e.g., `feature/myFeature-1`.
- **Release Branch**:
    
    - **Purpose**: Prepare for production deployment.
    - **Guidelines**:
        - Created from a stable feature branch.
        - Undergoes thorough testing.
        - Bug fixes and changes are applied here before deployment.
        - Tagged to mark milestones.

### Branch Naming Conventions

- `bugfix/description`
- `features/feature-name` or `features/feature-area/feature-name`
- `hotfix/description`
- `users/username/description`

---

### Pull Requests

- Use pull requests for code reviews and merges.
- Automate inspections and validations as part of the pull request process.
- Track pull request completion time and set goals for reduction.

---

### Implementation Steps

1. **Create Feature Branch**:
    
    - From the main branch: `git checkout -b feature/myFeature-1`.
    - Make code changes and commit to this branch.
    - Push changes to remote and create a pull request to merge into the main branch.
2. **Use Azure DevOps CLI for Pull Requests**:
    
    - Configure the CLI: `az devops configure --defaults organization=<organization_url> project="<project_name>"`.
    - Create a pull request:
        
        bash
        
        Copy code
        
        `az repos pr create --title "Review Feature-1 before merging to main" --source-branch feature/myFeature-1 --target-branch main --repository myWebApp --open`
        
3. **Tagging and Release Branch**:
    
    - Tagging the main branch at release: `git tag -a <tag_name> -m "Release message"`.
    - For a new release branch from the main: `git checkout -b release/v1.1 main`.
4. **Handling Hotfixes and Bug Fixes**:
    
    - Create a branch from the release tag for bug fixes: `git checkout -b fof/bug-1 release_feature1`.
    - Commit bug fixes, push to remote, and create a pull request to merge back to the main branch.
5. **Managing Merge Conflicts**:
    
    - Use the Git Pull Request Merge Conflict resolution extension in Azure DevOps to resolve conflicts directly in the browser.

---

### Key Points

- **Lean Branching Model**: Use short-lived branches to allow faster release cycles.
- **Pull Requests for Quality Control**: Enforce code reviews and validation.
- **Tags for Milestones**: Use Git tags to mark significant code versions.
- **Feature Flags**: Manage long-running feature branches efficiently.
- **Branch View**: Utilize the branch view in the web portal to monitor branch statuses and conflicts.

This branching model provides flexibility, supports parallel development, and simplifies merging to maintain high-quality, production-ready code.