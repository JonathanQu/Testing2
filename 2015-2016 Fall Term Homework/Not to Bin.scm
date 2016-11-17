;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Not to Bin|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW29 -- Not to Bin!/More iteration/Convert binary numbers to base 10
; 2015-09-15


;NotToBin-h is an iterative function that accepts the binary number, a decimal,
;and a power the keeps track of the place value of the binary number
(define NotToBin-h
    (lambda (num deci power)
      (cond
        ((= num 0) deci);outputs the decimal once the number is 0
        (else (NotToBin-h (quotient num 10);remove the ones digit of the binary num
                          (+ (* (remainder num 10) (expt 2 power)) deci)
 ;the above line coverts the last digit of the bin num into its deci equivalent and adds it to the current deci
                          (+ power 1)))))) ;adds 1 for the next bin um place value calculation

;NotToBin is a wrapper function for NotToBin-h
(define NotToBin
  (lambda (n)
    (NotToBin-h n 0 0)))

(NotToBin 0);0
(NotToBin 1);1
(NotToBin 10);2
(NotToBin 110);6
(NotToBin 1111);15
(NotToBin 1111101000);1000