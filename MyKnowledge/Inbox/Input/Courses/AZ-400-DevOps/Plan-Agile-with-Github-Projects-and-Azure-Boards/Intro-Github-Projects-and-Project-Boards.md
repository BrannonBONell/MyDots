---
tags: azure cloud devops microsoft az-400 github projects boards
date: 30th-October-2024
---

# Github Projects and Project Boards

- With project boards, you can control specific feature work, roadmaps, release plans, for planning and prioritizing work
- Project boards include issues, pull requests, and notes categorized as cards you can drag and drop into your chosen columns.  Cards contain relevant metadata for issues and pull requests, like labels, assignees, the status, and who opened it.

![Screenshot of GitHub project boards feature.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-agile-github-projects-azure-boards/media/github-project-boards-board-80633bf7-417553f9-3d47d858.png)

Different types of project boards;
- **User-owned project boards:** Can contain issues and pull requests from any personal repository.
- **Organization-wide project boards:** Can contain issues and pull requests from any repository that belongs to an organization.
- **Repository project boards:** Are scoped to issues and pull requests within a single repository.

To create a project board for your organization, you must be an organization member.

- It's also possible to use templates to set up a new project board that will include columns and cards with tips.  The templates can be automated and already configured.

| Templates                    | Description                                                                                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Basic kanban                 | Track your tasks with: To do, In progress, and Done columns.                                                               |
| Automated kanban             | Cards automatically move between: To do, In progress, and Done columns.                                                    |
| Automated kanban with review | Cards automatically move between: To do, In progress, and Done columns, with extra triggers for pull request review status |
| Bug triage                   | Triage and prioritize bugs with: To do, High priority, Low priority, and Closed columns.                                   |

For more information about Project boards, see:

- [Creating a project board](https://docs.github.com/articles/creating-a-project-board).
- [Editing a project board](https://docs.github.com/articles/editing-a-project-board).
- [Copying a project board](https://docs.github.com/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project).
- [Adding issues and pull requests to a project board](https://docs.github.com/articles/adding-issues-and-pull-requests-to-a-project-board).
- [Project board permissions for an organization](https://docs.github.com/articles/project-board-permissions-for-an-organization).

## Projects

Customizable and flexible tool version of projects for planning and tracking work on GitHub.

Projects are customizable spreadsheet that can configure the layout by filtering, sorting, grouping your issues PR's, and adding custom fields to track metadata.

![Screenshot of GitHub project feature.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-agile-github-projects-azure-boards/media/github-projects-beta-f72f1d6a-9c3e8d4d-ac6cffd9.png)

Changing a pull request or issue will reflect that change in the project.

You can use custom fields for example:
- A date field to track target ship dates.
- A number field to track the complexity of a task.
- A single select field to track whether a task is Low, Medium, or High priority.
- A text field to add a quick note.
- An iteration field to plan work week-by-week, including support for breaks.

For more information on GitHub Projects:
- [Creating a project](https://docs.github.com/issues/trying-out-the-new-projects-experience/creating-a-project).
- [Managing iterations in projects](https://docs.github.com/issues/trying-out-the-new-projects-experience/managing-iterations).
- [Customizing your project views](https://docs.github.com/issues/trying-out-the-new-projects-experience/customizing-your-project-views).
- [Automating projects](https://docs.github.com/issues/trying-out-the-new-projects-experience/automating-projects).