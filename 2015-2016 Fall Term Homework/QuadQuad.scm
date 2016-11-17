;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname QuadQuad) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang, Edward Huang, Jiajun Luo 
; Group name: JEJ
; IntroCS1 pd 7
; HW 13 -- QuadQuad/Quadratic Function Group Work/ Working as a group, plan and code functions needed to get the “positive” associated root with robustness
; 2015-10-9 



;Discriminant is a function that evaluates the discriminant of a quadratic equation which is (b^2)-4ac
(define Discriminant
  (lambda (a b c)
    (- (* b b) (* 4 a c))))

(Discriminant 1 8 15) ; expected value 4
(Discriminant 1 5 4) ; expected value 9
(Discriminant 1 6 9) ; expected value 0
(Discriminant 1 4 4) ; expected value 0

;below is a variable NotRealRoot with the string “no real roots” assigned
(define NotRealRoot "no real roots")
(define CantBeZero "coefficient of a can’t be zero" ) 
;if a is zero, then the equation isn’t a quadratic equation

(define quadSolve
(lambda (a b c)
	(if (= a 0)
		CantBeZero
		(if (>= (Discriminant a b c) 0) ; roots that aren’t a negative will have a discriminant >= 0
			(/ (+ (* -1 b) (sqrt (Discriminant a b c))) (* 2 a)) ;evaluates the positive quadratic root
			NotRealRoot)))) 

(quadSolve 1 1 4) ;expected output is the string “no real roots”
(quadSolve 1 4 4) ;expected output is -2
(quadSolve 1 -7 10) ;expected output is 5
(quadSolve 0 4 -4) ;expected output is "coefficient a cannot be zero"
(quadSolve 1 0 -1) ;expected output is 1
(quadSolve 1 -14 45) ;expected output is 9
