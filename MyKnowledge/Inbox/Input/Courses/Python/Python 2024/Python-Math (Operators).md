---
tags: python operators math float integers 
---

# Average of floating numbers

```python
# First define the 4 floats as variables
ahsoka_height = float(1.7)

yoda_height = float(0.66)

r2d2_height = float(1.09)

c3po_height = float(1.75)

# Now average the floating numbers out
print((ahsoka_height + yoda_height + r2d2_height + c3po_height) / 4)
```

# Stringing together Variables

```python
name1 = "Jack"
name2 = "Rose"
year = 1912

print(name1+" and "+name2+" were on the Titanic in " + str(year))
```

# Interest Calculator for a Saving Account

```python
# Step 1: Initialize principal amount
principal = 1000
  

# Step 2: Initialize annual interest rate
rate = 5
  

# Step 3: Initialize time in years
time = 2
  

# Step 4: Calculate Simple Interest
interest = (principal * rate * time) / 100  

# Step 5: Print the calculated interest
print("The Simple interest of a savings account with a principal of " + str(principal) +", a rate of " + str(rate) + ", and a time in years of " + str(time) + " would come out to " + str(interest)) 
# Make sure to include principal, rate, time, and interest in your print statement
```