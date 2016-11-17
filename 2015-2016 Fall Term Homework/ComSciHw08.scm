;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ComSciHw08) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW8 -- VarVar/Variables/Assiging Variables to evaluated expression
; 2015-10-1



;Evaluate the first expression, which is 5+4 over 15-2
(define FirstExpression (/ (+ 5 4) (- 15 2)))
;The result should be 9 over 13 or about 0.692308

;Evaluate the second expression, 7+5*(sqrt 9) over 2 squared + 12/4
(define SecondExpression(/ (+ 7 (* 5 (sqrt 9))) (+ (expt 2 2) (/ 12 4))))
;The result should be 22/7 or 3 and 1/7 or about 3.142857

;Evaluate the third expression, (4/8)+3 over (15/3)-(9/3)
(define ThirdExpression (/ (+ (/ 4 8) 3) (- (/ 15 3) (/ 9 3))))
;The result should be 7/4 or 1 and 3/4 or 1.75

;Evaluate the complicated expression from the Do Now
;It is (9+2^(6+2))/(sqrt(121)-24+17+4^(2+1))
(define beast(/ (+ 9 (expt 2 (+ 6 2))) (+ (sqrt 121) -24 17 (expt 4 (+ 2 1)))))
;The expected result is 3 and 61/68 or about 3.8970588

;output the variable values
FirstExpression
SecondExpression
ThirdExpression
beast

