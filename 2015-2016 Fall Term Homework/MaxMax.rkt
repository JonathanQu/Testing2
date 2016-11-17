;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MaxMax) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define MAX2
  (lambda (a b)
    (/ (+ a b (abs (- a b))) 2)))
(MAX2 0 0) ; 0
(MAX2 3 2) ; 3
(MAX2 4 5) ; 5

(define MAX3
  (lambda (a b c)
    (MAX2 (MAX2 a b) c)))
(MAX3 1 1 1) ; 1
(MAX3 3 2 1) ; 3
(MAX3 4 6 5) ; 6
(MAX3 7 8 9) ; 9

(define MAX4
  (lambda (a b c d)
    (MAX2 (MAX3 a b c) d)))
(MAX4 1 2 3 4) ;4
(MAX4 5 6 -1 4) ;6
(MAX4 10 5 2 3) ;10

(define MAX5
  (lambda (a b c d e)
    (MAX2 (MAX4 a b c d) e)))