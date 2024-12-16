---
tags: azure cloud devops microsoft metric alerts performance issues
date: 19th-October-2024
---

The shipping company you work for wants to avoid any future issues with updates to its applications on the Azure platform. To improve the alert capabilities in Azure, you made the choice to use Azure metric alerts.

In this exercise, you create a Linux virtual machine (VM). This VM runs an app that runs the CPU at 100 percent utilization. You create monitoring rules in the Azure portal and in the Azure CLI to alert you about high CPU usage.

## Create the VM

This VM runs a specific configuration that stresses the CPU and generates the metric monitoring data needed to trigger an alert.

1. Start by creating the configuration script. To create the `cloud-init.txt` file with the configuration for the VM, run the following command in Azure Cloud Shell:
    
    BashCopy
    
    ```
    cat <<EOF > cloud-init.txt
    #cloud-config
    package_upgrade: true
    packages:
    - stress
    runcmd:
    - sudo stress --cpu 1
    EOF
    ```
    
2. To set up an Ubuntu Linux VM, run the following `az vm create` command. This command uses the `cloud-init.txt` file that you created in the previous step to configure the newly created Ubuntu Linux VM.
    
    Azure CLICopy
    
    ```
    az vm create \
        --resource-group "[sandbox resource group name]" \
        --name vm1 \
        --location eastUS \
        --image Ubuntu2204 \
        --custom-data cloud-init.txt \
        --generate-ssh-keys
    ```
    

## Create the metric alert using the Azure portal

 Note

Wait until the VM is successfully created before proceeding with the exercise. The VM creation process is complete when you get the completed JSON output in the Azure Cloud Shell window.

You can use either the Azure portal or the CLI to create a metric alert. In this exercise, we cover both, starting with the Azure portal.

1. Sign in to the [Azure portal](https://portal.azure.com/learn.docs.microsoft.com) using the same account that you used to activate the sandbox.
    
2. On the Azure portal menu, search for and select **Monitor**. On the **Monitor Overview** page, select **Alerts**.
    
3. Open the **+ Create** menu, and select **Alert rule**
    
4. On the **Select a resource** pane, set the scope for your alert rule. You can filter by subscription, resource type, or resource location.
    
5. In the **Resource types** drop-down, start to type "virtual machines", and select **Virtual machines**.
    
6. Check the box next to **vm1**, then select **Apply** at the bottom of the pane.
    
    ![Screenshot that shows the 'Select a resource' pane, with `vm1` selected.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/4-select-resource-scope.png)
    
7. Select **Next:Condition** at the bottom of the page.
    
8. In the **Signal name** drop-down, select **Percentage CPU**.
    
9. In the **Alert logic** section, enter (or confirm) the following values for each setting.
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |**Alert logic**||
    |Threshold|Static|
    |Aggregation type|Maximum|
    |Operator|Greater than|
    |Threshold value|90|
    |**When to evaluate**||
    |Check every|1 minute|
    |Lookback period|1 minute|
    
    ![Screenshot that shows the settings for metric condition logic.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/4-metric-alert-logic.png)
    
10. Select the **Details** tab at the top of the page. In the **Alert rule details** section, enter the following values for each setting.
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |Severity|2 - Warning|
    |Alert rule name|Cpu90PercentAlert|
    |Description|Virtual machine is running at or greater than 90% CPU utilization|
    
11. Expand the **Advanced options** section and confirm the following values for each setting.
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |Enable upon creation|Yes (checked)|
    |Automatically resolve alerts|Yes (checked)|
    
    [![Screenshot that shows the completed settings for the Alert rule details section.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/4-metric-alert-details.png)](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/4-metric-alert-details.png#lightbox)
    
12. Select **Review + create** to validate your input, and then select **Create**.
    

You successfully created a metric alert rule that triggers an alert when the CPU percentage on the VM exceeds 90 percent. The rule checks every minute and reviews one minute of data. It can take up to 10 minutes for a metric alert rule to become active.

## Create the metric alert through the CLI

You can also set up metric alerts by using the CLI. This process can be quicker than using the portal, especially if you're planning to set up more than one alert.

Let's create a new metric alert similar to the one you set up in the Azure portal.

1. Run the following command in Cloud Shell to obtain the resource ID of the virtual machine you previously created:
    
    BashCopy
    
    ```
    VMID=$(az vm show \
            --resource-group "[sandbox resource group name]" \
            --name vm1 \
            --query id \
            --output tsv)
    ```
    
2. Run the following command to create a new metric alert. The alert is triggered when the VM CPU is greater than 80 percent.
    
    Azure CLICopy
    
    ```
    az monitor metrics alert create \
        -n "Cpu80PercentAlert" \
        --resource-group "[sandbox resource group name]" \
        --scopes $VMID \
        --condition "max percentage CPU > 80" \
        --description "Virtual machine is running at or greater than 80% CPU utilization" \
        --evaluation-frequency 1m \
        --window-size 1m \
        --severity 3
    ```
    

## View your metric alerts in Azure Monitor

In this exercise, you set up an Ubuntu VM and configured it to stress test the CPU. You also created a metric rule to detect when the maximum CPU percentage exceeds 80 percent and 90 percent.

 Note

It might take 10 minutes before you see the alerts show up in the Azure portal.

1. Return to the [Azure portal](https://portal.azure.com/learn.docs.microsoft.com).
    
2. On the Azure portal menu, select **Monitor**, and then select **Alerts** in the left menu pane.
    
    This step presents the Alert summary pane, where you can see the count of the number of alerts. If you don't see your alerts listed, wait a few minutes and select **Refresh**.
    
    ![Screenshot that shows the alert summary pane.' pane.](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/media/4-alert-summary-pane.png)
    
3. You configured your metric alerts with severities of 2 and 3. Select one of the alerts to view the severity level.
    
4. Select one of the alerts to show the alert details.