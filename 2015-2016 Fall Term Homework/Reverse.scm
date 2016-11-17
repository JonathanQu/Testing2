;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Reverse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd 7
; HW 15 -- Reverse!/Even more recursives with constructs/Uses the constructs in class with recursives
; 2015-10-16

;does 10^n basically
(define exponentWith10
  (lambda (n)
    (cond
      ((< n 0) 0.1)
      (else (* 10 (exponentWith10 (- n 1)))))))
;the number of digits finder from the homework
(define numDigits
  (lambda (n)
    (cond
      ((< n 10) 1)
      (else (+ 1 (numDigits (/ n 10)))))))
;reverses the digits of a number
(define reverseNum
  (lambda (n)
    (cond
    ((> 10 n ) n) ; checks if there is anymore need to reverse digits
    (else (+ (* (exponentWith10 (- (numDigits n) 1)) (remainder n 10))
             (reverseNum (quotient n 10)))))));takes the ones digit and sets its value
;to 10 to the nth digits power, then does the function over again with the ones digit removed

 (reverseNum 5);5
(reverseNum 65);56
(reverseNum 75429);92457