# CountdownGame - Theory of Algorithms 
## Racket
### Shane Gleeson - G00311793
### Lecturer - Dr Ian McgLoughlin

## 1. Introduction
For this project we are to create a game which takes the functionality of the TV Game Show Countdowns Math challenge 
where you are given 6 numbers and then are required to reach the target given. This project will list all the possibilities
of equating the numbers inputted to the target set using reverse polish notation which we learned in class. 

#### 1.1 Countdown Explination
To give a clear understanding of how the Countdown game works the following is taken from our requirments set by our lecturer below.

"In the Countdown Numbers game contestants are given six random numbers
and a target number. The target number is a randomly generated three digit
integer between 101 and 999 inclusive. The six random numbers are selected
from the following list of numbers:
[1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]
Contestants must use the four basic operations – add, subtract, multiply
and divide – with the six random numbers to calculate the target number
(if possible). They don’t have to use all six of the numbers, however each of
the six random numbers can only be used once. If the same number appears
twice in the list of six then it may be used twice."

## 2. Main Features
#### 2.1 Reverse Polish Notation
What is Reverse Polish Notation?
Reverse Polish Notation is a method for speaking to numerical conditions ie. mathematical equations. 
The notation is utilized in light of the fact that the configuration that the equation is in is 
less demanding for machines to translate instead of the notation we are utilized to, infix notation, 
where the administrator is in between the numbers. The condition can be mind boggling or basic. RPN 
doesnt require brackets as the equations are layed out in such an arrangement, to the point that it isn't 
required for machines to get it.

The order of Reverse Polish Notation should be laid out like the following:

`<FirstNumber> <SecondNumber> <Operation>`

Whereas the infix would be like this:

`<FirstNumber> <Operation> <SecondNumber> `

The function I use in the project which is taken from [https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket](https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket)

```
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
```

#### 2.2 Evaluation Tree
##### 2.2.1 Branch and Bound
In Java Uniform Cost Search (UCS) is a best-first variant that uses only the
g(n) function to compute the best path to a goal. Similarly to RPN the RPN function above computes the function to give the best path to a goal. The g(n) function being `f*(n) = g*(n) + 0`. 

#### 3. Approach
##### Idea 1
I had an idea in place from the start where I would set out a random generated function where it will compute a number for you to reach. Given the list of numbers we were given in class I wanted to include these at the top where you could view what you could use and make a 
game out of it. Beneath that that random generated function would then produce your target.

##### How I went about Idea 1
- Below sets out the heading at the top and produces the numbers that need to be used in the game
`(define start(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))`

- To produce the random number, in the game countdown they only give you a target number that is between 101 - 1000 so a random generated number needs to be between that. The expression in Racket for random is `rand`so I needed to create a function to do so which is seen below

```
(define rand (random 101 1000))
rand
```

