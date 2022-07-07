;; 1.1: Below is a sequence of expressions. What is the result printed 
;; 	by the interpreter in response to each expression? Assume that the
;; 	sequence is to be evaluated in the order in which it is presented.

10 ;; 10
(+ 5 3 4) ;; 11
(- 9 1) ;; 8
(/ 6 2) ;; 3
(+ (* 2 4) (- 4 6)) ;; 6
(define a 3) ;; a = 3
(define b (+ a 1)) ;; b = 3 + 1 = 4
(+ a b (* a b)) ;; (3 + 4 + (12)) = 19
(= a b) ;; false
(if (and (> b a) (< b (* a b)))
    b
    a) ;; (and (> 4 3) (< 4 12)) -> (and (true) (true)) -> true -> 4

(cond ((= a 4) 6) ;; false
      ((= b 4) (+ 6 7 a)) ;; true -> 6 + 7 + 3 = 16
      (else 25))

(+ 2 (if (> b a) b a)) ;; (+ 2 4) -> 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ;; (* 4 4) -> 16


;; 1.2: Translate the following expression into prefix form
;;	 5 + 4 + (2 - (3 - (6 + 4/5)))
;;	-------------------------------
;;        3(6 - 2)(2 - 7)

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
	(* 3 (- 6 2) (- 2 7)))


;; 1.3: Define a procedure that takes three nubmers as arguments and
;;	returns the sum of the squares of the two large numbers

(define (<= a b) (or (< a b) (= a b)))
(define (square-sums a b) 
	(+ (* a a) (* b b)))
(define (sum-squares-large a b c)
	(cond ((and (<= c b) (<= c a)) (square-sums a b))
	   	  ((and (<= a c) (<= a b)) (square-sums b c))
	   	  ((and (<= b c) (<= b a)) (square-sums c a))
		  (else (square-sums a b))
	 ))


;; 1.4: Observe that our model of evaluation allows for combinations
;;  whose operators are compound expressions. Use this observation to describe 
;;  the behavior of the following proceudre:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; ans: if b is greater than 0 than set the evaluation to be (a + b)
;;  	else set the evaluation to be (a - (-b)) -> (a + b)


;; 1.5 Ben Bitdiddle has invented a test to determine whether the interpreter
;;  he is faced with is using applicative-order evaluation or normal-order 
;;  evaluation. He defines the following two procedures:

(define (p) (p))
(define (test x y) 
	(if (= x 0) 0 y))

;;  then he evaluates the epxression

(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses applicative-order
;;  evaluation? What behavior will he observe with an interpreter that uses
;;  normal-order evaluation? Explain your answer. (Asume that the evaluation
;;  rule for the special form "if" is the same whether the interpreter is using
;;  normal or applicative order: The predicate expression is evaluated first, 
;;  and the result determines whether to evaluate the consequent or the
;; alternative expression.)

;; ans: for the applicative-order evalutation, the arguments (operands) of a procedure are 
;;  evaluated first and then applied to the procedure body (strict evaluation). The first argument of "test" 
;;  is "0" which is a primitive expression that evaluates to "0", the second argument "(p)" is a paramerterless 
;;  procedure that evaluates "(p)", itself. In other words, it keeps calling itself. So we never
;;  get a finite answer for the second arguement because the procedure never terminates the expression.
;;  We get into an infinite loop.
(test 0 (p))
(test 0 (p))
(test 0 (p))

;; ans: for normal-order evaluation, the arguments (operands) will not be evaluated until they are
;;  needed. In this case, "(p)" is a paramerterless procedure and is passed into the the body of 
;;  the "test" procedure. Since "0 = 0" we return "0" and never evaluate the "(p)" procedure, 
;;  because in this case we never need to evaluate it. Only if the "if" statement is false,
;;  then we would need to evalute "(p)". This is known as "Lazy evaluation"
(test 0 (p))
(if (= 0 0) 0 (p))
(if true 0 (p))
0
