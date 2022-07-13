;; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 
;; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that 
;; computes f by means of a recursive process. Write a procedure that computes f 
;; by means of an iterative process.

;; recursive
(define (fn n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (fn (- n 1)) 
					 (* 2 (fn (- n 2))) 
					 (* 3 (fn (- n 3)))) )))

;; iterative
 (define (f n) 
   (define (f-i a b c count) 
     (cond ((< n 3) n) 
           ((<= count 0) a) 
           (else (f-i (+ a (* 2 b) (* 3 c)) a b (- count 1))))) 

(f-i 2 1 0 (- n 2)))

