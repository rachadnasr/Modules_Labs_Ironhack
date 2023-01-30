#!/usr/bin/env python
# coding: utf-8



# Add the welcome to the game and add list the different levels
list_level=["1","2","3"]
print("                 WELCOME TO THE GAME: GUESS THE NUMBER") 
print("\nEntrer 1 for Easy level \nEntrer 2 for Medium level \nEntrer 3 for Hard level")

# Let the player choose the level of the game and provide the criteria for each level
level=input("\nChoose the level of the game: ")
while level not in list_level:
    level=input("\nThe level is not correct, choose only the number 1,2 or 3 : ")
    
if level=="1":
    print("\n           YOU CHOSE THE EASY LEVEL \n               LET'S GO - Just 5 attempts")
    x=1
    y=10
    trial=5
elif level=="2":
    print("\n           YOU CHOSE THE MEDIUM LEVEL \n              LET'S GO - Just 7 attempts")
    x=10
    y=100 
    trial=7
elif level=="3":
    print("\n           YOU CHOSE THE HARD LEVEL \n                 LET'S GO - Just 10 attempts")
    x=-500
    y=500
    trial=10
    
#Choose a random number (guess)
import random
number=random.randint(x,y)  

#Guess a number:
##Provide the hints to help the player after the choice of number. Provide comments about the outcome.  
##Make sure that the number entered respect the criteria of the level chosen.  
count=0
while count < trial:
    try:
        guess = int(input(f"\nGuess the number between {x} and {y} : "))
        if not x <= guess <= y:
            print("\nInvalid input! The number should be between ",x," and ",y," :  ")
        elif guess > number:
            print("\n ",count+1," attempt - Too high, try again. Hint: the number is less than {}.".format(guess))
        elif guess < number:
            print("\n ",count+1," attempt - Too low, try again. Hint: the number is greater than {}.".format(guess))
        else:
            print("\n            YOU GUESSED IT! The number was", number, "with ",count+1, "attempts")
            break
        count += 1
    except ValueError:
        print("\nInvalid input! Please enter a number.")
else:
    print("\n             YOU LOST THE GAME \nYou have reached the maximum number of attempts. \nThe number was", number)






