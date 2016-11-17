; Jonathan Quang
; IntroCS1 pd7
; HW38 -- Create functions that convert integers to list and vice versa, and applying those functions to others
; 2015-11-23

;expand takes a number and outputs each digit as an element of a list
(define expand
  (lambda (n)
    (cond
      ((< n 10) (list n));if the # is < 10, end loop by outputting '(n)
      (else (append (expand (quotient n 10)) (list (remainder n 10)))))))
       ;otherwise form combine the lists of the recursion with the first digit removed
       ; with '( first digit)

(expand 0) ;"...should be (0)"
(expand 3) ;"...should be (3)"
(expand 42); "...should be (4 2)"
(expand 1066) ;"...should be (1 0 6 6)"

;helper function that takes a list, the number of elements in the list
;and the starting number to work off of
(define collapseH
  (lambda (L digits num)
    (cond
      ((= digits 0) (+ num (car L)));if digits is 0, just output the number + first elem
      (else (collapseH (cdr L) ;else remove the first element of L
                       (- digits 1) ;take one away from the number of digits to go down the place value
                       (+ num (* (car L) (expt 10 digits)))))))); add num to the first elem with correct place value
(define collapse;wrapper function for collapseH
  (lambda (L)
    (collapseH L (- (length L) 1) 0)))
 
(collapse '(0)) ;"...should be 0"
(collapse '(5)) ;"...should be 5"
(collapse '(1 3 3 7)) ;"...should be 1337"
(collapse '(1 0 1)) ;"...should be 101"

(define myRevG
  (lambda (L NewL)
    (cond
      ((null? L) NewL);outputs the new list if the original list is empty
      ((list? (car L)) (cons (myRevG (car L) '());if the element is a list, call myRevG on it and add it
                             (myRevG (cdr L) NewL)));to a list contained by the application of myRevG to the rest of the function
      (else (myRevG (cdr L) (cons (car L) NewL))))));remove the first element off the list and add it to the stored list

;wrapper function for myRevG
(define myRev
  (lambda (L)
    (myRevG L '())))

(define flip;takes a number, 
  (lambda (n) 
    (collapse(myRev (expand n)))));turn digits of # to list, reverse list, turn list to #

(flip 0); "...should be 0"
(flip 7); "...should be 7"
(flip 84); "...should be 48"
(flip 1957); "...should be 7591"
(flip 2012); "...should be 2102"