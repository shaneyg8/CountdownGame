#lang racket
;A static list for numbers and operators

(define start(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
;list of operands
(define op (list '+ '+ '+ '+ '+ '- '- '- '- '- '- '* '* '* '* '*  '/ '/ '/ '/ '/))
start

;Generating the random number
(define rand (random 101 1000))
rand

;6 random numbers to be placed in an empty list
(define nums(list))


;Reverse Polish Notation In Racket : https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
;This function is taken from the link above
(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    (printf "~a\t -> ~a~N" token stack) 
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (if (= y 0)
                                (cons 0 s)
                                (if (= x 0)
                                    (cons 0 s)
                                    (cons (/ x y) s)))]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))



;Validation taken from class
;Function to check if a valid rpn
(define (valid-rpn? e[s 0])
  (if(null? e)
     (if (= s 1) #t #f)
     (if(number? (car e) )
        (valid-rpn? (cdr e) (+ s 1))
        (if(> s 1)
           (valid-rpn? (cdr e) (- s 1))
           #f))))

;Function to make a perm into a rpn expression and calculates the expression if valid rpn
(define (rpn-selected-numbers) list)
(define (rpn-selected-operators) list)

(define (make-rpn l)
  (if(valid-rpn? (append (list 1 1) l (list '*)))
     (calculate-RPN(append (list 1 1) l (list '*)))
     #f)
  )



