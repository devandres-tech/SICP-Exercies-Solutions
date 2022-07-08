(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
	(sqrt-iter 1.0 x))

;; 1.6: Alyssa P. Hacker doesn't see why "if" needs to be provided
;;  as a special form. "Why can't I just define it as an ordinary"
;;  procedure in terms of 'cond'? she asks. Alyssa's friend Eva Lu
;;  Ator claims this can indeed be done, and she defines a new version
;;  of "if": 

(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
		(else else-clause)))

;; Eva demostrate the program for Alyssa:
(new-if (= 2 3) 0 5)
5
(new-if (= 1 1) 0 5)
0

;; Delighted, Alyssa uses "new-if" to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x) ;; (< (abs (- 4 1)) 0.001))
          guess 			     ;; 2
          (sqrt-iter (improve guess x) ;; problem here, keeps calling itself
                     x))) 
;; What happens when Alyssa attempts to use this to compute square roots? Explain.

;; ans: Alyssa will run into an infinite procedure call because it will try to evalute the else-clause
;;   in the 'new-if' procedure with the same arguments over and over again. For the 'new-if' 
;;   procedure to be executed all arguments must be evaluted in primitive form, so, that
;;   never happens because the else-clause keeps calling 'sqrt-iter' procedure with 
;; 	 the same arguments. In otherwords, special form 'if' follows normal-order evaluation (one condition
;;   is evaluated, not both) and the 'new-if' procedure follows applicative-order evaluation. 


;; 1.7 The good-enough? test used in computing square roots will not be very effective for finding the 
;;  square roots of very small numbers. Also, in real computers, arithmetic operations are almost always 
;;  performed with limited precision. This makes our test inadequate for very large numbers. Explain these 
;;  statements, with examples showing how the test fails for small and large numbers. An alternative 
;;  strategy for implementing good-enough? is to watch how guess changes from one iteration to the 
;;  next and to stop when the change is a very small fraction of the guess. Design a square-root 
;;  procedure that uses this kind of end test. Does this work better for small and large numbers?

;; ans: with large numbers (after 14 digits) the computation does not finish, it gets stuck 
(sqrt 100000000000000)

;; with small numbers the results are prodigiously inaccurate
(sqrt 0.0000000000123) 
;; result: 0.03125000013107187
;; expected value: 0.0000035071355833500366


;; 1.8 Newton's method for cube roots is based on the fact that if y is an approximation to the 
;;  cube root of x, then a better approximation is given by the value

;;  x/y^2 + 2y 
;; ------------
;;      3

;; Use this formula to implement a cube-root procedure analogous to the square-root procedure. 
;; (In section 1.3.4 we will see how to implement Newton's method in general as an abstraction 
;; of these square-root and cube-root procedures.)

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
    3))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iterm (improve guess x)
                 x)))

;; changed 1.0 to 1.1 to prevent -2 error
(define (cube-rt x)
	(cube-iter 1.1 x))
