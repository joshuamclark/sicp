(define (fast-* a b)
  (define (fast-*-iter sum a b)
    (define (double x)
      (+ x x))
    (define (halve x)
      (/ x 2))

    (cond ((= 0 b) sum)
          ((even? b) (fast-*-iter sum (double a) (halve b)))
          (else (fast-*-iter (+ sum a) a (- b 1)))))

  (fast-*-iter 0 a b))
