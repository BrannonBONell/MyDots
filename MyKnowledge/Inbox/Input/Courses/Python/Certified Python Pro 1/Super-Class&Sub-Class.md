---
tags: python programming sub-class super-class course
---

# Super classes & Sub classes

-  If I have the Car Class from above it can be extended to have extra qualities and methods.  I'll call this extension a Sportscar.  The sportrs car would be Really fast and extreme control.
-  It Would also have a sun roof and a Turbo
	-  The SportsCar is Sub Class and Car is now a Super class
	- And any instances/children from SportsCar will have the Methods and Qualities from both Car and SportsCar

![[Drawing 2024-07-05 14.12.00.excalidraw]]



Absolutely, extending classes to create subclasses is a fundamental concept in object-oriented programming (OOP). Let's break down how you can create a `SportsCar` class that inherits from the `Car` class.

### Car Class (Super Class)

First, let's define the `Car` class. This class will have some basic properties and methods that apply to all cars.

```python
class Car:
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year
    
    def start_engine(self):
        print("Engine started")
    
    def stop_engine(self):
        print("Engine stopped")
    
    def honk_horn(self):
        print("Honk! Honk!")
```

### SportsCar Class (Sub Class)

Now, let's create the `SportsCar` class that extends the `Car` class. This subclass will inherit all the properties and methods of the `Car` class and add additional features like turbo and sunroof functionality.

```python
class SportsCar(Car):
    def __init__(self, make, model, year):
        super().__init__(make, model, year)
        self.turbo = False
        self.sunroof_open = False
    
    def activate_turbo(self):
        if not self.turbo:
            self.turbo = True
            print("Turbo activated!")
        else:
            print("Turbo is already on.")
    
    def deactivate_turbo(self):
        if self.turbo:
            self.turbo = False
            print("Turbo deactivated.")
        else:
            print("Turbo is already off.")
    
    def open_sunroof(self):
        if not self.sunroof_open:
            self.sunroof_open = True
            print("Sunroof opened.")
        else:
            print("Sunroof is already open.")
    
    def close_sunroof(self):
        if self.sunroof_open:
            self.sunroof_open = False
            print("Sunroof closed.")
        else:
            print("Sunroof is already closed.")

# Creating an instance of SportsCar
my_sports_car = SportsCar('Ferrari', '488 Spider', 2020)
my_sports_car.start_engine()
my_sports_car.activate_turbo()
my_sports_car.open_sunroof()
my_sports_car.honk_horn()
```

### Explanation

1. **Inheritance**: The `SportsCar` class inherits from the `Car