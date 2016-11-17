; Jonathan Quang
; IntroCS1 pd7
; HW37 -- Using some of the new scheme primitives, do more complex list work
; 2015-11-20

;sumNums takes a list and returns the sum of all numbers in it
(define sumNums
  (lambda (L)
    (cond
      ((null? L) 0);once the list is null, end it
      ((list? (car L)) (+ (sumNums (car L)) (sumNums (cdr L))));if the element is a list, go into it while continuing with the rest of the list
      ((not (number? (car L))) (sumNums (cdr L)));if the elemnt is not a number, skip over it
      (else (+ (car L) (sumNums (cdr L)))))));when the element is a number, add it to the recursion of the rest of the list

(sumNums '()) ;"...should be 0"
(sumNums '(b a d)) ;"...should be 0"
(sumNums '(1 a 2)) ;"...should be 3"
(sumNums '(1 p (2 4 q))) ;"...should be 7"


;addLists takes two lists and returns the elements of the list added together
;assumes a number + no data is equivalent to a number + 0
(define addLists
  (lambda (P Q)
    (cond
      ((and (null? P) (null? Q)) '());if both p and q are null, end loop
      ((null? P)  (cons (car Q) (addLists '() (cdr Q))));if p is null, add q to the list and continue the recursion with p as null and cdrQ
      ((null? Q)  (cons (car P) (addLists (cdr P) '())));if q is null, add p to the list and contiue the recursion with cdr P and null
      (else (cons (+ (car P) (car Q)) (addLists (cdr P) (cdr Q)))))))
      ;otherwise add the sum of p and q to the rest of the list

(addLists '() '()) ;"...should be ()"
(addLists '(1 2) '(3 4)) ;"...should be (4 6)"
(addLists '(1 2 5) '(3 4)); "...should be (4 6 5)"


;takes a list and a storage for that list to output
;works off something I noticed in previous homeworks that adding the first element
;of a list to a storage list results in the list being outputted backwards.
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

(myRev '()) ;"...should be ()"
(myRev '(1 2 3)); "...should be (3 2 1)"
(myRev '(a b c)) ;"...should be (c b a)"
(myRev '(a (b c))) ;"...should be ((c b) a)"


     