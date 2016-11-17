;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname NowBetter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd 7
; HW 15 -- NowBetter/Cond function/ Improving the previous day's gradeConv function using cond
; 2015-10-16


;gradeConv is a function that takes a percentage and converts it into a letter grade
(define gradeConv 
  (lambda (g)
    (cond ;The first cond is for checking for a valid percentage
      ((and (>= g 0) (<= g 100)) (cond ;the second cond is for matching a number to its letter grade. Numbers such as 89.5 are treated as if they were rounded down 
                                   ((>= g 90) "A")
                                   ((>= g 80) "B")   
                                   ((>= g 70) "C")
                                   ((>= g 65) "D")
                                   (else "F")
                                    ) ;end of the second cond
                                 )
      (else "Error:Grade must be 0-100 inclusive") ;the error message
                                 ) ;end of the first cond
      )
    )
  

(gradeConv 50) ;expected value F
(gradeConv 65) ;expected value D
(gradeConv 80) ;expected value B
(gradeConv 100) ;expected value A
(gradeConv 5) ;expected value F
(gradeConv -5) ;expected value error, grade must be between or equal to 0 and 100
(gradeConv 9001) ;expected value error, grade must be between or equal to 0 and 100
(gradeConv 72) ;expected value C
(gradeConv 89.5) ;expected value B
(gradeConv 0) ;expected value F
(gradeConv 91) ;expected value A