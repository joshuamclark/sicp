; Normal-order evaluation: 18 remainder operations performed
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

    ; Remainder 1: 6
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

    ; Remainders 2-3: 4
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

    ; Remainders 4-7: 2
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))

    ; Remainders 8-14: 0
(if (= (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
       0)

    ; Remainders 15-18: 2
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    ; I'm not going to type up the alternate.
    )

; Applicative-order evaluation: 4 remainder operations
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40))) ; Remainder 1: 6
(if (= 6 0)
    40
    (gcd 6 (remainder 40 6))) ; Remainder 2: 4
(if (= 4 0)
    6
    (gcd 4 (remainder 6 4))) ; Remainder 3: 2
(if (= 2 0)
    4
    (gcd 2 (remainder 4 2))) ; Remainder 4: 0
(if (= 0 0)
    2
    (gcd 0 (remainder 2 0))) ; Not evaluated

