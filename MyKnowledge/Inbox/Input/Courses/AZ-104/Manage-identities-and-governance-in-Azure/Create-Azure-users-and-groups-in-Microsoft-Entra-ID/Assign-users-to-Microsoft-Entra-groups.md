---
tags: 
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Exercise - Assign users to Microsoft Entra groups

Completed100 XP

- 5 minutes

In this exercise, you'll create a Microsoft Entra group to manage the developer team's access. You'll also add a rule for the group to manage the membership automatically.

 Note

This exercise depends on having completed prior exercises in this module. If you haven't done so, complete [the exercise in unit 3](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/3-exercise-add-delete-users-azure-ad) before you begin.

## Add a new group

1. Sign in to the [Azure portal](https://portal.azure.com/).
    
2. Go to the Microsoft Entra ID you created earlier in this module.
    
3. In the left menu pane, under **Manage**, select **Groups**. The **All groups** pane appears for your Microsoft Entra ID.
    
4. On the top menu bar, select **New group**. The **New Group** pane appears.
    
5. Enter the following values for each setting.
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |Group type|Security|
    |Group name|Developer group|
    |Group description|Developer team|
    
6. Select **Create**. The **Groups | All groups** pane appears, including the new group in the list of Groups. You might need to refresh to see your new group.
    

## Use direct assignment to add a user to this group

You'll now assign members to the Developer group.

1. Select **Developer group**. The **Developer group** pane appears for your group.
    
2. In the left menu pane, under **Manage**, select **Members**. The **Members** pane appears for your developer group.
    
3. On the top menu bar, select **Add members**.
    
    ![Screenshot that shows Add member button.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/5-add-group-member.png)
    
    The **Add members** pane appears.
    
4. Search for **Chris Green** and select the check box next to the user.
    
5. Select the **Select** button. You'll see this user in the _Direct members_ list for the Developers group in the **Members** pane. You might need to refresh to see the users.
    

## Modify the group to use dynamic assignment

You can change the group to use dynamic assignment. Membership then depends on whether a user meets the rules you set for the group.

If you didn't activate the free trial for Microsoft Entra ID P1 or P2, you won't be able to complete this section. That's okay; you can still learn how to change the group to use dynamic assignment.

1. In the left menu pane, under **Manage**, select **Properties**. The **Properties** pane appears for your developer group.
    
2. Change the **Membership type** to **Dynamic User**.
    
3. Under **Dynamic user members**, select the **Add dynamic query** link.
    
    ![Screenshot that shows the Add dynamic query link.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/5-add-dynamic-query.png)
    
    The **Dynamic membership rules** pane appears.
    
4. On the **Configure Rules** tab, select the following values for the rule:
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |Property|country|
    |Operator|Equals|
    |Value|United States|
    
    ![Screenshot that shows how to assign a dynamic membership rule.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/5-dynamic-member.png)
    
    The membership of this group now depends on whether the user is in the United States.
    
5. Select another field to enable **Save**.
    
6. On the top menu bar, select **Save**. The **Properties** pane reappears for your developer group.
    

## Change group back to assigned

You'll need to assign a guest user to the Developer group in the next exercise, so let's change the membership type back to **Assigned**.

1. Change the **Membership type** to **Assigned**.
    
2. On the top menu bar, select **Save**.