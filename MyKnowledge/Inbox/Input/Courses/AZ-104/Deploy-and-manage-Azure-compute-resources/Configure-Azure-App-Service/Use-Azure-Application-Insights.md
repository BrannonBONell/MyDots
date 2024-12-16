---
tags: microsoft azure devops cloud configure app servicew application-insights
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Use Azure Application Insights

**Overview:** Azure Application Insights is a powerful monitoring and analytics tool that helps you monitor the performance, usability, and behavior of your live applications. It integrates with Azure App Service to automatically detect performance anomalies, diagnose issues, and understand user activity. Application Insights is part of **Azure Monitor** and works across various platforms.

---

### **Key Features of Application Insights**:

1. **Platform Support**:
    
    - Works with **.NET, Node.js, Java EE**, and more.
    - Supports apps hosted on **on-premises, hybrid environments**, or **any public cloud**.
2. **Integration**:
    
    - Integrates with your **Azure DevOps** process and supports many development tools.
    - Can monitor and analyze mobile apps by integrating with **Visual Studio App Center**.
    - Connects with tools like **Power BI** and **Visual Studio** for advanced analytics and diagnostics.

---

### **Things to Monitor with Application Insights**:

1. **Request Rates, Response Times, and Failure Rates**:
    
    - Monitor the most popular pages, peak usage times, and user locations.
    - Identify performance issues and possible **resourcing problems** if response times and failure rates increase with more traffic.
2. **Dependency Rates, Response Times, and Failure Rates**:
    
    - Discover if **external services** are slowing down your app or causing failures.
3. **Exceptions**:
    
    - Analyze aggregated statistics or drill into specific **stack traces** and related requests for both server and browser-side exceptions.
4. **Page Views and Load Performance**:
    
    - Track **page views** from users' browsers and analyze **load times** to determine performance issues.
5. **User and Session Counts**:
    
    - Monitor how many users and sessions are connected to your app.
6. **Performance Counters**:
    
    - Add **performance counters** from your Windows or Linux servers to monitor key metrics like **CPU, memory, network usage**, etc.
7. **Host Diagnostics**:
    
    - Collect **diagnostics** from Docker containers or Azure resources to monitor host performance and issues.
8. **Diagnostic Trace Logs**:
    
    - Use trace logs to correlate trace events with requests and diagnose issues within your app.
9. **Custom Events and Metrics**:
    
    - Create **custom events and metrics** to track specific business activities (e.g., items sold, user actions) or custom performance metrics.

![Diagram that shows Azure Application Insights receiving information from web pages, client apps, and web services, which is transferred to Alerts, Power BI, and Visual Studio.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-app-services/media/app-insights-16629887.png)

---

### **Things to Consider When Using Application Insights**:

- **Request and Response Monitoring**: Keep an eye on how quickly your app responds and whether any specific page or time of day correlates with higher failure rates.
- **External Dependencies**: If your app relies on external services (like APIs), Application Insights helps you identify when these dependencies are slowing down or failing.
- **Exception Tracking**: Both server and client-side exceptions can be tracked, providing detailed insights to resolve bugs faster.
- **User Activity Monitoring**: Application Insights lets you track user behavior, helping you improve user experience by understanding how your app is being used.
- **Custom Metrics**: Tailor the monitoring to your specific business needs by tracking custom events or metrics important to your business operations.

---

### **Best Practices**:

- **Monitor Key Performance Indicators** like response times and failure rates to maintain high app availability.
- **Integrate with DevOps**: Use the data from Application Insights to feed into your continuous deployment process for improved performance and issue resolution.
- **Use Custom Events**: Define your own business-critical events or metrics to get more tailored insights into app performance and user behavior.
- **Analyze Trace Logs**: Implement diagnostic trace logs to help correlate application events with performance issues and user behavior.