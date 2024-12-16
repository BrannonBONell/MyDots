---
tags: azure cloud devops microsoft az-400 feature branch workflow
date: 1st-November-2024
---

# Feature Branch Workflow

- All feature development should take place in a dedicated branch instead of the main branch
- Makes it easier for multiple devs to work on a particular feature without disturbing the main codebase.
- Main branch will never contain broken code, an advantage for CI environments.
- Separating feature development makes it possible to use pull requests, a way to start discussions around a branch.
- Allow other devs to sign out on a feature before it integrates into the project.
- If you get stuck in a the middle of a feature, you can open a pull request asking for suggestions.
- Pull requests make it easy for your team to comment on each other's work.
- Feature branches can be pushed to the central repo
- Allows sharing a feature with other devs without touching any official code
- Since "main" is the only special branch, storing several feature branches on the central repo doesn't pose any problems.
- It's a convenient way to back up everyone's local commits.

## Release Branch Workflow

- Creation of dedicated branches for preparing releases.
- Typically created from a stable feature branch.
- The release branch undergoes additional testing, bug fixes, and stabilization efforts to prepare the codebase for deployment.
- Allows for isolation of the release-related activates from ongoing feature development, providing a controlled environment for polishing up the upcoming release.
- After all necessary adjustments and verifications are made on the release branch, it's merged into the main branch or deployed directly to production.
- Helps teams  manage the complexities of coordinating release activities while maintaining a stable main branch for on going development.

## Trunk-based development workflow

- Central repo, and main represents the official project history.
- Instead of commits to their local main branch, devs create a new branch whenever they start working on a new feature.
- Feature branches should have descriptive names, like new-banner-image or bug-91
- Give each branch a clear highly focused purpose.

Git makes no technical distinction between the main and feature branches, so devs can edit, stage, and commit changes to a feature branch.

## Create a branch

![Diagram showing a branch creation representation.](https://learn.microsoft.com/en-us/training/wwl-azure/manage-git-branches-workflows/media/create-branch-8f64a7d3.png)

- Creating a branch is creating an environment where you can try new ideas.
- Teams following the release branch workflow also create dedicated branches for preparing releases
- Release branches are typically derived from stable feature branches.
- Once created the release branch undergoes addition testing, bug fixes, and stabilization efforts to prepare the codebase for deployment.

## Add commits

![Diagram showing add commits in a branch.](https://learn.microsoft.com/en-us/training/wwl-azure/manage-git-branches-workflows/media/add-commits-061f8ae4.png)

- Once a branch has been created, it's time to make changes.
- Whenever you add, edit, or delete a file, you make a commit and add them to your branch
- Adding commits keeps track of progress on a feature branch
- Commits also create a transparent history of work that has been done.
- Each commit has an associated message explaining why it was created
- Each commit is considered a separate unit of change.
- Lets you roll back changes if a bug is found or decided to head a different direction
- Commit messages are essential
- Write clear commit messages, to make it easier to follow along and provide feedback.

## Open a pull request

![Diagram showing an open Pull Request action.](https://learn.microsoft.com/en-us/training/wwl-azure/manage-git-branches-workflows/media/open-pull-request-5c5ad0c7.png)

Pull requests start a discussion about commits.  Anyone can see exactly what changes would be merged if they accept your pull request

Open a Pull Request at any point during the development process:
- You've little or no code but want to share screenshots or general ideas.
- You're stuck and need help or advice.
- You're ready for someone to review your work.

Using the @mention system in your Pull Request messages, you can ask for feedback from specific people or groups

## Discuss and review your code

![Diagram showing a branch. Discuss and review your code.](https://learn.microsoft.com/en-us/training/wwl-azure/manage-git-branches-workflows/media/discuss-review-your-code-f489fed4.png)

## Deploy

![Diagram showing a deploy from a branch perspective.](https://learn.microsoft.com/en-us/training/wwl-azure/manage-git-branches-workflows/media/deploy-branch-ee2cd423.png)

With Git, you can deploy from a branch for final testing in an environment before merging to the main.

Once your pull request has been reviewed and the branch passes your tests, you can deploy your changes to verify them. You can roll it back if your branch causes issues by deploying the existing main.

## Merge

![Diagram showing a merge action from a branch.](https://learn.microsoft.com/en-us/training/wwl-azure/manage-git-branches-workflows/media/merge-branch-640aa393.png)

Once your changes have been verified, its time to merge your cod4e into the main branch.

Once merged, Pull Requests preserve a record of the historical changes to your code. Because they're searchable, they let anyone go back in time to understand why and how a decision was made.

You can associate issues with code by incorporating specific keywords into your Pull Request text. When your Pull Request is merged, the related issues can also close.

This workflow helps organize and track branches focused on business domain feature sets.

Other Git workflows, like the Git Forking Workflow and the Gitflow Workflow, are repo-focused and can use the Git Feature Branch Workflow to manage their branching models.