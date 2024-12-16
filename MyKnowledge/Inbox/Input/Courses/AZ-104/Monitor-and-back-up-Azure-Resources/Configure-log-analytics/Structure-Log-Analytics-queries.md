---
tags: azure cloud devops microsoft log analytics queries
date: 19th-October-2024
---

# Structure Log Analytics queries

### Azure Monitor Kusto Query Language (KQL) Overview

**Kusto Query Language (KQL)** is used in **Azure Monitor Log Analytics** to query data stored in dedicated tables in a Log Analytics workspace. KQL queries begin with selecting data from specific tables and then applying various operators to filter, sort, and analyze the data.

![Illustration that shows how to build Log Analytics queries from data in dedicated tables in a Log Analytics workspace.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-log-analytics/media/query-tables-f3872e3a.png)

### Key Concepts of KQL Query Structure:

1. **Source Tables**:
    - Data is stored in dedicated tables such as _Event_, _Syslog_, _Heartbeat_, and _Alert_.
    - The table you query depends on the type of data you're looking for.
2. **Basic Query Structure**:
    - A query starts with a source table, followed by a chain of operators.
    - Each operator starts with a pipe `|` and processes the output of the previous step.
3. **Common KQL Operators**:
    - **`count`**: Returns the total number of records.
    - **`top`**: Returns the top N records sorted by specified columns.
    - **`where`**: Filters records that match a specific condition.

### Example KQL Queries:

|type|event|severity|start|duration|region|
|---|---|---|---|---|---|
|`Water`|`Freezing rain`|`1`|`6:00 AM 01-27-2023`|`3 hours`|`1, 2`|
|`Wind`|`High winds`|`1`|`8:00 AM 01-27-2023`|`12 hours`|`1, 2, 4, 5`|
|`Temperature`|`Below freezing`|`2`|`11:00 PM 01-26-2023`|`10 hours`|`1, 2, 4, 5`|
|`Water`|`Snow`|`3`|`4:00 PM 01-26-2023`|`10 hours`|`1, 2, 4, 5`|
|`Water`|`Flood warning`|`2`|`9:00 AM 01-26-2023`|`10 hours`|`3`|

1. **Count the number of records in a table**:
    
    kusto
    
    Copy code
    
    `StormEvent | count`
    
    This query counts the number of records in the _StormEvent_ table. For example, it returns:
    
    Copy code
    
    `count 5`
    
2. **Return the first N records sorted by columns**:
    
    kusto
    
    Copy code
    
    `StormEvent | top 3 by severity duration`
    
    This query returns the top 3 events sorted by _severity_ and _duration_:
    
    csharp
    
    Copy code
    
    `event            severity    duration Freezing rain    1           3 hours High winds       1           12 hours Below freezing   2           10 hours`
    
3. **Filter records matching a condition**:
    
    kusto
    
    Copy code
    
    `StormEvent | where event == "snow"`
    
    This query filters the records to show only events that match _"snow"_:
    
    wasm
    
    Copy code
    
    `type     event    severity    start              duration    region Water    Snow     3           4:00 PM 01-26-2023 10 hours    1, 2, 4, 5`
    

### Summary:

- **KQL** allows you to perform various operations on your monitoring data stored in Azure Monitor.
- You start with a **source table** and apply **operators** to manipulate and analyze the data.
- Common operators include `count`, `top`, and `where` to help you filter and sort data efficiently.