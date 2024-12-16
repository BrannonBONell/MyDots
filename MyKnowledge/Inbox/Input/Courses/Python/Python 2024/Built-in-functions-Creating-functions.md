---
tags: python functins built-in creating 
---

# Built-in Math Functions

```python
height_ahsoka = 1.7
height_yoda = 0.66
height_r2d2 = 1.09

average_height = (height_ahsoke + height_yoda + height_r2d2) / 3
maximum_height = max(height_ahsoka, height_yoda, height_r2d2)
minimum_height = min(height_ahsoka, height_yoda, height_r2d2)

print"The average height is " + str(average_height) + ". The maximum height is " + str(maximum_height) + ". The minimum height is " + str(minimum_height) + ".")
```

# Built-in Input functions

```python
name = input("What is your name? ")
age = input("What is your age ")
print("Your name is " + name + " and your age is " + age + ".")
```

# Creating a function

```python
# define function name
def age_of_rey():
	the_age_of_rey = input("How old is Rey? ")
	print("Rey's age is " + the_age_of_rey)

age_of_rey()
```

# Creating basic custom function

```python
names = input("Who was on the Titanic? ")
year = input("What year is it? ")

def titanic(name, year):
	year = int(year)
	year = year - 1912
	year = str(year)
	print(names + " were on the Titanic, which sunk " + year + "  years ago.")

titanic(names,year)
```

# Creating Advanced Functions
\
```python
def my_age(age=19):
	print("My age is " + str(age))

my_age(39)
my_age()

```

# Returning Values from a custom function

```python
def convert_cel_to_fahr(a):
	return a * 1.8 + 32

convert_cel_to_fahr(77)
```

# Simple Calculator with functions

```python
# Step 1: Create the add function
def add(a, b):
	return a + b
  

# Step 2: Create the subtract function
def sub(a, b):
	return a - b
  

# Step 3: Create the multiply function
def multiply(a, b):
	return a * b
  

# Step 4: Create the divide function
def divide(a, b):
	return a / b
  

# Step 5: Take user input for numbers
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))
  

# Step 6: Take user input for the operator
operator = input("Enter an operator (+, -, *, /):")

if operator == '+':
	print("The result is:", add(num1, num2))
elif operator == '-':
	print("The result is:", sub(num1, num2))
elif operator == '*':
	print("The result is:", multiply(num1, num2))
elif operator == '/':
	print("The result is:", divide(num1, num2))
else:
	print("Invalid operator")
```