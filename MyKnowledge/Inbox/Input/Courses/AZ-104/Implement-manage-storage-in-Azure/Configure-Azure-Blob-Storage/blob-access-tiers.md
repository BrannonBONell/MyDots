---
tags:
  - azure
  - microsoft
  - blob
  - access
  - tiers
  - devops
  - cloud
  - storage
cssclasses: cornell-left cornell-border
date: "10-13-2024"
---

# Blob-access-tiers

### Big Picture: Understanding Access Tiers

Azure Blob Storage supports several access tiers designed to manage costs effectively based on how often you access your data. The tiers—Hot, Cool, Cold, and Archive—offer different price-performance trade-offs so you can align storage costs with access frequency.

### Detailed Focus: Characteristics of the Blob Access Tiers

1. **Hot Tier:**
   - **Optimized for:** Frequent access (read and write operations).
   - **Use Case:** Actively processed data, such as data constantly needed for applications or user interactions.
   - **Cost Structure:** 
     - Higher storage costs.
     - Lower access costs.
   - **Availability:** 99.9% (higher with RA-GRS).

2. **Cool Tier:**
   - **Optimized for:** Infrequent access with short data retention needs.
   - **Use Case:** Data like short-term backup, disaster recovery datasets, and content that isn't accessed frequently but needs to be available immediately.
   - **Cost Structure:** 
     - Lower storage costs compared to Hot.
     - Higher access costs than Hot.
   - **Availability:** 99%. Data should remain in this tier for a minimum of 30 days to avoid early deletion penalties.

3. **Cold Tier:**
   - **Optimized for:** Infrequent data access similar to Cool but with a longer retention period.
   - **Use Case:** Data that can be accessed infrequently and should remain in this tier for a minimum of 90 days.
   - **Availability:** 99%.

4. **Archive Tier:**
   - **Optimized for:** Rarely accessed data where retrieval time isn't a concern.
   - **Use Case:** Data retention focused such as secondary backups, original copies, or compliance data.
   - **Cost Structure:**
     - Lowest storage costs.
     - Higher access and retrieval latency, which may be up to several hours.
   - **Availability:** 99%. Data must reside here for at least 180 days, subject to early deletion charges.

### Comparison: Analyzing Tier Features

| Feature                    | Hot Tier  | Cool Tier | Cold Tier | Archive Tier |
|----------------------------|-----------|-----------|-----------|--------------|
| Availability               | 99.9%     | 99%       | 99%       | 99%          |
| Availability (RA-GRS reads)| 99.99%    | 99.9%     | 99.9%     | 99.9%        |
| Latency                    | milliseconds | milliseconds | milliseconds | hours        |
| Minimum Storage Duration   | N/A       | 30 days   | 90 days   | 180 days     |

### Configuring and Managing Tiers

- **Azure Portal:**
  - Navigate to your Azure storage account to configure or change the blob access tier.
  - Changing the tier can help optimize costs based on your usage patterns.

### Questions to Consider:

To make a well-informed decision about which tier to use, think deeply about the following:

1. How often is the data accessed, and what is the acceptable level of latency?
2. What are the cost implications of storage versus access?
3. What is the minimum time the data needs to stay in a specific tier?
4. Can your application handle delays in data retrieval from the Archive tier?

### Application Insight:

By choosing the appropriate access tier, you can significantly lower your Azure storage costs while ensuring that your application requirements are met. Optimizing your blob storage configuration involves understanding both your current and projected access patterns.
