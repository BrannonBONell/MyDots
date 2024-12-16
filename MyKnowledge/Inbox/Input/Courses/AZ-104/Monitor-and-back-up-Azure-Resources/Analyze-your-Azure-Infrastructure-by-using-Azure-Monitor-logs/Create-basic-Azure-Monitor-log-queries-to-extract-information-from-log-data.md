---
tags: azure cloud devops microsoft monitor log queries data
date: 19th-October-2024
---

# Create basic Azure Monitor log queries to extract information from log data

Azure Monitor allows you to write **log queries** using the **Kusto Query Language (KQL)** to extract valuable insights from log data. You can create and run these queries through **Log Analytics** in the Azure portal.

#### How to Access Log Analytics

1. In the **Azure portal**, go to **Monitor**.
2. Select **Logs** from the available options.
3. In the **Log Analytics** workspace, you can enter and run your queries to view the results.

#### Key Components of Kusto Query Language (KQL):

1. **Data Source**: The starting point for the query, such as a **table** (e.g., "Events" or "Heartbeat").
2. **Tabular Data Flow**: Queries process data in rows and columns, and **tabular operators** (e.g., `where`, `count`, `summarize`) transform this data.
3. **Pipe Operator (`|`)**: Connects different query operators in a flow.

![Screenshot of Azure Monitor with a new query tab opened.](https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/media/3-azure-monitor-portal-query-pane.png)

#### Example Queries:

1. **Basic Filtering and Counting**:
    
    - Retrieve event records from November 2018 in Florida and return the count:
        
        kusto
        
        Copy code
        
        `Events | where StartTime >= datetime(2018-11-01) and StartTime < datetime(2018-12-01) | where State == "FLORIDA" | count`
        
2. **Aggregating Data**:
    
    - Retrieve the most recent **Heartbeat** record for each computer based on its IP address:
        
        kusto
        
        Copy code
        
        `Heartbeat | summarize arg_max(TimeGenerated, *) by ComputerIP`
        

#### Kusto Query Language Features:

- **Case-Sensitive**: Ensure correct case for table and column names.
- **Operators**:
    - `where`: Filters data.
    - `summarize`: Aggregates data.
    - `count`: Counts the number of rows.
    - `arg_max`: Returns the maximum value for a specified column.

#### Practical Applications:

- **Event Logs**: Analyze system events over a given period.
- **Heartbeat Monitoring**: Check the health status of machines in your infrastructure.
- **Performance Monitoring**: Analyze performance counters or update records.

Using KQL with **Log Analytics** allows you to proactively monitor system health, troubleshoot issues, and gain insights from your Azure and on-premises environments.