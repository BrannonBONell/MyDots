---
tags: azure microsoft entra-id users add delete devops cloud
date: 12th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Exercise - Add and delete users in Microsoft Entra ID

You need to add member user accounts for the new developer team in your organization.

In this exercise, you'll create a new Microsoft Entra organization to hold all of your user accounts. You'll also create a user account, delete a user account, and learn how to recover a deleted user account.

## Create a Microsoft Entra organization

To hold all of the users you create in this exercise, create a new organization.

 Note

You need to have a paid Azure subscription to create a Microsoft Entra organization. You can't create a Microsoft Entra organization with a free subscription, but you can review the steps below to see how to create one.

1. Sign in to the [Azure portal](https://portal.azure.com/).
    
2. On the Azure portal home page, under **Azure services**, select **Create a resource**.
    
3. In **Create a resource**, in the left menu under **Categories**, select **Identity**. Under **Popular Azure services**, select **Create** under **Microsoft Entra ID**.
    
    ![Screenshot that shows the create link for Microsoft Entra ID under Azure services.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/azure-active-directory-create.png)
    
4. In **Create a tenant**, on the **Basics** tab, enter the following value for the setting.
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |**Tenant type**||
    |Select a tenant type|Microsoft Entra ID|
    
5. Select **Next : Configuration**, and enter the following values for each setting.
    
    Expand table
    
    |Setting|Value|
    |---|---|
    |**Directory details**||
    |Organization name|Enter _Contoso Marketing Company_|
    |Initial domain name|Enter _contosomarketingXXXX_ where you replace XXXX with numbers or letters to make your domain name unique|
    |Location|Select your location from the drop-down|
    
6. Select **Next : Review + create**.
    
7. After validation passes, select **Create**. The **Help us prove you're not a robot** pane appears.
    
8. Enter the appropriate match to the request and select **Submit**. Wait for your tenant creation to complete.
    
9. On the **Help us prove you're not a robot** pane, select the **Click here to navigate to your new tenant: Contoso Marketing Company** link.
    
    ![Screenshot that shows the link to manage your new organization.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/3-switch-directory.png)
    
    The **Overview** pane for _Contoso Marketing Company_ appears.
    

## Get a free trial for Microsoft Entra ID P1 or P2

To complete all the exercises in this module, you'll need to activate a free trial for Microsoft Entra ID P1 or P2.

1. In the left menu pane, under **Manage**, select **Licenses**. The **Overview** pane for _Licenses_ appears.
    
2. On the right side of the pane, under **Quick tasks**, select **Get a free trial**.
    
    ![Screenshot that shows the link to create free trial.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/3-ad-get-started-get-trial.png)
    
    The **Activate** pane appears.
    
3. Under **Microsoft Entra ID P2**, expand **Free trial**, then select **Activate**. If you don't have that option, that's okay. You can complete most of the exercises without it. After the premium license activates, the **Overview** pane for _Licenses_ reappears.
    
4. Return to the **Overview** pane for the Contoso Marketing Company Microsoft Entra ID. On the **Overview** tab, under the **Basic information** section, refresh the browser until you see **Microsoft Entra ID P2** appear next to **License**. It might take a couple of minutes.
    
    ![Screenshot that shows Microsoft Entra ID P2 on the Overview page under Tenant information.](https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/media/3-azure-ad-premium-2.png)
    
    Under **My feed**, you should also see your role listed as the **Global administrator**.
    
5. Under **Basic information**, copy the **Primary domain** name to use in the next section.
    

## Add a new user

Now, let's create a user account.

1. In the Microsoft Entra organization you created, in the left menu pane, under **Manage**, select **Users**. The **All users** pane appears.
    
2. In the top menu bar, select **New user**, then select **Create new user** in the drop-down. The **New user** pane appears for _Contoso Marketing Company_.
    
3. Enter the following values for each setting.
    
    **Identity**
    
    - **User principal name**: `chris@contosomarketingXXXXXX.onmicrosoft.com`. The domain name should match the primary domain you copied in the previous section.
    - **Display name**: _Chris Green_
4. Select **Review + Create**, then select **Create**. The **All users** pane reappears for _Contoso Marketing Company - Microsoft Entra ID_. The user is now created and registered to your organization.
    

## Delete a user

You can delete users after they're created.

1. In your **All users** pane for Microsoft Entra organization, check the box for **Chris Green** in the list.
    
2. In the top menu bar, select **Delete**. If you don't see that option, select **More**.
    
3. Select **OK** to confirm deletion.
    

## Recover a deleted user

You can restore deleted users. View the list of the deleted users, and then restore one.

1. In your **All users** pane for Microsoft Entra organization, in the left menu pane, select **Deleted users** under **Manage**. You now see all of the users that were deleted within the last 30 days.
    
2. Check the box next to **Chris Green** and select **Restore users** in the top menu bar.
    
3. To confirm, select **OK**. The **All users** pane reappears.
    
4. Verify that Chris Green's account is recovered by selecting **All users** in the left menu pane. You should see Chris Green restored as a user.
