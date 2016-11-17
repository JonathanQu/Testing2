;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Heads vs. Tails|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Jonathan Quang
;IntroCS1 pd7
;HW27 -- Heads vs. Tails/More head and tail recursion/ practice your skills with head and tail function
;2015-11-05

;oddHelp is a function that accepts a number, the current sum of odd digits,
;and the place value of the next odd digit, then outputs a number composed of
;only odd digits
(define oddhelp
  (lambda (num oddThings whatPlace)
    (cond
      ((< num 10) (+ oddThings (* num (expt 10 whatPlace))))
      ;the above line checks if the last digit has been reached, and adds the
      ;current odd digit number to the last digit such that it is added at the front of the number
      ((odd? (remainder num 10)) (oddhelp ;calls upon itself when the ones digit of the number is odd
                                  (quotient num 10);removes ones digit
                                  (+ oddThings (* (remainder num 10)(expt 10 whatPlace)));adds the ones digit in front of the odd digits number
                                  (+ 1 whatPlace)));keeps track of the next place value
      (else (oddhelp (quotient num 10) oddThings whatPlace)))));just cut off ones digit to move to next digit

;wrapper functio for oddhelp that takes the input and subsitutes num with the given number
;and 0s for the current odd digits number and whatPlace
(define odder
  (lambda (n)
    (oddhelp n 0 0)))

(odder 0);0
(odder 7);7
(odder 125) ; 15
(odder 123456);135
(odder 302938);393

;myMultiplyA is a head recursive functio that takes x and y and returns
;their product via repeated addition
(define myMultiplyA
 (lambda (x y)
   (cond
     ((= y 0) 0) ;if y is 0, end the recursion by outputting 0
     (else (+ x (myMultiplyA x (- y 1))))))) ;repeatedly adds x until y has been depleted

(myMultiplyA 0 0) ; 0
(myMultiplyA 1 1) ; 1
(myMultiplyA 1 2) ; 2
(myMultiplyA 3 5) ; 15
(myMultiplyA 5 3) ; 15

;the below function takes three inputs, x, y, and a storage number
(define multiplyIter
  (lambda (x y storage)
    (cond
      ((= y 0) storage);if y (as a counter) is 0, then output the repeated sum
      (else (multiplyIter x (- y 1) (+ storage x))))))
       ;the above line calls upon multiplyIter again, this time transferring x, counting down y, and adding x to the current sum

;the belowfunction is a wrapper for multiplyIter
(define myMultiplyB
  (lambda (x y)
    (multiplyIter x y 0)))

(myMultiplyB 0 0) ; 0
(myMultiplyB 1 1) ; 1
(myMultiplyB 1 2) ; 2
(myMultiplyB 3 5) ; 15
(myMultiplyB 5 3) ; 15