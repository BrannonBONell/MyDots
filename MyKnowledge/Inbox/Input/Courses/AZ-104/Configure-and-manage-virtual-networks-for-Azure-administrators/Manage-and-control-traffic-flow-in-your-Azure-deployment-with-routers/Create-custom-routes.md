---
tags: azure cloud devops microsoft create custom routes
date: 17th-October-2024
---

As you implement your security strategy, you want to control how network traffic is routed across your Azure infrastructure.

In the following exercise, you use a network virtual appliance (NVA) to help secure and monitor traffic. You want to ensure communication between front-end public servers and internal private servers is always routed through the appliance.

You configure the network so that all traffic flowing from a public subnet to a private subnet will be routed through the NVA. To make this flow happen, you create a custom route for the public subnet to route this traffic to a perimeter-network subnet. Later, you deploy an NVA to the perimeter-network subnet.

![Diagram of virtual network, subnets, and route table.](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/media/3-virtual-network-subnets-route-table.svg)

In this exercise, you create the route table, custom route, and subnets. You'll then associate the route table with a subnet.

## Create a route table and custom route

The first task is to create a new routing table and then add a custom route for all traffic intended for the private subnet.

 Note

You might get an error that reads: _This command is implicitly deprecated_. Please ignore this error for this learning module. We're working on it!

1. In the Cloud Shell window on the right side of the screen, select the **More** icon (**...**), then select **Settings** > **Go to Classic version**.
    
2. In Azure Cloud Shell, run the following command to create a route table:
    
    Azure CLICopy
    
    ```
        az network route-table create \
            --name publictable \
            --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
            --disable-bgp-route-propagation false
    ```
    
3. Run the following command in Cloud Shell to create a custom route:
    
    Azure CLICopy
    
    ```
        az network route-table route create \
            --route-table-name publictable \
            --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
            --name productionsubnet \
            --address-prefix 10.0.1.0/24 \
            --next-hop-type VirtualAppliance \
            --next-hop-ip-address 10.0.2.4
    ```
    

## Create a virtual network and subnets

The next task is to create the **vnet** virtual network and the three subnets you need: **publicsubnet**, **privatesubnet**, and **dmzsubnet**.

1. Run the following command to create the **vnet** virtual network and the **publicsubnet** subnet:
    
    Azure CLICopy
    
    ```
        az network vnet create \
            --name vnet \
            --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
            --address-prefixes 10.0.0.0/16 \
            --subnet-name publicsubnet \
            --subnet-prefixes 10.0.0.0/24
    ```
    
2. Run the following command in Cloud Shell to create the **privatesubnet** subnet:
    
    Azure CLICopy
    
    ```
        az network vnet subnet create \
            --name privatesubnet \
            --vnet-name vnet \
            --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
            --address-prefixes 10.0.1.0/24
    ```
    
3. Run the following command to create the **dmzsubnet** subnet:
    
    Azure CLICopy
    
    ```
        az network vnet subnet create \
            --name dmzsubnet \
            --vnet-name vnet \
            --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
            --address-prefixes 10.0.2.0/24
    ```
    
4. You should now have three subnets. Run the following command to show all of the subnets in the **vnet** virtual network:
    
    Azure CLICopy
    
    ```
        az network vnet subnet list \
            --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
            --vnet-name vnet \
            --output table
    ```
    

## Associate the route table with the public subnet

The final task in this exercise is to associate the route table with the **publicsubnet** subnet.

Run the following command to associate the route table with the public subnet.

Azure CLICopy

```
    az network vnet subnet update \
        --name publicsubnet \
        --vnet-name vnet \
        --resource-group "learn-53b95eb3-3399-4c50-99f9-ec7a3ec17835" \
        --route-table publictable
```