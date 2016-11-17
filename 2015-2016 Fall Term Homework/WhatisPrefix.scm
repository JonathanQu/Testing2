; Jonathan Quang
; IntroCS1 pd7
; HW7 -- What is a prefix?/Infix and Prefix/Coverting infix expressions into prefix expressions
; 2000-09-29

#lang racket

;Evaluate the first expression, which is 5+4 over 15-2
(/ (+ 5 4) (- 15 2))
;The result should be 9 over 13

;Evaluate the second expression, 7+5*(sqrt 9) over 2 squared + 12/4
(/ (+ 7 (* 5 (sqrt 9))) (+ (expt 2 2) (/ 12 4)))
;The result should be 22/7 or 3 and 1/7

;Evaluate the third expression, (4/8)+3 over (15/3)-(9/3)
(/ (+ (/ 4 8) 3) (- (/ 15 3) (/ 9 3)))
;The result should be 7/4 or 1 and 3/4

;Evaluate the complicated expression from the Do Now
;It is (9+2^(6+2))/(sqrt(121)-24+17+4^(2+1))
(/ (+ 9 (expt 2 (+ 6 2))) (+ (sqrt 121) -24 17 (expt 4 (+ 2 1))))
;The expected result is 3 and 61/68