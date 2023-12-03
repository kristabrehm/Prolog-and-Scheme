;Krista Brehm
; Scheme Guessing Game

guess() :-
	write('Try to guess a number between 1 and 10.'), 
	nl,
	random(1, 10, Number),
	write('|: '),
	play_game(Number).

play_game(Number):-
	read(UserGuess),
	check_userguess(UserGuess, Number).

check_userguess(UserGuess, Number):-
   (	UserGuess == Number ->
	write('Correct!')
   ;	UserGuess < Number ->
	write('Higher. '), 
	play_game(Number)
   ;	UserGuess > Number ->
	write('Lower. '), 
	play_game(Number)
   ).
