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
