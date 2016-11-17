;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname FunFunFunctions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW<9> -- <FunFunFunctions/Functions/Create Functions for Mathematical Computation and evaluating given examples>
; 2015-10-05

;Create a function foo so that the input d is outputted as d
(define foo
  (lambda (d)
    (* 1 d)))

(foo 1)
(foo 0)
(foo 10)
;expected outputs are 1, 0, 10 respectively

;Create a function areaCirc such that the input R is outputted as pi
(define areaCirc
  (lambda (R)
    (* 1 pi)))

(areaCirc 1)
(areaCirc 3)
(areaCirc 5)
;expected outputs for the above three lines are 3.14159...

;Create a function AreaCirc such that the input of Radius R gives the area if its corresponding circle using the formula radius squares * pi
(define AreaCirc
  (lambda (R)
    (* R R pi)))

(AreaCirc 1)
(AreaCirc 3)
(AreaCirc 5)
;expected outputs for the above three lines are 3.141592653589793, 28.274333882308138, and 78.53981633974483

;Create a function AreaWasher such that the input of R1 and R2 gives the area of a circle with a radius of R2 with a circle of a radius R1 cut out of it
(define AreaWasher
  (lambda (R1 R2)
    (- (AreaCirc R2) (AreaCirc R1) )))
;The AreaCirc function is used here to get the area of the two circles
 (AreaWasher 0 2)
 (AreaWasher 3 5)
 (AreaWasher 6 10)
 
 ;The expected outputs are 12.566370614359172, 50.26548245743669, and 201.06192982974676
 
 ;Create a function SumOfSquares such that the inputs a and b will result in a*a + b*b
 (define SumOfSquares
    (lambda (a b)
        (+ (* a a) (* b b))))
        
(SumOfSquares 0 0)
(SumOfSquares 1 2)
(SumOfSquares 4 5)
 ;The expected outputs are 0, 5, and 41