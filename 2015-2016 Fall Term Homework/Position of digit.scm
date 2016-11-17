;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Position of digit|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW22 -- Position Of Digit /More recursion/Find where a digit occurs along a number
; 2015-10-27   

(define CheckIfPresent ;checks if a digit is present among numbers
  (lambda (num digit)
    (if (not (= num 0));if the number isn't 0
    (or (= digit (remainder num 10)) (CheckIfPresent (quotient num 10) digit))
    ;evaluate whether the ones digit matches the given digit, then calls upon the function again with the oens digit removed
    ;else it returns false
    false)))
(CheckIfPresent 123 4);false
(CheckIfPresent 123 3);true

;returns position of a digit with 0 being the rightermost digit and increasing by one as you go left
(define posOfDigit
  (lambda (num digit)
    (cond
      ((not (CheckIfPresent num digit)) "not available");if the digit isn't present, say it isnt
      ((= digit (remainder num 10)) 0) ;ends loop if the digit has been found
      (else (+ 1 (posOfDigit (quotient num 10) digit))))))
       ;the above lines adds 1 if the digit has not yet been reached, then removes the ones place

(posOfDigit 4 4);0
(posOfDigit 123 2);1
(posOfDigit 75429 5);3
(posOfDigit 666 6);0
(posOfDigit 123 4);"not available"