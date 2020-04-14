; Load previous prime work
(load "1.22.scm")

; Redefine find-divisor
(define (find-divisor n test-divisor)
  (define (next current-divisor)
    (if (= current-divisor 2)
      3
      (+ current-divisor 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

; Not sure why I have to redefine this
(define (smallest-divisor n)
  (find-divisor n 2))

; (timed-prime-test 1000000007)    .03
; (timed-prime-test 1000000007)    .03
; (timed-prime-test 1000000021)    .03
; (timed-prime-test 10000000019)   .08
; (timed-prime-test 10000000033)   .08
; (timed-prime-test 10000000061)   .08
; (timed-prime-test 100000000003)  .24
; (timed-prime-test 100000000019)  .24
; (timed-prime-test 100000000057)  .24
; (timed-prime-test 1000000000039) .74
; (timed-prime-test 1000000000061) .74
; (timed-prime-test 1000000000063) .74
;
; I get about a 30% speedup. My best guess is that testing divisibility by even
; numbers is faster than testing divisibility by odd numbers. We're cutting the
; easiest half of the numbers, so don't get the full speedup. I'd guess there's
; already some bit shift operations speeding up the evens.
