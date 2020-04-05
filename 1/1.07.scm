; For very small numbers, e.g. when the sqrt is smaller than 0.001, the
; tolerance in good-enough? will be larger than the sqrt, which will prevent
; iteration to an accurate approximation.
;
; For very large numbers, we will be unable to perform the square procedure in
; good-enough? due to limited precision. You can't square INT_MAX.
;
; Alternate implementation:

(define (good-enough? old-guess guess)
  (if
    ; Maybe it's possible for a sqrt to be so small that limited precision
    ; causes it to be evaluated as zero. Treat zero as a good enough guess to
    ; avoid division by zero.
    (= 0 guess)
    #t

    ; Otherwise, accept a guess once the difference between successive guesses
    ; is small relative to the guesses.
    (< (/ (abs (- guess old-guess))
	  guess)
       0.001)))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
    guess
    (sqrt-iter guess (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 2.0 x))

; For small numbers, the algorithm could still be limited by floating point
; precision, but it's a clear improvement. For large numbers, we don't need to
; square our guess, so intermediate values can't get too big.
