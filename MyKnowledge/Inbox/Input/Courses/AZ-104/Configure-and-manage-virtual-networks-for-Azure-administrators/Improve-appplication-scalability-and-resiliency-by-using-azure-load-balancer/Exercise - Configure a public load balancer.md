---
tags: azure cloud devops microsoft configure a public load balancer exercise
date: 18th-October-2024
---

You can configure Azure Load Balancer by using the Azure portal, PowerShell, or the Azure CLI.

In your healthcare organization, you want to load-balance client traffic to provide a consistent response based on the patient portal web servers' health. You have two virtual machines (VMs) in an availability set to act as your healthcare-portal web application.

Here, you create a load balancer resource and use it to distribute a load across the virtual machines.

## Deploy the patient portal web application

First, deploy your patient-portal application across two virtual machines in a single availability set. To save time, let's start by running a script to create this application. The script:

- Creates a virtual network and network infrastructure for the virtual machines.
- Creates two virtual machines in this virtual network.

To deploy the patient portal web application:

1. Run the following `git clone` command in Azure Cloud Shell. The command clones the repo that contains the source for the app and runs the setup script from GitHub. Then changes to the directory of the cloned repo.
    
    BashCopy
    
    ```
    git clone https://github.com/MicrosoftDocs/mslearn-improve-app-scalability-resiliency-with-load-balancer.git
    cd mslearn-improve-app-scalability-resiliency-with-load-balancer
    ```
    
2. As its name suggests, the script generates two virtual machines in a single availability set. It takes about two minutes to run.
    
    BashCopy
    
    ```
    bash create-high-availability-vm-with-sets.sh [sandbox resource group name]
    ```
    
3. When the script finishes, on the [Azure portal](https://portal.azure.com/learn.docs.microsoft.com) menu or from the **Home** page, select **Resource groups**, then select the **[sandbox resource group name]** resource group. Review the resources created by the script.
    

## Create a load balancer

Let's use the Azure CLI to create the load balancer and its associated resources.

1. Create a new public IP address.
    
    Azure CLICopy
    
    ```
    az network public-ip create \
      --resource-group [sandbox resource group name] \
      --allocation-method Static \
      --name myPublicIP
    ```
    
2. Create the load balancer.
    
    Azure CLICopy
    
    ```
    az network lb create \
      --resource-group [sandbox resource group name] \
      --name myLoadBalancer \
      --public-ip-address myPublicIP \
      --frontend-ip-name myFrontEndPool \
      --backend-pool-name myBackEndPool
    ```
    
3. Create a health probe that allows the load balancer to monitor the healthcare portal's status. The health probe dynamically adds or removes virtual machines from the load-balancer rotation based on their response to health checks.
    
    Azure CLICopy
    
    ```
    az network lb probe create \
      --resource-group [sandbox resource group name] \
      --lb-name myLoadBalancer \
      --name myHealthProbe \
      --protocol tcp \
      --port 80  
    ```
    
4. Now, you need a load balancer rule to define how traffic is distributed to the virtual machines. You define the front-end IP configuration for the incoming traffic and the back-end IP pool to receive the traffic, along with the required source and destination port. To make sure only healthy virtual machines receive traffic, you also define the health probe to use.
    
    Azure CLICopy
    
    ```
    az network lb rule create \
      --resource-group [sandbox resource group name] \
      --lb-name myLoadBalancer \
      --name myHTTPRule \
      --protocol tcp \
      --frontend-port 80 \
      --backend-port 80 \
      --frontend-ip-name myFrontEndPool \
      --backend-pool-name myBackEndPool \
      --probe-name myHealthProbe
    ```
    
5. Connect the virtual machines to the back-end pool by updating the network interfaces that the script created to use the back-end pool information.
    
    Azure CLICopy
    
    ```
    az network nic ip-config update \
      --resource-group [sandbox resource group name] \
      --nic-name webNic1 \
      --name ipconfig1 \
      --lb-name myLoadBalancer \
      --lb-address-pools myBackEndPool
    
    az network nic ip-config update \
      --resource-group [sandbox resource group name] \
      --nic-name webNic2 \
      --name ipconfig1 \
      --lb-name myLoadBalancer \
      --lb-address-pools myBackEndPool
    ```
    
6. Run the following command to get the load balancer's public IP address and your website's URL:
    
    Azure CLICopy
    
    ```
    echo http://$(az network public-ip show \
                    --resource-group [sandbox resource group name] \
                    --name myPublicIP \
                    --query ipAddress \
                    --output tsv)
    ```
    

## Test the load balancer configuration

Let's test the load balancer setup, by showing how it can handle availability and health issues dynamically.

1. In a new browser tab, go to the public IP address that you noted. A response from one of the virtual machines is displayed in the browser.
    
2. Try a "force refresh" by pressing Ctrl+F5 a few times to see that the response is returned randomly from both virtual machines.
    
3. On the [Azure portal](https://portal.azure.com/learn.docs.microsoft.com) menu or from the **Home** page, select **All resources**. Then select **webVM1**, and select **Stop**.
    
4. Return to the tab that shows the website and force a refresh of the webpage. All requests are returned from **webVM2**.