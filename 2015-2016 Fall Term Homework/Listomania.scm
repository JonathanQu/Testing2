;Jonathan Quang with Jonathan Wong for the first function pair programming classwork
;IntroCS1 pd7
;HW35 -- Pair Programming LISTectasy
;2015-11-19

(define allSameH ;helper function to check if a list contains only repetitions of an atom
  (lambda ( list a);input a list and an atom
    (cond
      ((null? list) #t);if list is null, output true
      ((= a (car list)) (and #t (allSameH (cdr list) a)));if the atom = the first element, add true to "and" with
      ;the function recursed with the first element removed
      (else #f))));when the atom isn't equal to the first element, output false

(define allSame?;wrapper function for allSameH
  (lambda (L)
    (allSameH L (car L))));assumes that the first element is the atom we are checking with

(allSame? '(7 7 7)); "...should be #t"

(allSame? '(7 5 7)); "...should be #f"

(define doublify;takes a list and outputs all elements doubled
  (lambda ( L )
    (cond
      ((null? L) '());if list is null, end recursion by outputting null
      ((list? (car L)) (cons (doublify (car L));if the first element is a list, use doublify within the list
                             (doublify (cdr L))));and then continue on with the rest of the higher level list
      (else (cons (* 2 (car L)) (doublify (cdr L))));when the first elem is an atom, multiply it by 2 and move on
     )
  )
)

(doublify '()) ;"...should be '()"
(doublify '(3)) ;"...should be '(6)"
(doublify '(3 4 5)); "...should be '(6 8 10)"
(doublify '(1 1 (2 2) 3)); "...should be '(2 2 (4 4) 6)"

(define filterOdd;takes a list and outputs the list without odd numbers
  (lambda (L)
    (cond
      ((null? L) '());if list is null, end recursion with null
      ((list? (car L)) (cons (filterOdd (car L));if the elem is a list, use filterOdd within the list
                             (filterOdd (cdr L))));continue on with the rest of the list
      ((even? (car L)) (cons (car L);if the elem is even, add it to the list
                             (filterOdd (cdr L))))
      (else (filterOdd (cdr L))))));when elem is odd, dont bother with it, move on

(filterOdd '()); "...should be ()"
(filterOdd '(1 3 5)); "...should be ()"
(filterOdd '(1 2 3 4)); "...should be (2 4)"
(filterOdd '(1 2 (3 4))); "...should be (2 (4))"