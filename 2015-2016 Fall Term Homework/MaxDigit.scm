;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname MaxDigit) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Jonathan Quang
; IntroCS1 pd7
; HW26 -- MaxDigit/More Iteration/Using all you have learned before to find the maximum digit
; 2015-11-04



;maxDigHelper is a function that accepts an input of the current highest digit and the number being worked off of
;and eventually returns the smallest number
(define maxDigHelper
  (lambda (currentMaxDigit number)
    (cond
      ((> (remainder number 10) currentMaxDigit) (maxDigHelper (remainder number 10) (quotient number 10)))
      ;the above line checks if the ones digit of the number is greater than the current max digit, and changes it if it is
      ((= 0 (quotient number 10)) currentMaxDigit)
      ;the above line checks if there are any digits left in the number, and if there isn't, output the current max digit
      (else (maxDigHelper currentMaxDigit (quotient number 10))))))
      ;the above line calls upon another iteration with the same max digit and the number with the ones digit removed

;maxDigit is a wrapper function that accepts one input, and with the maxDigHelper function
;outputs the highest digit
(define maxDigit
  (lambda (n)
    (maxDigHelper 0 n))) ;the currentMaxDigit should be 0 because that is the lower possible digit

(maxDigit 1);1
(maxDigit 13);3
(maxDigit 758);8
(maxDigit 10476);7
(maxDigit 5601238991597613);9