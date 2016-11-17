; Jonathan Quang
; IntroCS1 pd7
; HW33 --Lists of Lists/ Dealing with Sublists/ Use what you know about lists and the list? primitive to work with sublists
; 2015-11-16   


;NumAtoms accepts a list, which firsts checks for null, which if so outputs 0
;then it checks if the first element is the list, which if true, adds numAtoms of
;the first element to numAtoms of the rest of the sublist
;the third line occurs only when the first element is an atom, in which it adds
;1 to the numAtoms of the rest of the list

(define numAtoms
  (lambda (L)
    (cond
      ((null? L) 0)
      ((list? (car L)) (+ (numAtoms (car L)) (numAtoms (cdr L))))
      (else (+ 1 (numAtoms (cdr L)))))))
      

(numAtoms '() ) ;0
(numAtoms '(()) ) ;0
(numAtoms '(1 1) ) ;2
(numAtoms '(1 (1 1) 1) );4 
(numAtoms '(1 (1 (1 1)) 1) );5

;sumElements follows the exact same logic as numAtoms, except instead of
;adding one when the first element is an atom, it adds the atom's value
(define sumElements
  (lambda (L)
    (cond
      ((null? L) 0)
      ((list? (car L)) (+ (sumElements (car L)) (sumElements (cdr L))))
      (else (+ (car L) (sumElements (cdr L)))))))

(sumElements '() ) ;0
(sumElements '(2) ) ;2
(sumElements '(1 3 5) ) ;9
(sumElements '(1 (3 4) 5) ) ;13
(sumElements '(1 (3 (9 (15 5)) 4) 5) ) ;42