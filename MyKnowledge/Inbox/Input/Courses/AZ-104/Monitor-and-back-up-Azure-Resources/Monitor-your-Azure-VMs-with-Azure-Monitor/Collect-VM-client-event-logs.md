---
tags: azure cloud devops microsoft collect VM client event logs
date: 19th-October-2024
---

# Collect VM client event logs

In this unit, you set up a Data Collection Rule (DCR) to collect **Linux Syslog data** from your VM and use **Azure Monitor Log Analytics** to analyze the collected log data with KQL queries.

---

### Steps to Set Up a DCR for Log Collection

#### 1. **Create a Data Collection Endpoint**

[![Screenshot that shows the Azure Monitor Overview page.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/monitor-overview.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/monitor-overview.png#lightbox)

- **Navigate to Azure Monitor**: Search for "Monitor" in the Azure portal.
- **Create Endpoint**:
    - Under **Settings**, select **Data Collection Endpoints** and click **Create**.
    - Enter a name like `linux-logs-endpoint`.
    - Select the same **Subscription**, **Resource Group**, and **Region** as your VM.
    - Review and create the endpoint.

#### 2. **Create a Data Collection Rule (DCR)**

- **Navigate to Data Collection Rules**:
    - In Azure Monitor, under **Settings**, select **Data Collection Rules**.
    - Select **Create** to create a new DCR.

[![Screenshot of the Data Collection Rules screen with Create highlighted.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-create.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-create.png#lightbox)

- **Configure DCR**:
    - Under **Basics**, enter a name like `collect-events-linux`.
    - Select **Linux** as the **Platform Type**.
    - Select **Next: Resources**.
- **Add VM Resources**:
    - Select **Add resources**, choose your Linux VM (e.g., `monitored-linux-vm`), and apply.
    - Enable **Data Collection Endpoints** and select the `linux-logs-endpoint` created earlier.

[![Screenshot of the Basics tab of the Create Data Collection Rule screen.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-basics.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-basics.png#lightbox)

- **Configure Data Collection**:
    - Select **Add data source** and choose **Linux Syslog** as the data source.
    - Ensure the **Log Analytics workspace** matches the desired destination (you can use the one created by VM insights).

[![Screenshot of the Resources tab of the Create Data Collection Rule screen.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-resources.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-resources.png#lightbox)

- **Review and Create** the DCR.

[![Screenshot of Review + create highlighted on the Create Data Collection Rule screen.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-finish.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-dcr-finish.png#lightbox)

---

### Viewing Log Data in Log Analytics

After creating the DCR, you can view and analyze the collected Syslog data using **Kusto Query Language (KQL)**.

#### 1. **Access Log Analytics**

- From the VM's **Overview** page, select **Logs** under **Monitoring**.
- Alternatively, go to **Azure Monitor** > **Logs**, and set the scope to your VM's **Log Analytics workspace**.

#### 2. **Run a Simple KQL Query**

- In the query window, type `Syslog` and select **Run**.
- This will display all Syslog events collected from the VM.

#### 3. **Refine Your Query** (Optional)

- You can filter the logs further, for example, to show only warning-level events:
    
    kql
    
    Copy code
    
    `Syslog | where SeverityLevel == "warning"`
    

[![Screenshot that shows the events returned from the Syslog by the DCR.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-log.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/dcr-log.png#lightbox)

---

### Key Takeaways

- **DCR**: Enables you to collect performance counters and logs from your VM.
- **Log Analytics**: Allows you to run **KQL queries** to analyze collected logs.
- **Customization**: You can create multiple DCRs for different VMs or log types, tailoring your monitoring needs.

By setting up a **DCR** and using **Log Analytics**, you can analyze system events, identify performance issues, and detect potential root causes in real time.