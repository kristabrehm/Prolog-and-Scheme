# Prolog-and-Scheme
This repository deals specifically with the Prolog and Scheme programming languages.

Prolog:
guess_simple.pl is a simple guessing game. The user is guessing a number between 1 and 10, with queues prompting them to guess higher or lower. 

msort.pl is an implementation of merge sort. The file contains 3 rules: one for splitting apart a list, one for merging a list, and one for merge sort that calls both the rules split and merge. 


Scheme:
guess.rkt contains code for a simple guessing game. The game is fully interactive and allows the user to guess a number between 1 and 100. As the user makes guesses, the game prompts the user to guess higher, lower, or indicates if they guessed correctly. 

guesslist.rkt builds off of the guessing game in guess.rkt and adds a leaderboard to the game that is print when the user ends the game. This leaderboard keeps track of the user's name as well as the number of guesses they make. The leaderboard is implemented using a list.
