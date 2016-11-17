;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ToBinOrNotToBin) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Jonathan Quang
;IntroCS1 pd7
;HW28 -- To Bin or not to Bin!/Binary Converter and Sum of Odd integers between/ Using iteration and recursion,
;make a function that converts a decimal into binary and another function that adds all the odd digits between two numbers
;2015-11-06

;the below function does the division part of the Remainder Q method of converting to binary
(define binaryDivHelper
  (lambda (num)
    (cond
      ((odd? num) (/ (- num 1) 2))
      (else (/ num 2)))))

;this is a wrapper function that accepts a number and calls upon binaryHelper while also giving the first digit
(define ToBin
  (lambda (n)
    (cond
      ((odd? n) (binaryHelper n 1 1))
      (else (binaryHelper n 1 0)))))

;binaryHelper is the iterative helper function for toBin that accepts a number, place value, and binary number
(define binaryHelper
  (lambda (number placeVal BinNum)
    (cond 
      ((= number 0) (quotient BinNum 10));ends the loop and returns the binary digit with the extra digit removed
      ((odd? number) (binaryHelper (binaryDivHelper number);if the number is odd, use the div helper function on it
                                   (+ 1 placeVal);add one to the place value for next iteration
                                   (+ BinNum (expt 10 placeVal))));add current binary number to 10^current power
      (else (binaryHelper (binaryDivHelper number);if number is even, just raise the place value and loop again
                          (+ 1 placeVal)
                          BinNum)))))

(ToBin 1) ; 1
(ToBin 2) ; 10
(ToBin 6) ; 110
(ToBin 15) ; 1111
(ToBin 1000) ; 1111101000

(define oddo
  (lambda (p q)
    (cond
      ((and (even? p) (= p q)) 0);if both p and q are equal and even, output 0
      ((= p q) p);if p and q are equal, terminate loop by outputting p
      ((even? p) (oddo (+ p 1) q));if p is even, loop with one added to p to make it odd
      ((even? q) (oddo p (- q 1)));if q is even, loop with one subtracted from q to make it odd
      (else (+ p (oddo (+ p 2) q))))));otherwise, add p to the loop with p at the next odd number

(oddo 1 1) ; 1 
(oddo 1 2) ; 1 
(oddo 1 6) ; 9 
(oddo 2 6) ; 8 
(oddo 2 2) ; 0