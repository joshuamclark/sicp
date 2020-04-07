(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (sum-of-squares-largest-two x y z)
  (if (> x y)
      ; x is large, so y or z?
      (if (> y z)
          (sum-of-squares x y)
          (sum-of-squares x z))
      ; y is large, so x or z?
      (if (> x z)
          (sum-of-squares y x)
          (sum-of-squares y z))))
