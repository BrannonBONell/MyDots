---
tags: microsoft azure devops cloud app service secure configure
date: 14th-October-2024
cssclasses:
  - cornell-left
  - cornell-border
---

# Secure your App Service app

**Overview:** Azure App Service offers built-in authentication and authorization support, allowing you to secure your web apps, APIs, mobile backends, and Azure Functions apps with minimal coding. The App Service security module handles various security-related tasks, making it easier to implement secure access without requiring deep knowledge of security protocols.

---

### **Key Features of App Service Authentication & Authorization**:

1. **Security Module**:
    
    - Runs separately from your application code but in the same environment.
    - Configured through **app settings**—no need for SDKs, specific languages, or modifications to your code.
    - Every HTTP request is processed by the security module **before** reaching your application.
2. **Security Module Tasks**:
    
    - **User Authentication**: Supports multiple identity providers (Microsoft, Google, Facebook, X, etc.).
    - **Token Management**: Validates, stores, and refreshes authentication tokens.
    - **Session Management**: Handles the user's authenticated session.
    - **Identity Injection**: Injects identity information into request headers for easier access in your app code.

---

### **Security Configuration Options**:

1. **Allow Anonymous Requests (No Action)**:
    
    - Defers handling of unauthenticated traffic to your app.
    - For authenticated requests, App Service passes authentication information in HTTP headers.
    - Use this option to provide flexibility in managing both anonymous and authenticated traffic.
    - Can support multiple sign-in providers.
2. **Allow Only Authenticated Requests**:
    
    - Redirects **all anonymous requests** to the login page of the specified authentication provider (`/.auth/login/<provider>`).
    - If an anonymous request is made from a native mobile app, it returns a **401 Unauthorized** response.
    - Ideal for apps that require strict authentication (but be cautious if your app needs a public homepage).
    
    **Note**: This setting restricts access to all calls, which might not be suitable for single-page apps or public websites.
    
3. **Logging and Tracing**:
    
    - View authentication and authorization traces in your app logs for easier troubleshooting.
    - Use **failed request tracing** to identify how the security module contributed to a failed authentication or authorization attempt.
    - Check the logs for references to the **EasyAuthModule_32/64** to track security issues.

---

### **Benefits of Using App Service for App Security**:

- **No need to write authentication code**: You can manage user authentication through App Service without integrating complex SDKs or writing custom security logic.
- **Built-in token management**: App Service handles token validation and renewal automatically.
- **Flexibility**: You can choose to allow anonymous access for some pages or enforce strict authentication across all app requests.
- **Multiple sign-in providers**: Easily support different sign-in methods (e.g., Microsoft, Google, Facebook) to provide flexibility for your users.
- **Detailed logging**: Use integrated logs and trace information to monitor and debug authentication and authorization processes.

---

### **Best Practices**:

- Use **Allow Anonymous Requests** if your app includes both public and authenticated sections.
- Use **Allow Only Authenticated Requests** if all parts of your app require authentication, but be cautious with apps that need a public homepage.
- Always enable **logging and tracing** to troubleshoot authentication issues quickly.
- If using multiple sign-in providers, make sure your configuration supports your users' preferred authentication methods.