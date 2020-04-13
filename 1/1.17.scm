(define (fast-* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))

  (cond ((= 0 b) 0)
        ((even? b) (double (fast-* a (halve b))))
        (else (+ a (fast-* a (- b 1))))))
