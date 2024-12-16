---
tags: azure cloud devops microsoft monitor metric logs
date: 19th-October-2024
---

**Azure Monitor** collects two fundamental types of data: **Metrics** and **Logs**. Both data types help monitor the performance and health of Azure resources, enabling real-time insights and proactive issue detection.

---

### **Azure Monitor Metrics**

- **Definition**: Metrics are **numerical values** that represent aspects of a system at a specific point in time.
- **Purpose**: Useful for **real-time monitoring** and **performance tracking** of resources.
- **Examples**: CPU utilization, memory usage, network bandwidth.
- **Characteristics**:
    - **Lightweight** and **real-time**.
    - Ideal for **fast alerts** and **quick insights**.
![Illustration that depicts Azure Monitor metrics data graphs providing information to Metric Analytics in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-monitor/media/monitor-data-platform-7dbebda9.png)
#### **How to Work with Metrics in the Azure Portal**:

- **Metrics Overview**:
    - **Resource Overview Pages**: Metrics are displayed as **charts** on the overview page of a resource (e.g., virtual machines).
- **Metrics Explorer**:
    - **Tool** to visualize metrics.
    - **Customizable Charts**: Allows viewing multiple metrics over time.
    - **Dashboards**: You can pin charts to **dashboards** for broader visibility.

#### **Use Case**:

- Track **CPU usage** over time for a virtual machine to identify performance bottlenecks.

---

### **Azure Monitor Logs**

- **Definition**: Logs contain **detailed data records**, such as events, traces, and performance data.
- **Purpose**: Logs are used for **in-depth analysis**, allowing queries to consolidate and analyze diverse data sets.
- **Examples**: Application errors, audit logs, security events.
- **Characteristics**:
    - Supports **complex queries** and **analysis**.
    - Ideal for **troubleshooting** and **historical data analysis**.

#### **How to Work with Logs in the Azure Portal**:

- **Log Analytics**:
    - **Query Interface**: Allows you to create and test queries for analyzing log data.
    - **Query Language**: Uses **Azure Data Explorer** query language (KQL).
        - Supports simple to advanced queries (e.g., aggregations, joins).
        - Queries can be **saved**, **visualized**, or used to create **alerts**.

#### **Use Case**:

- Query **log data** for failed login attempts to identify potential security threats.

---

### **Key Differences**:

- **Metrics**:
    - Numerical, real-time values.
    - Ideal for quick insights and immediate action.
- **Logs**:
    - Detailed records of events.
    - Ideal for deeper analysis and troubleshooting.


![Illustration that depicts an Azure Monitor Logs database providing information to Log Analytics in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-monitor/media/log-data-32e50eae.png)
---

### **Summary**:

- **Azure Monitor Metrics** provide **real-time** insights into system performance.
- **Azure Monitor Logs** allow for **detailed analysis** of events, errors, and application data.
- Both metrics and logs can be visualized, queried, and used to set **alerts** for proactive issue resolution.