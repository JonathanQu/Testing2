; Jonathan Quang
; IntroCS1 pd7
; HW32 -- Basic List work.../Lists/Using recursiong and basic knowledge of lists to make basic functions
; 2015-11-13


;myLength is a fuction that returns the length of a list
(define myLength
  (lambda (L)
    (if (null? L)
        0;if there are no elements left in the list, output 0
        (+ 1 (myLength (cdr L))))));if there are elements, add 1, then recurse with the first element removed

(myLength '()) ; 0
(myLength '(3)) ; 1
(myLength '(2 3)) ; 2
(myLength '(1 7 7 6)) ; 4

;nth-h is a helper function that returns the element belonging to a place on the list
(define nth-h
  (lambda (PlaceInList List Value)
    (if (= PlaceInList Value)
        (car List);if the PlaceInList=Value, output the first element in the list
        (nth-h PlaceInList (cdr List) (+ 1 Value)))))
        ;otherwise, call upon itself, transferring PlaceInList, the rest of the list without the first element,
        ;and one added to the Value counter
;nth is a wrapper function for nth-h
(define nth
  (lambda (n L)
    (if (< n (myLength L));this checks for the error case. This is put here because the 
        (nth-h n L 0);error case shouldn't be checked more than once
        "error")))

(nth 0 '(9 8 7)) ;9
(nth 1 '(9 8 7)) ;8
(nth 2 '(9 8 7)) ;7
(nth 3 '(9 8 7)) ;error