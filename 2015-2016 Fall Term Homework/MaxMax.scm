;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MaxMax) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW17 -- MaxMax/Finding the maximum of a set of numbers/make your code modular to make this task easier
;2015-10-20

;MAX2 returns the greater number, and if their equal, just the first number
(define MAX2
  (lambda (a b)
    (cond
      ((> a b) a)
      ((< a b) b)
      (else a))))
(MAX2 0 0) ; 0
(MAX2 3 2) ; 3
(MAX2 4 5) ; 5

;MAX3 uses max2 to find the greatest of a and b, then finds the greatest between that and c
(define MAX3
  (lambda (a b c)
    (MAX2 (MAX2 a b) c)))
(MAX3 1 1 1) ; 1
(MAX3 3 2 1) ; 3
(MAX3 4 6 5) ; 6
(MAX3 7 8 9) ; 9

;MAX4 uses max3 to find the greatest out of a,b, and c, then uses max2 to find the greatest
;between that and d
(define MAX4
  (lambda (a b c d)
    (MAX2 (MAX3 a b c) d)))
(MAX4 1 2 3 4) ;4
(MAX4 5 6 -1 4) ;6
(MAX4 10 5 2 3) ;10

;MAX5 uses max4 to find the greatest of a,b,c, and d, then uses max2 to return the greater
;between the result of the max4 and e
(define MAX5
  (lambda (a b c d e)
    (MAX2 (MAX4 a b c d) e)))
(MAX5 1 2 3 4 5);5
(MAX5 10 2 4 6 8);10
(MAX5 12 51 38 13 17);51
(MAX5 10 29 56 47 56);56