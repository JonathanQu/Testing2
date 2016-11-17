; Jonathan Quang
; IntroCS1 pd7
; HW34 -- Juggling Lists/More basic list work/armed with the new length primitive, tackle new problems
; 2015-11-17  


;numTlas accepts a list. If the list is null output 0. If the the first element is a list,
;then recurse with the first element removed. If none of the previous two are true, then the
;first element is an atom, so do 1 + numTlas with the first element removed to continue down the list
(define numTlas
  (lambda (Q)
    (cond
      ((null? Q) 0)
      ((list? (car Q)) (numTlas (cdr Q)))
      (else (+ 1 (numTlas (cdr Q)))))))


(numTlas '() );0
(numTlas '(1 (2 3) 4));2

;listsEqual checks if two lists have exactly the same atoms in the same order
;First, it checks if the two functions have equal length. If that is false, output false
;since if they do not have equal length, they cannot have the same atoms. If that is true,
;the function moves toward the cond. The cond checks if at least one of the lists are null,
;which outputs true if one is just to end the function. The second part of the cond is
;checking if both the first elements in the lists are equal. If that is true, do the
;logic function and with true and recursion of the function with the two lists having
;their first atoms stripped. The else part of the cond only occurs when the atoms are
;unequal, which means false should be outputted and the recursion should end
(define listsEqual? 
  (lambda (L M)
    (if (= (length L) (length M))
        (cond
          ((or (null? L) (null? M)) true)
          ((= (car L) (car M)) (and true (listsEqual? (cdr L) (cdr M))))
          (else false))
        false)))

(listsEqual? '(9) '(9)) ;true
(listsEqual? '(1 2 3) '(1 2 3)) ;true
(listsEqual? '(1 3 2) '(1 2 3)) ;false
(listsEqual? '(1 3) '(1 2 3)) ;false
(listsEqual? '(1 2) '(1 2 3)) ;false
