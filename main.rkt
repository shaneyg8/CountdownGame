#lang racket
;The main file for the numbers game


      ;Define the namespace
(define ns (make-base-namespace))


      ;Initialise variables
;List of the six numbers, not random for now
(define l (list 1 2 3 4 5))
;The numerical answer for the equations to calculate it
(define answerNumber 20)
;Define the possible equation list
(define answerEquations (list))
(define signList (list "+" "-" "*" "/" ))





     ;Initial method for beginning the search
(define(findAnswers originalList oAnswer )
  
  ;Outer for loop iterating through each number in list
  (for([currentNumber originalList])
    
    ;Inner for loop applying each sign to the equation
    (for ([sign signList])
      
      ;Define the current equation
      (define currentEq (createEquation oAnswer sign currentNumber));

      ;Calculate the current Equation
      (define currentAnswer (eval (read (open-input-string currentEq)) ns))
      
      ;Display the calculation
      (display (string-append (~v currentEq) " = "(~v currentAnswer) "\n") )
      
      ;Evaluate if answer is equal to the answer number
      (if ( = currentAnswer answerNumber)
          (display (string-append  " success" "\n" )) (printf (string-append " failure" "\n" ))) ;TODO return)
      ;Evaluate if the answer is a negative number or a fraction
      ;(if ((<= answer 0) or ((modulo answer 2) not 0) )
      ;     (display "answer is uneven, return") (display"continue calculations"));TODO return
     ; )
      ;Evaulate whether the list is empy and if so call the same function recursively
      ;TODO loop function
      )
  )
)

     ;Method for calculating the current equation
(define (createEquation oAnswer sign currentNumber)
  (string-append "( " sign " " (~v oAnswer)" " (~v currentNumber) " )")
)

;Call the main search method
( findAnswers l 20 )


