;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Triples!) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW12 -- Triples!/If statements and boolean functions/Use if statements and boolean functions to determing if three numbers form a pythaogrean triple
; 2015-10-08   

;define a function SumSquaresCheck that takes three inputs and checks if
;the sum of squares of the first two inputs is equivalent to the square of the third output
(define SumSquaresCheck
  (lambda (a b c)
    (= (+ (* a a) (* b b)) (* c c))))

;define isPythTriple as a function that takes three inputs and checks if they form a pythagorean
;triple
(define isPythTriple?
  (lambda (S1 S2 S3)
    (if (and (> S1 0) (> S2 0) (> S3 0)) ;filter out results that arent greater than 0 since the numbers must be positive
        (if (or (SumSquaresCheck S1 S2 S3)
                (SumSquaresCheck S1 S3 S2)
                (SumSquaresCheck S2 S3 S1)
            )
            ;the above if statment test all combinations of the three inputs and checks if any return true
            true
            false
        )
        false
     )))

(isPythTriple? 3 4 5) ;should be true
(isPythTriple? 3 4 6) ;should be false
(isPythTriple? 65 72 97) ;should be true

;More test cases that are not required by the homework directions
(isPythTriple? 0 0 0) ;should be false
(isPythTriple? -1 -2 -3) ;should be false
