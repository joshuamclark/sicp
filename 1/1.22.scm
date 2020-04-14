; Load primality test procedures
(load "1.21.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

; Different from book: returns false for non-primes
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))
    #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start count)
  (define (search-for-primes-iter candidate count)
    (if (> count 0)
      (search-for-primes-iter
        (+ 2 candidate)
        (if (timed-prime-test candidate)
          (- count 1)
          count))))
  (search-for-primes-iter
    (if (even? start)
      (+ 1 start)
      start)
    count))

; (search-for-primes 1000 3)
; 1009, 1013, 1019, timing 0.

; (search-for-primes 10000 3)
; 10007, 10009, 10037, timing 0.

; (search-for-primes 100000 3)
; 100003, 100019, 100043, timing 0.

; (search-for-primes 1000000 3)
; 1000003, 1000033, 1000037, timing 0.

; ok, clearly CPUs are faster now

; (search-for-primes 1000000000 3)
; 1000000007, 1000000009, 1000000021, timing .03

; (search-for-primes 10000000000 3)
; 10000000019, 10000000033, 10000000061, timing .11

; (search-for-primes 100000000000 3)
; 100000000003, 100000000019, 100000000057, timing .34

; (search-for-primes 1000000000000 3)
; 1000000000039, 1000000000061, 1000000000063, timing 1.04

; The times are roughly factors of sqrt(10)=3.16 apart.
; Seems like step growth is proportional to elapsed time.
