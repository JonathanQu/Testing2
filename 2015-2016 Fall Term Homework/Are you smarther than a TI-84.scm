;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Are you smarther than a TI-84|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Jonathan Quang
;IntroCS1 pd7
; HW23 -- Are You Smarter Than a TI-84/More Recursion/ Use Recursion to get a square root to the nearest hundredth place
; 2015-10-28 

(define epsilon .00001);defines how accurate we want it

(define isGoodEnuf? (lambda (a b) ;checks if given a and b, wether the two values are close enough
   (if (< (abs (- a b)) epsilon) #t #f)))

(define betterGuess (lambda (n g) ;applies one instance of the Babolyn Square Root Estimation method
  (/ (+ g (/ n g)) 2)))

(define OldmySqrt (lambda (n g) ;given a number and a guess, outputs the guess if it is close or applies betterGuess to get a closer answer
  (if (isGoodEnuf? (* g g) n)
      g
      (OldmySqrt n (betterGuess n g)))))

(define GetDeciPart ;given a numer and a constant to start with, it checks whether a decimal is between two integers and outputs the decimal part
  (lambda (decimal constant1)
    (cond
      ((and (>= decimal constant1) (<= decimal (+ 1 constant1)))
       (if (= decimal constant1)
           decimal
           (- decimal constant1)))
      (else (GetDeciPart decimal (+ 1 constant1))))))

(GetDeciPart 15.123 0);0.123

(define IntegerRoundIt ;given a decimal and a starting constant (0), round the decimal to the nearest integer
  (lambda (decimal constant1)
    (if (< (remainder 10 (- decimal (GetDeciPart decimal 0))) constant1)
        ( - (- decimal (GetDeciPart decimal constant1) (remainder 10 (- decimal (GetDeciPart decimal constant1)))))
        (+ (- decimal (GetDeciPart decimal constant1)) (- 10 (remainder 10 (- decimal (GetDeciPart decimal constant1))))))))

(IntegerRoundIt 15.123 0);15 


(define mySqrt (lambda (n) ;takes n and rounds the result of the squareroot function to the nearest hundredth place
   (/ (IntegerRoundIt (* (OldmySqrt n (/ n 2)) 1000) 0 ) 1000)))

(mySqrt 64);8
(mySqrt 49);7
(mySqrt 15);3.872
(mySqrt 50);7.071

