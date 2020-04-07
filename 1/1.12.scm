; Zero-based indices
(define (pascal row col)
  (cond ((or (< row 0) (< col 0) (> col row)) #f)
        ((or (= row col) (= 0 col)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

