#lang racket
;Taken From Class
;(define start(list -1 -1 -1 -1 1 1 1 1))

;A static list must be created of numbers and operators
(define f null)

;list of operands
(define op (list '+ '+ '+ '+ '+ '- '- '- '- '- '- '* '* '* '* '*  '/ '/ '/ '/ '/))

;Reverse Polar Notation In Racket : https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
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


;Removing errors to work on what we were given in class
;This line creates all permutations and it removes the duplicates 
;(define perms (remove-duplicates (permutations flatten)))

