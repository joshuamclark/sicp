; Use the book procedures except:
; - Use the good-enough? and sqrt procedures from Exercise 1.7
; - Replace the improve procedure

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))
