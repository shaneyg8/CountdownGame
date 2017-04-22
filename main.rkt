#lang racket
;Taken From Class
(define start(list -1 -1 -1 -1 1 1 1 1))

;This line creates all permutations and it removes the duplicates 
(define perms (remove-duplicates (permutations start)))

;This function adds the two 1s to the front of the list and the -1 to the end of the list 
(define (to-rpn l)
 (append (list 1 1) l (list -1)))

(map to-rpn perms)

;Apply function to every element of the list to get valid RPN
;s= stack to see how many on it
;e= list
(define (valid-rpn? e (s 0)) ;default value is 0
  (if (null? e)
      (if (= s 1) #t #f)
      (if (= (car e) 1)
          (valid-rpn? (cdr e) (+ s 1))
      (if (< s 2)
          #f
          (#t))))) ;true ot false