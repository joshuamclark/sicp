(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
	 (* 2 (f-recursive (- n 2)))
	 (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (f-iter a b c n)
    (if (= 2 n)
        c
	(f-iter b
		c
		(+ c
		   (* 2 b)
		   (* 3 a))
		(- n 1))))
  ; This test is mainly for negative numbers, but also works for 0-2
  (if (< n 3)
      n
      (f-iter 0 1 2 n)))
