; Krista Brehm
; Scheme Guessing Game

(#%require (lib "27.ss" "srfi"))
(random-source-randomize! default-random-source)

;we only have one function: play_guess
;the function takes 2 parameters: the number the user guesses and the correct number they're trying to guess
(define (play_guess guessingnumber target)
  (display "Guess a number from 1 to 100:")
  (newline)
  ;let allows us to bind to local variables
  (let ((num (read))
        ;setting the number of guesses equal to 1
        (numberofguesses 1)
        (gameover #f))
    (let loop ((guess num))
      ;use cond to address multiple different scenarios
      (cond
        ;if the user's guess is the exact number to guess
        ((= guess guessingnumber)
         (set! gameover #t)
         (display "Correct! ")
         (display numberofguesses)
         (display " guesses... Please enter your name: ")
         (newline)
           (let ((name (read)))
             (display "Good game, ")
             (display name)
             (newline)))
        ;if the user's guess is less than the exact number
        ((< guess guessingnumber)
           (display "Higher...")
           (newline))
        ;if the user's guess is greater than the exact number
        ((> guess guessingnumber)
           (display "Lower...")
           (newline)))
      
      ;we need to addresss that if the game is not over, it continues until the correct number is guessed
      (if (not gameover)
        (begin
          (display "Enter guess: ")
          (let ((num (read)))
            ;every time the user does not guess correctly, the number of guesses increases
            (set! numberofguesses (+ numberofguesses 1))
            (loop num)))))))


; Call the game with specified arguments
(play_guess (+ (random-integer 99) 1) 100)
