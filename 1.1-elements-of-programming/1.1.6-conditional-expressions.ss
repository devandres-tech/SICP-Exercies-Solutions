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
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))