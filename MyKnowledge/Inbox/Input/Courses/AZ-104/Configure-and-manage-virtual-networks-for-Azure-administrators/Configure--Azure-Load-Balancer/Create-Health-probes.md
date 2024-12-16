---
tags: azure cloud devops microsoft create health probes
date: 15th-October-2024
---

# Create health probes

**Overview**: Health probes in Azure Load Balancer are used to monitor the health and status of back-end resources (e.g., virtual machines). The probes check whether the application or service running on a virtual machine is healthy and capable of receiving traffic. If a probe fails, the load balancer stops sending traffic to the unhealthy instance.

![Screenshot that shows how to create a health probe in the Azure portal.](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-load-balancer/media/add-health-probe-1d86fb2b.png)
---

### **Types of Health Probes**:

1. **HTTP Probes**:
    
    - The load balancer checks the health of virtual machine instances by sending an **HTTP request** to a specified URL.
    - A virtual machine is considered healthy if it responds with **HTTP 200** (OK) status code.
    - If any other HTTP status code is returned, the instance is marked as **unhealthy**.
    - **Default interval** between probe attempts is 15 seconds, and the **timeout** period is 31 seconds.
2. **TCP Probes**:
    
    - The load balancer establishes a **TCP connection** to a specified port on the virtual machine.
    - If the TCP connection is successful, the probe passes, and the VM is considered healthy.
    - If the TCP connection is refused or fails, the probe marks the instance as **unhealthy**.
    - This type of probe is typically used when the application does not have an HTTP-based endpoint.
3. **Guest Agent Probe**:
    
    - Uses the **guest agent** running inside the virtual machine to check the health of the instance.
    - This probe is **not recommended** if you can configure an HTTP or TCP probe, as it depends on the agent running inside the VM.

---

### **How Health Probes Work**:

1. **Regular Monitoring**:
    
    - Health probes check the status of back-end virtual machines at regular intervals (e.g., every 5-15 seconds).
    - If the application or service on the virtual machine responds correctly, the instance is marked as **healthy**.
2. **Unhealthy Instances**:
    
    - If the virtual machine fails to respond to the probe within the specified threshold (number of failed attempts), the instance is marked as **unhealthy**.
    - Once marked unhealthy, the load balancer stops sending traffic to that virtual machine.
3. **Recovery**:
    
    - If the unhealthy instance recovers and starts responding to the probes again, it is marked as **healthy**, and traffic is resumed.

---

### **Key Health Probe Settings**:

1. **Port**:
    
    - Specifies the **back-end port** on which the load balancer should probe the virtual machine (e.g., port 80 for HTTP).
2. **URI**:
    
    - For HTTP probes, this specifies the **URI path** the load balancer will use to check the health status of the virtual machine.
3. **Interval**:
    
    - The **interval** is the amount of time between each probe attempt.
    - The default interval is **15 seconds**, but it can be customized.
4. **Unhealthy Threshold**:
    
    - The **unhealthy threshold** defines the number of consecutive failures required for the virtual machine to be marked as **unhealthy**.
    - For example, if the threshold is 2, the virtual machine must fail two consecutive probe checks to be removed from the load balancer rotation.

---

### **Example Configuration**:

- **HTTP Health Probe**:
    - Port: **80**
    - URI: **"/status"**
    - Interval: **5 seconds**
    - Unhealthy threshold: **3**
    - This configuration will check the health of a web application every 5 seconds by sending an HTTP request to `/status`. If the application fails to return HTTP 200 three times in a row, it will be marked as unhealthy.

---

### **Summary of Health Probe Types**:

|**Probe Type**|**How it Works**|**Use Case**|
|---|---|---|
|**HTTP Probe**|Sends an HTTP request to the specified URL. If the response is HTTP 200, the probe succeeds; otherwise, it fails.|Best for web applications with HTTP APIs.|
|**TCP Probe**|Attempts to establish a TCP connection to the specified port. If the connection is successful, the probe succeeds.|Best for non-HTTP applications.|
|**Guest Agent Probe**|Uses the guest agent inside the VM to monitor its health. Not recommended when HTTP or TCP probes can be used.|Only used if HTTP or TCP probes are not an option.|

---

### **Conclusion**:

Azure Load Balancer health probes are crucial for monitoring the health of back-end resources. By using **HTTP** or **TCP** probes, the load balancer can ensure that traffic is only sent to **healthy** virtual machines, enhancing the reliability and performance of your applications. Proper configuration of probe settings (such as port, interval, and unhealthy threshold) ensures optimal traffic distribution and health monitoring.