;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Towers of Hanoi Solver|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW30 --- Towers of Hanoi Solver/Use the new primitives to make a tower of hanoi solver/With
;new primitives, the powers of recursion/iteration, and what we went over in class, write a function that outputs all steps
;to solve the tower of hanoi with any given amount of rings and different names of towers
; 2015-11-10


;show move takes a source and a destination and outputs in the format
;Move a disc from <source> to <dest> and then moves to a new line
(define showMove (lambda (source dest)
        (begin
          (display "Move a disc from ")
          (display source)
          (display " ")
          (display "to ")
          (display dest )
          (newline))))

(showMove 'X 'Y);Move a disc from X to Y
(showMove 'Joe 'Bill);Move a disc from Joe to Bill

;Takes in the number of rings, the name of the source tower, the destiation
;tower, and the temperory storage tower
(define hanoi
  (lambda (n s d t)
    (cond
      ((<= n 0) "you cant have less than one tower");the error message
      ((= n 1) (showMove s d));only one move involved in this
      ((= n 2) (begin (showMove s t) (showMove s d) (showMove t d)));the base case
      (else (begin (hanoi (- n 1) s t d);recurse to hanoi with one less ring with the destination and storage swiched
                   (showMove s d);prints the stadard source to destination from the classwork in between the above and below line
                   (hanoi (- n 1) t d s))))));recurse to hanoi with one less ring so that the source and temp storage are switched

(hanoi 0 "a" "b" "c");print the error
(hanoi 1 'A 'B 'C)
;Move a disc from A to B
(hanoi 2 'A 'B 'C)
;Move a disc from A to C
;Move a disc from A to B
;Move a disc from C to B
(hanoi 2 'Empire 'State 'Building)
;Move a disc from Empire to Building
;Move a disc from Empire to State
;Move a disc from Building to State
(hanoi 3 "a" "b" "c")
(hanoi 4 "atole" "beach" "crispy fries")
      