; Write a procedure that computes elements of
; Pascal’s triangle by means of a recursive process.
;     1 
;    1  1
;  1  2  1
; 1  3  3  1
;1  4  6  4  1

; Define function for getting a value at any row, column index
; n = row, k = column index
; f(n, k) = 1 -> k = 0, n = k  
; f(n, k) = f(n - 1, k - 1) + f(n - 1, k)
; f(4, 2) = f(3, 1) + f(3, 2) 
; f(4, 2) = f(2, 0) + f(2, 1) + f(3, 2)
; f(4, 2) = 1 + f(1, 0) + f(1, 1) + f(3, 2)
; f(4, 2) = 1 + 1 + 1 = 3 + f(3, 2)
; f(2, 1) + f(2, 2) = f(1, 0) + f(1, 1) + 1 
; 1 + 1 + 1 = 3 + 3 = 6
(define (pascal n k)
(if (or (= k 0) (= n k)) 
 1
 (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k))
))

; Define function for getting all values in a row
; if k > n, return enpty (), end of row
; else, append current element, plus next element
(define (pascal-row n)
	(define (row-helper k)
	(if (> k n)
	'() 
	(cons (pascal n k) (row-helper (+ k 1)))))
(row-helper 0))

; Define function for getting all rows 
; if row = 0, return empty list
; else, get previous triangle, append current row
(define (pascal-triangle rows)
  (if (= rows 0)
      '()  ; Base case: no rows, return an empty list
      (let ((previous-triangle (pascal-triangle (- rows 1))))  ; Recursively compute previous rows
        (append previous-triangle (list (pascal-row (- rows 1))))))) 


