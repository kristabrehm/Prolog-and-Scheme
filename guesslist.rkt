; Krista Brehm
; Adding Leaderboard to Scheme Guessing Game

(#%require (lib "27.ss" "srfi"))
(random-source-randomize! default-random-source)

;initalize an empty list to store player information
(define players '())

;function to address a guess made in the game
(define (play_guess guessingnumber target)
  (display "Enter guess ")
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
             (newline)
             ;add plaer information to the end of list
             (let ((player_info (list name numberofguesses)))
               (set! players (append players (list player_info))))))

        ;if the user's guess is less than the exact number
        ((< guess guessingnumber)
           (display "Higher..."))
        ;if the user's guess is greater than the exact number
        ((> guess guessingnumber)
           (display "Lower...")))
      
      ;we need to addresss that if the game is not over, it continues until the correct number is guessed
      (if (not gameover)
        (begin
          (display "Enter guess ")
          (let ((num (read)))
            ;every time the user does not guess correctly, the number of guesses increases
            (set! numberofguesses (+ numberofguesses 1))
            (loop num)))))))

;function to print the leaderboard
(define (print_list)
  (display "-------------")
  (newline)
  (for-each
   (lambda (player)
     (display (car player))
     (display " ")
     (display (cadr player))
     (newline)
     (display "-------------")
     (newline))
   players)
  (newline))

;function that asks if you want to play the game again
(define (play)
  (let loop ()
    ;we now want the guess a number prompt to be before the user is asked if they want to play
    (display "Guess a number from 1 to 10:")
    (newline)
    (display "Enter 'q' to quit or any other key to continue:")
    (let ((input (read)))
      (if (not (equal? input 'q))
          (begin
            ;change the range of the game from 1 - 100 to 1 -10
            (play_guess (+ (random-integer 9) 1) 10)
            (newline)
            (loop))
          (print_list)))))

    
;start the game by calling the play function
(play)
