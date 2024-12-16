---
tags: python data-type list built-in sum-function math function
---

# List Data Type Work Using the sum-function

- In python we use [] for lists using a , to separate each item.
- The sum() function in python will add up the values for you.
```python
height = [1.7, 0.66, 1.09]  # Ahsoka, Yoda, R2D2 heights in meters
print(type(height))  # Print the type of variable 'height'
print(sum(height))  # Print the sum of the list called height
```

# Grocery Shopping list app

- append() Function will add an item to the end of the list
- remove() will remove an item from the list
- len() will give you the amount of items in a list.
```python
# Create the initial shopping list
shopping_list = ["Milk", "Eggs", "Bread", "Bananas"]

# Add "Apples" to the end of the list
shopping_list.append("Apples")

# Remove "Bread" from the list
shopping_list.remove("Bread")

def show_list(lst):
    """Print each item in the list on a new line."""
    for item in lst:
        print(item)

def total_items(lst):
    """Return the number of items in the list."""
    return len(lst)

# Call show_list with shopping_list
print("Shopping List:")
show_list(shopping_list)

# Call total_items with shopping_list and display the result
print(f"\nTotal number of items: {total_items(shopping_list)}")
```