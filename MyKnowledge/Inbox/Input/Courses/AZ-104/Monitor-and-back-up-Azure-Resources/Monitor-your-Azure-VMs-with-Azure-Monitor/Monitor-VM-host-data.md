---
tags: azure cloud devops microsoft VM host data monitor
date: 19th-October-2024
---

# Monitor VM host data

In this unit, you will create a Linux VM in the Azure portal, enable recommended alerts, and review built-in metrics, activity logs, and boot diagnostics.

#### Steps to Create a VM with Monitoring:

1. **Create a VM in the Azure Portal**:

1. [![Screenshot that shows the Basics tab of the Create a virtual machine page.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-basic.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-basic.png#lightbox)

    - **Search**: Enter "virtual machines" in the Azure portal search bar.
    - **Create New VM**: On the Virtual machines page, select **Create**, then select **Azure virtual machine**.
    - **Basic Settings**:
        - Select your **Subscription**.
        - For **Resource Group**, select **Create new** and name it `learn-monitor-vm-rg`.
        - For **Virtual Machine Name**, enter `monitored-linux-vm`.
        - Select **Ubuntu Server 20.04 LTS - x64 Gen2** for the image.
    - **Monitoring Tab**:
        - Enable **recommended alert rules**.
        - Enter your email for alert notifications.
        - Ensure **Boot diagnostics** is enabled with managed storage.
        - **Review + Create** and then select **Create**.
        - Download the private key to access your VM when prompted.

[![Screenshot that shows the Monitoring tab and alert rule configuration screen of the Create a virtual machine page.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-monitoring.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/create-vm-monitoring.png#lightbox)

1. **View Built-In Metrics**:

[![Screenshot that shows Monitoring tab on a VMs Overview screen.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/select-monitoring.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/select-monitoring.png#lightbox)

    - **Metrics Collected**:
        - **VM Availability**: Monitor if your VM is running or stopped.
        - **CPU (average)**: CPU usage percentage over time.
        - **Disk bytes (total)**: Total disk read/write operations.
        - **Network (total)**: Total network traffic in/out.
        - **Disk operations/sec (average)**: Disk input/output performance.

[![Screenshot that shows the platform metrics graphics on the VM Overview page.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/platform-metrics.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/platform-metrics.png#lightbox)

3. **View the Activity Log**:

[![Screenshot of the activity log for a VM.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/activity-log.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/activity-log.png#lightbox)

    - Access the **Activity log** from the VM's left navigation menu to track resource changes, such as startup, shutdown, and configuration modifications.
4. **View Boot Diagnostics**:

[![Screenshot that shows the boot diagnostic image captured.](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-boot-diagnostics.png)](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/media/3-boot-diagnostics.png#lightbox)

    - Boot diagnostics allow you to troubleshoot startup issues:
        - Go to **Boot diagnostics** in the left navigation menu.
        - View the **Screenshot** for a visual of the VM's startup.
        - View the **Serial log** for system messages during the boot process.

#### Key Notes:

- **Recommended Alerts**: Alert rules automatically monitor VM health and notify you of critical performance issues via email.
- **Metrics**: Azure starts collecting metrics like CPU, disk, and network performance as soon as the VM is created.
- **Boot Diagnostics**: Helps troubleshoot boot-related problems by providing screenshots and system logs.

This setup allows you to proactively monitor the health and performance of your VM, ensuring that any issues are caught and addressed early.