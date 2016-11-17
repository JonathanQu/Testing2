;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Translate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jiajun Luo, Edward Huang, Jonathan Quang
; IntroCS1 pd 7
; HW 14 -- Translate, convert grade into its letter grade equivalent
; 2015-10-15

;gradeConv is a function that determines letter grade based on numerical grade
(define gradeConv 
  (lambda (g)
    (if (and (<= g 100) (>= g 0)) ;this returns true if g is less than or equal to 100 or greater than or equal to zero, negating negative values and values above 100, it returns error if the value is greater than 100 or negative
        (if (>=  g 90) ;if a is greater than or equal to 90, it will return A
        "A"
            (if (>=  g 80) ;if a is greater than or equal to 80, it will return B
            "B"
            (if (>=  g 70) ;if a is greater than or equal to 70, it will return C
            "C"
            (if (>=  g 65) ;if a is greater than or equal to 65, it will return D, if not it will return F
            "D"
            "F"))))
            "error, grade must be between or equal to 0 and 100" ;this returns error if g is greater than 100 or if it is negative
        
        )))

(gradeConv 50) ;expected value F
(gradeConv 65) ;expected value D
(gradeConv 80) ;expected value B
(gradeConv 100) ;expected value A
(gradeConv 5) ;expected value F
(gradeConv -5) ;expected value error, grade must be between or equal to 0 and 100
(gradeConv 9001) ;expected value error, grade must be between or equal to 0 and 100
(gradeConv 72) ;expected value C


