# Exercise - View activity logs for Azure RBAC changes

Completed100 XP

- 4 minutes

First Up Consultants reviews Azure role-based access control (Azure RBAC) changes quarterly for auditing and troubleshooting purposes. You know that changes get logged in the [Azure Activity Log](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log). Your manager has asked if you can generate a report of the role assignment and custom role changes for the last month.

## View activity logs

The easiest way to get started is to view the activity logs with the Azure portal.

1. Select **All services**, then search for **Activity log**.
    
    ![Screenshot of the Azure portal showing the location of Activity logs option.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-all-services-activity-log.png)
    
2. Select **Activity log** to open the activity log.
    
    ![Screenshot of the Azure portal showing the Activity logs.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-activity-log-portal.png)
    
3. Set the **Timespan** filter to **Last month**.
    
4. Add an **Operation** filter and type **role** to filter the list.
    
5. Select the following Azure RBAC operations:
    
    - Create role assignment (roleAssignments)
    - Delete role assignment (roleAssignments)
    - Create or update custom role definition (roleDefinitions)
    - Delete custom role definition (roleDefinitions)
    
    ![Screenshot showing a list of Operation filter with the four filters selected.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-operation-filter.png)
    
    After a moment, you'll get a list of all the role assignment and role definition operations for the last month. There's also a button at the top of the screen to download the activity log as a CSV file.
    
6. Select one of the operations to get the activity log details.
    
    ![Screenshot showing the details for an activity log.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-activity-log-details.png)
    

In this unit, you learned how to use Azure Activity Log to list Azure RBAC changes in the portal and generate a simple report.