; T_{pq}
; - a': bq + aq + ap
; - b': bp + aq
;
; T_{p'q'}
; - a'': (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;        = bpq + aqq + bqq + aqq + apq + bpq + apq + app
;        = 2bpq + 2aqq + bqq + 2apq + app
;        = b(2pq + qq) + 2aqq + 2apq + app
;        = b(2pq + qq) + a(2pq + qq) + a(pp + qq)
; - b'': (bp + aq)p + (bq + aq + ap)q
;        = bpp + apq + bqq + aqq + apq
;        = bpp + 2apq + bqq + aqq
;        = b(pp + qq) + a(2pq + qq)
;
; So:
; - p' = pp + qq
; - q' = 2pq + qq

(define (fib n)
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (square p) (square q))
                     (+ (* 2 p q) (square q))
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))

  (fib-iter 1 0 0 1 n))
