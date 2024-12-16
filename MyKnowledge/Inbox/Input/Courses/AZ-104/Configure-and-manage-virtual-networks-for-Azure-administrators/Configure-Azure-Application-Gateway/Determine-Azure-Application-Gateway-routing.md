---
tags: azure cloud devops microsoft application gateway routing
date: 15th-October-2024
---

# Determine Azure Application Gateway Routing

**Overview**: Azure Application Gateway is a powerful Layer 7 load balancer that enables you to route and manage traffic to your web applications based on custom-defined rules. It supports **path-based routing**, **multi-site routing**, **redirection**, **HTTP header rewriting**, and custom error pages.

---
![Diagram that shows a path-based routing approach.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-application-gateway/media/path-based-routing-15bcef5f.png)
### **Key Routing Options in Azure Application Gateway**:

1. **Path-Based Routing**:
    
    - **Path-based routing** directs requests with specific URL paths to different back-end server pools.
    - This is useful when certain types of requests, like image or video requests, need to be routed to specialized servers.
    - **Example**:
        - Requests for `/video/*` go to a pool of servers optimized for video streaming.
        - Requests for `/images/*` go to a pool of servers optimized for image handling.
2. **Multi-Site Routing**:
    
    - **Multi-site routing** allows multiple web applications to be hosted on the same application gateway instance.
    - Each site is associated with a different **DNS name** (CNAME) and listener, directing traffic to the appropriate back-end pool based on the site name.
    - **Example**:
        - Traffic for `http://contoso.com` is routed to one back-end pool.
        - Traffic for `http://fabrikam.com` is routed to a different back-end pool.
    - This approach is ideal for **multi-tenant applications** or when hosting multiple web apps on the same gateway.

---

### **Additional Features of Azure Application Gateway**:

1. **Traffic Redirection**:
    
    - Azure Application Gateway supports **traffic redirection**, commonly used to:
        - Redirect **HTTP traffic to HTTPS** to ensure secure, encrypted communication.
        - Redirect traffic between different listeners or external sites.
    - This helps enforce security by ensuring all client-server communication occurs over **HTTPS**.
2. **HTTP Header Rewriting**:
    
    - The application gateway allows you to **rewrite HTTP headers** on both requests and responses.
    - This is useful for:
        - **URL translation** or modifying query string parameters.
        - Modifying request/response headers for certain conditions.
    - **Example**: Rewriting the `Host` header for traffic going to a specific backend pool.
3. **Custom Error Pages**:
    
    - Instead of using the default error pages, you can configure **custom error pages** in the application gateway.
    - This allows you to maintain your own branding and design when handling errors such as **404 Not Found** or **500 Internal Server Error**.
![Diagram that shows a multiple site routing approach.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-application-gateway/media/site-based-routing-e686b605.png)
---

### **Scenario Examples**:

1. **Path-Based Routing Scenario**:
    
    - A web app receives various types of traffic:
        - **Video requests** (`/video/*`) are directed to a back-end pool optimized for streaming.
        - **Image requests** (`/images/*`) are routed to a separate back-end pool optimized for image retrieval.
    - **Benefit**: Optimizes the performance of different content types by directing them to specialized servers.
2. **Multi-Site Routing Scenario**:
    
    - You need to support two different web applications on the same application gateway instance:
        - Requests to `http://contoso.com` are routed to one set of virtual machines in a back-end pool.
        - Requests to `http://fabrikam.com` are routed to a different set of virtual machines.
    - **Benefit**: Allows you to consolidate hosting multiple websites under the same gateway, reducing cost and complexity.

---

### **Key Features Summary**:

|**Feature**|**Description**|
|---|---|
|**Path-Based Routing**|Routes requests to different back-end pools based on the URL path (e.g., `/video/*` to a pool optimized for video).|
|**Multi-Site Routing**|Hosts multiple web apps on the same gateway instance with separate DNS names and listeners.|
|**Traffic Redirection**|Redirects traffic, such as HTTP to HTTPS, or between listeners or external sites.|
|**HTTP Header Rewriting**|Rewrites request or response headers based on custom conditions.|
|**Custom Error Pages**|Provides branded custom error pages instead of default error pages.|

---

### **Conclusion**:

Azure Application Gateway offers versatile **routing options** for directing traffic based on URL paths or hostnames. Whether it's **path-based routing**, **multi-site routing**, or enabling secure **traffic redirection**, Application Gateway helps ensure efficient and secure traffic management. Additionally, features like **HTTP header rewriting** and **custom error pages** offer advanced customization for modern web applications.