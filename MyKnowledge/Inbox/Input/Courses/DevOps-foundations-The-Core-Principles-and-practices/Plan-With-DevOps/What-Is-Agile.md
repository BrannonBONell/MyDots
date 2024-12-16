---
tags: azure cloud devops microsoft az-400 agile
date: 27th-October-2024
---

# What is Agile

Agile is an approach to software development that promotes collaboration, continuous improvement, and customer-centric software delivery. It aligns well with DevOps, helping organizations respond to customer needs quickly. Here’s a breakdown of Agile principles, two popular Agile frameworks—Scrum and Kanban—and how they correlate with DevOps.

![Diagram showing a cycle around a Kanban board.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-with-devops/media/3-agile-methods.png)
---

#### Agile Principles and Values

Originating from the Agile Manifesto (2001), Agile focuses on:

- **Individuals and interactions** over processes and tools.
- **Working software** over comprehensive documentation.
- **Customer collaboration** over contract negotiation.
- **Responding to change** over following a rigid plan.

These values provide flexibility, allowing teams to prioritize collaboration and adaptability.

---

#### Agile Frameworks: Scrum and Kanban

##### **1. Scrum**

Scrum is a framework that structures work in short, iterative cycles called **sprints** (typically 1-4 weeks). Key components of Scrum include:

- **Events (ceremonies)**: Meetings such as Daily Standups, Sprint Planning, Sprint Review, and Sprint Retrospective.
- **Artifacts**:
    - **Product Backlog**: A prioritized list of features and tasks.
    - **Sprint Backlog**: Specific tasks chosen for the sprint.
    - **Task Boards**: Visual boards showing the status (To Do, In Progress, Done).
    - **Burndown Chart**: Tracks work completed over the sprint.
- **Roles**:
    - **Product Owner**: Manages and prioritizes the Product Backlog.
    - **Scrum Master**: Facilitates Scrum processes and resolves blockers.
    - **Scrum Team**: Develops and tests the product.
![Diagram showing Agile Scrum lifecycle.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-with-devops/media/3-agile-scrum-lifecycle-diagram.png)
##### **2. Kanban**

Kanban focuses on visualizing work and improving process flow without prescribed roles or set iterations. Key elements include:

- **Kanban Board**: Shows tasks as cards in columns representing their status (To Do, Doing, Done).
- **Pull Model**: Teams "pull" tasks into active work based on capacity.
- **WIP Limits**: Limits work in progress to optimize efficiency.
- **Metrics**:
    - **Lead Time**: Total time from request to delivery.
    - **Cycle Time**: Time spent actively working on a task.
    - **Cumulative Flow Diagram (CFD)**: Visualizes workflow, helping identify bottlenecks and inefficiencies.
![Diagram showing a Kanban board representation with multiple columns.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-with-devops/media/3-what-is-kanban.png)
---
![Diagram showing a Kanban board with three columns including To do, doing, and done.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-with-devops/media/3-agile-kanban-board-sample.png)

![Diagram showing a Kanban board with people pulling work from the backlog.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-with-devops/media/3-kanban-pull-model.png)

![Diagram showing sample Kanban cumulative flow diagram with an indication of a likely issue.](https://learn.microsoft.com/en-us/training/wwl-azure/plan-with-devops/media/3-agile-kanban-cumulative-flow-diagram.png)
#### Comparing Scrum and Kanban

|Aspect|Scrum|Kanban|
|---|---|---|
|**Cadence**|Fixed-length sprints|Continuous flow|
|**Roles**|Defined roles (Product Owner, Scrum Master, Scrum Team)|No required roles; adaptable roles based on need|
|**Backlog Management**|Sprint Backlog for each iteration|Dynamic backlog with no sprint commitment|
|**Change Flexibility**|Limited changes allowed during a sprint|Allows changes at any time|
|**Visualizations**|Sprint boards, burndown charts|Kanban boards with task status|
|**Metrics**|Velocity, burndown chart|Lead time, cycle time, and CFD|

---

#### Benefits of Adopting Agile with DevOps

Transitioning to Agile in a DevOps environment can enhance responsiveness to customer needs, reduce time to market, and improve overall software quality by fostering a culture of collaboration and flexibility across teams.