---
tags: azure cloud devops microsoft az-400 git branch workflow
date: 1st-November-2024
---

# Successful Git branch workflow

Workflow should enhance your team's effectiveness and not be a burden that limits productivity. Few things to consider when evaluating a Git workflow are:
- Does this workflow scale with team size?
- Is it easy to undo mistakes and errors with this workflow?
- Does this workflow impose any new unnecessary cognitive overhead on the team?

# Common branch workflows

Most Git workflows will have a form of centralized repo that individual developers will push and pull from

Here are a list of some popular Git workflows.  These workflows offer more specialized patterns about managing branches for feature developments, hotfixes, and eventual release.

## Trunk-Based Development

- Logical extension of Centralized Workflow
- Core idea is that all development work takes place directly on the main branch (often referred to as "trunk" or "master").
- Emphasizes CI, with developers frequently committing small changes to the main branch.
- CI and automated testing play a big role in maintaining code quality and stability.

## Feature branch workflow

- Each new feature or change is in its dedicated branch separate from the main branch.
- Devs create a new branch for each feature or issue they are working on, develop and test the changes in isolation, and then merge the feature branch back into the main branch once its completed and tested.
- Allows for parallel development of multiple features, facilitates code review, and ensures the main branch stays stable.

## Release branch workflow

- A dedicated branch is created from the main branch when preparing for a new release.
- This branch is used to stabilize the code, address any last-minute issues, and perform testing before deploying the release to production.
- Once release is ready, it is merged back into the main branch, and potentially into other long-lived branches such as development or feature branches.
- Allows for a controlled and organized release process while keeping the main branch stable for ongoing work.

## Forking workflow

- Is fundamentally different from the previous three.  Instead of a single server-side repo to act as the central codebase, it gives every developer a server-side repo.
- Each contributor has two Git repos: a Private and Public server-side
- Promotes a high degree of parallel development and collaboration amount contributors while maintaining a clean and organized codebase.