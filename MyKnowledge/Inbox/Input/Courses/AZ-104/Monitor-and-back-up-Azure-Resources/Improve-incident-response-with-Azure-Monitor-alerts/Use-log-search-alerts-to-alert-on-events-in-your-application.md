---
tags: azure cloud devops microsoft log search alerts events application
date: 19th-October-2024
---

# Use log search alerts to alert on events in your application

### Azure Monitor Log Search Alerts

**Log search alerts** in Azure Monitor help you detect issues based on historical log data from various sources like server logs, application logs, or Azure services. These alerts focus on analytics and trends to proactively manage system resilience.

#### When to Use Log Search Alerts

- Use **log search alerts** to assess historical data and trigger notifications based on patterns or specific thresholds.
- Example: Check if CPU utilization exceeded a threshold in the last 30 minutes, or analyze web server response codes from the past hour.

#### How Log Search Alerts Work

Log search alerts follow this process:

1. **Log query**: Runs each time the alert rule fires.
2. **Time period**: Specifies the time range to evaluate.
3. **Frequency**: Defines how often the query should run.
4. **Threshold**: Defines the value that must be reached for an alert to be triggered.

#### Types of Log Search Alerts

1. **Number of Records**:
    
    - Ideal for event-driven data like syslog or web app responses.
    - The alert is triggered when the number of records in a query result reaches or exceeds a defined threshold.
    - Example: Trigger an alert if five or more rows of data are returned in the search.
2. **Metric Measurement**:
    
    - Used when aggregating results is needed, such as counting or averaging data over time.
    - Additional criteria include:
        - **Aggregate function**: Example: `count` or `average`.
        - **Group field**: Group results by specific fields like `computer`.
        - **Interval**: Define time intervals for aggregation (e.g., every 10 minutes).
        - **Threshold**: Trigger alerts based on the number of breaches within the time period.
    - Example: Trigger an alert if a server's CPU utilization exceeds 85% more than five times within a defined time interval.

#### Stateless Nature of Log Search Alerts

- **Stateless alerts** generate new alerts every time the criteria are met, even if the same alert was triggered previously.
- **Stateful log search alerts** (currently in preview) retain their state and do not create duplicate alerts for the same issue.

#### Summary:

Log search alerts in Azure Monitor enable proactive monitoring of log data. They allow for customized alerts based on event-driven data or trends through number-of-records or metric-based search queries, making them ideal for identifying patterns and preventing potential system issues.