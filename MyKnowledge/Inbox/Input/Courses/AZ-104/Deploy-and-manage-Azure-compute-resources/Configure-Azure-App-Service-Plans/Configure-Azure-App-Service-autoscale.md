---
tags: azure microsoft devops cloud app service configure autoscale
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Configure Azure App Service autoscale

**Overview:** Autoscale allows your Azure App Service to automatically adjust the number of virtual machine instances based on the load on your application. This ensures optimal performance during high traffic and cost savings during low usage by dynamically adding or removing resources.

---

### **Key Concepts of Autoscale**:

1. **Minimum & Maximum Instance Count**:
    
    - **Minimum instance count**: Ensures your app always has enough instances to handle baseline traffic, even when idle.
    - **Maximum instance count**: Limits the total number of instances to control costs.
2. **Autoscale Rules**:
    
    - Autoscale rules are based on triggers (either **metric-based** or **time-based**).
    - **Scale Actions**: Autoscale performs either a **scale-out** (increase instances) or **scale-in** (decrease instances) based on predefined conditions.

---

### **Types of Autoscale Triggers**:

1. **Metric-Based Rules**:
    
    - Trigger scaling actions when application load exceeds a threshold.
    - Common metrics include:
        - **CPU usage**: e.g., scale out when CPU usage is above 50%.
        - **Average response time**.
        - **Requests per second**.
2. **Time-Based Rules (Schedule-Based)**:
    
    - Trigger scaling at specific times or during known traffic patterns.
    - Example: Scale out every **Saturday at 8:00 AM** to handle a scheduled load increase.

![Screenshot that shows how to create an autoscale condition in the Azure portal, including settings for the scale mode and instance count.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-app-service-plans/media/web-app-autoscale-94c4da54.png)

---

### **Autoscale Profiles & Settings**:

- **Profiles**: Autoscale settings are grouped into profiles, each containing specific rules and triggers.
- **Autoscale Engine**: Reads the autoscale settings and determines when to scale out or in based on rules.
- **Notifications**: Autoscale can notify you via email or webhook when an autoscale event occurs.

---

### **Considerations for Configuring Autoscale**:

1. **Set an Adequate Scale Margin**:
    
    - Ensure there is a difference between your minimum and maximum instance counts to allow for flexibility in scaling.
2. **Combine Scale-Out and Scale-In Rules**:
    
    - Always set both **scale-out** and **scale-in** rules to handle both increasing and decreasing loads.
    - **Without a scale-out rule**, the application might fail under heavy load.
    - **Without a scale-in rule**, you may incur unnecessary costs during periods of low load.
3. **Metric Statistics**:
    
    - Choose the right metric statistic (e.g., Average, Minimum, Maximum, Total) to trigger scaling actions based on accurate data.
4. **Default Instance Count**:
    
    - Set a safe default instance count for when metrics aren’t available. This ensures the application can still handle load in the absence of metric data.
5. **Autoscale Notifications**:
    
    - Always configure notifications to stay informed about how your app is scaling and performing as load conditions change.

---

### **Example of an Autoscale Setup**:

- **Metric-Based Rule**: "Scale out by 2 instances when CPU usage is above 60% for 5 minutes."
- **Time-Based Rule**: "Scale out to 10 instances every Saturday at 8:00 AM."

This setup ensures that your application scales out during peak traffic times (based on CPU or schedule) and scales in to save costs during low traffic times.

---

### **Summary**:

- **Autoscale** ensures your app has the right amount of resources at the right time, helping maintain performance during high traffic and saving money during idle periods.
- **Configure both scale-out and scale-in rules** to balance performance and cost.
- **Metric-based rules** monitor real-time application performance, while **time-based rules** prepare your app for scheduled traffic changes.
- Always use **notifications** to stay aware of autoscale events and monitor application performance.
