;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Did you mean recursion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW19 -- Did you mean: recursion?/More recursion functions/Using what we know, write recursion functios for factorial using every third integer and sum of numbers p to q
; 2015-10-22

;fiction is the factorial function, except that it only multiplies every third integer, including n as one of them
(define fiction
  (lambda (n)
    (cond
      ((<= n 1) 1)
      (else (* n (fiction (- n 3))))))) ;subtracting 3 from n to multiply by every third integer



(fiction 0) ;1
(fiction 1) ;1
(fiction 2) ;2
(fiction 3) ;3
(fiction 4) ;4
(fiction 5) ; 10
(fiction 6) ; 18
(fiction 7) ; 28
(fiction 8) ; 80


;sumPtoQ gives the sum of all numbers between p and q inclusively
(define sumPtoQ
  (lambda (p q)
    (cond
     ((= p q) p) ;checks if p and q matches, then outputs 1 and ends the recursive function
     ((> p q) (sumPtoQ q p)) ;reverses p and q as inputs if p is greater than q
     (else (+ p (sumPtoQ (+ p 1) q))))));adds one to p,
;then moves it into another instance of sumPtoQ while also carrying q


(sumPtoQ 0 0) ;0
(sumPtoQ 0 3) ;6
(sumPtoQ 2 3) ;5
(sumPtoQ 3 3) ;3
(sumPtoQ 3 0) ;6
(sumPtoQ 3 2) ;5