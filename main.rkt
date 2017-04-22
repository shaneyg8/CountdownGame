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
    ;(printf "~a\t -> ~a~N" token stack) ; Uncomment to see workings, not recommended for long lists.
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

;This line creates all permutations and it removes the duplicates 
(define perms (remove-duplicates (permutations flatten)))

;This function adds the two 1s to the front of the list and the -1 to the end of the list 
(define (to-rpn l)
 (append (list 1 1) l (list -1)))

(map to-rpn perms)

;Apply function to every element of the list to get valid RPN
s= stack to see how many on it
e= list
(define (valid-rpn? e (s 0)) ;default value is 0
  (if (null? e)
      (if (= s 1) #t #f)
      (if (= (car e) 1)
         (valid-rpn? (cdr e) (+ s 1))
      (if (< s 2)
          #f
          (#t))))) ;true ot false

;Calculate RPN