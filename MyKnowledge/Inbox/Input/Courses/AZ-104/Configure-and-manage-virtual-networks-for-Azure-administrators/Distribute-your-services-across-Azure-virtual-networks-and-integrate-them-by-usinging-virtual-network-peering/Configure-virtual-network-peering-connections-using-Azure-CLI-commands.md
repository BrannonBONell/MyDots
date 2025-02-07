---
tags: azure cloud devops microsoft configure virtual network peering cli commands
date: 16th-October-2024
---
# Configure-virtual-network-peering-connections-using-Azure-CLI-commands

You've created virtual networks and run virtual machines (VMs) within them. However, the virtual networks have no connectivity, and none of these systems can communicate with each other.

To enable communication, you need to create peering connections for the virtual networks. To satisfy your company's requirements, you'll configure a hub and spoke topology and permit virtual network access when you create the peering connections.

## Create virtual network peering connections

Follow these steps to create connections between the virtual networks and to configure the behavior of each connection.

1. In Cloud Shell, run the following command to create the peering connection between the **SalesVNet** and **MarketingVNet** virtual networks. This command also permits virtual network access across this peering connection.
    
    Azure CLICopy
    
    ```
    az network vnet peering create \
        --name SalesVNet-To-MarketingVNet \
        --remote-vnet MarketingVNet \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name SalesVNet \
        --allow-vnet-access
    ```
    
2. Run the following command to create a reciprocal connection from **MarketingVNet** to **SalesVNet**. This step completes the connection between these virtual networks.
    
    Azure CLICopy
    
    ```
    az network vnet peering create \
        --name MarketingVNet-To-SalesVNet \
        --remote-vnet SalesVNet \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name MarketingVNet \
        --allow-vnet-access
    ```
    

Now that you have connections between Sales and Marketing, create connections between Marketing and Research.

1. In Cloud Shell, run the following command to create the peering connection between the **MarketingVNet** and **ResearchVNet** virtual networks:
    
    Azure CLICopy
    
    ```
    az network vnet peering create \
        --name MarketingVNet-To-ResearchVNet \
        --remote-vnet ResearchVNet \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name MarketingVNet \
        --allow-vnet-access
    ```
    
2. Run the following command to create the reciprocal connection between **ResearchVNet** and **MarketingVNet**:
    
    Azure CLICopy
    
    ```
    az network vnet peering create \
        --name ResearchVNet-To-MarketingVNet \
        --remote-vnet MarketingVNet \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name ResearchVNet \
        --allow-vnet-access
    ```
    

## Check the virtual network peering connections

Now that you've created the peering connections between the virtual networks, make sure the connections work.

1. In Cloud Shell, run the following command to check the connection between **SalesVNet** and **MarketingVNet**:
    
    Azure CLICopy
    
    ```
    az network vnet peering list \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name SalesVNet \
        --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}"\
        --output table
    ```
    
2. You've created only one connection from **SalesVNet**, so you get only one result. In the **PeeringState** column, make sure the status is **Connected**.
    
3. Run the following command to check the peering connection between the **ResearchVNet** and **MarketingVNet** virtual networks:
    
    Azure CLICopy
    
    ```
    az network vnet peering list \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name ResearchVNet \
        --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}"\
        --output table
    ```
    
4. Again, you've created only one connection from **ResearchVNet**, so you get only one result. In the **PeeringState** column, make sure the status is **Connected**.
    
5. Run the following command to check the peering connections for the **MarketingVNet** virtual network.
    
    Azure CLICopy
    
    ```
    az network vnet peering list \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --vnet-name MarketingVNet \
        --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}"\
        --output table
    ```
    
    Remember that you created connections from Marketing to Sales and from Marketing to Research, so you should get two connections. In the **PeeringState** column, make sure the status of both connections is **Connected**.
    

Your peering connections between the virtual networks should now look like this:

![Diagram of the resulting virtual network peering connections.](https://learn.microsoft.com/en-us/training/modules/integrate-vnets-with-vnet-peering/media/4-vnet-peering-configure-connections-result.svg)

## Check effective routes

You can further check the peering connection by looking at the routes that apply to the network interfaces of the VMs.

1. Run the following command to look at the routes that apply to the **SalesVM** network interface:
    
    Azure CLICopy
    
    ```
    az network nic show-effective-route-table \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --name SalesVMVMNic \
        --output table
    ```
    
    The output table shows the effective routes for the VM's network interface. For **SalesVMVMNic**, you should have a route to **10.2.0.0/16** with _Next Hop Type_ of **VNetPeering**. This is the network route for the peering connection from **SalesVNet** to **MarketingVNet**.
    
    OutputCopy
    
    ```
    Source    State    Address Prefix    Next Hop Type    Next Hop IP
    --------  -------  ----------------  ---------------  -------------
    Default   Active   10.1.0.0/16       VnetLocal
    Default   Active   10.2.0.0/16       VNetPeering
    Default   Active   0.0.0.0/0         Internet
    Default   Active   10.0.0.0/8        None
    Default   Active   100.64.0.0/10     None
    Default   Active   192.168.0.0/16    None
    ```
    
2. Run the following command to look at the routes for **MarketingVM**:
    
    Azure CLICopy
    
    ```
    az network nic show-effective-route-table \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --name MarketingVMVMNic \
        --output table
    ```
    
    The output table shows the effective routes for the VM's network interface. For **MarketingVMVMNic**, you should have a route to **10.1.0.0/16** with a next hop type of **VNetPeering** and a route to **10.3.0.0/16** with a next hop type of **VNetGlobalPeering**. These are the network routes for the peering connection from **MarketingVNet** to **SalesVNet** and from **MarketingVNet** to **ResearchVNet**.
    
    OutputCopy
    
    ```
    Source    State    Address Prefix    Next Hop Type      Next Hop IP
    --------  -------  ----------------  -----------------  -------------
    Default   Active   10.2.0.0/16       VnetLocal
    Default   Active   10.1.0.0/16       VNetPeering
    Default   Active   0.0.0.0/0         Internet
    Default   Active   10.0.0.0/8        None
    Default   Active   100.64.0.0/10     None
    Default   Active   192.168.0.0/16    None
    Default   Active   10.3.0.0/16       VNetGlobalPeering
    ```
    
3. Run the following command to look at the routes for **ResearchVM**:
    
    Azure CLICopy
    
    ```
    az network nic show-effective-route-table \
        --resource-group "learn-98acabb0-0706-43c9-b3ed-408d9f7e21d0" \
        --name ResearchVMVMNic \
        --output table
    ```
    
    The output table shows the effective routes for the VM's network interface. For **ResearchVMVMNic**, you should have a route to **10.2.0.0/16** with a next hop type of **VNetGlobalPeering**. This is the network route for the peering connection from **ResearchVNet** to **MarketingVNet**.
    
    OutputCopy
    
    ```
    Source    State    Address Prefix    Next Hop Type      Next Hop IP
    --------  -------  ----------------  -----------------  -------------
    Default   Active   10.3.0.0/16       VnetLocal
    Default   Active   0.0.0.0/0         Internet
    Default   Active   10.0.0.0/8        None
    Default   Active   100.64.0.0/10     None
    Default   Active   192.168.0.0/16    None
    Default   Active   10.2.0.0/16       VNetGlobalPeering
    ```
    

Now that your peering connections are configured, let's take a look at how this affects the communication between VMs.