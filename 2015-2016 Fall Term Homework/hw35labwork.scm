;Jonathan Quang
; IntroCS1 pd7
; HW35 -- hw35 labwork/More list work/ Use the power of the equals?  and cons primitive for more list work
; 2015-11-18

(cons 1 2)  ; not really a list
(cons 1 '(2)) ;(1 2)
(cons 1 '(2 3)) ; (1 2 3)
(cons '(1) '(2 3)) ; ((1) 2 3)

(define buildListHelp ;function is the iterative helper that 
  (lambda (n c list);takes three inputs, a number, an element, and a list
    (cond
      ((= n 0) list);end the iteration when n=0 by outputting the list
      (else (buildListHelp (- n 1) c (cons c list))))));recurse with one subtracted
;from the number (which is used as a counter), transfer c, and add c to the
;front of the storage list.

(define  buildList;this is the wrapper function for buildListHelp
  (lambda (n c);take a number and an element
    (buildListHelp n c '())));call upon the helper function with n, c, and an empty list


(buildList 0 'a);()
(buildList 1 'a);(a)
(buildList 10 'a);(a a a a a a a a a a)

;this function is the iterative helper that removes all occurances of
(define removeAllhelp ;an element in a list and outputs a new list without it
  (lambda (atom List NewList);take in the atom to remove, the list, and the new constructed list
    (cond
      ((null? List) NewList);if there are no more elements in the list, output the new list
      ((= atom (car List)) (removeAllhelp atom ;if the atom is present in the first element of the list
                                          (cdr List);recurse with the atom transfered, the first element removed
                                          NewList));and the new list transfered
      (else (removeAllhelp atom ;if the atom isn't in the list, transfer the atom
                           (cdr List);remove the first item from the list
                           (cons (car List) NewList))))));add that first item to the new list

(define reverseList;this function reverses the order of a list
  (lambda (List ReversedList);takes in the input of a list and the stored reversed list
    (cond
      ((null? List) ReversedList);if the list is empty, output the reversed list
      (else (reverseList (cdr List) (cons (car List) ReversedList))))))
;if the list isnt empty, recurse with the the first element of the list removed,
;and add the first element of that list to the reversed list storage variable     

(define removeAll;wrapper function for removeallhelp
  (lambda (a L) ;input an atom and a list
    (reverseList ;take the reversed order of the helper function
    (removeAllhelp a L '() )
    '())))

(removeAll 3 '() ) ;"...should be ()"
(removeAll 1 '(1 2 3) ); "...should be (2 3)"
(removeAll 4 '(1 2 3) ); "...should be (1 2 3)"
(removeAll 4 '(1 4 2 4 3 4) ); "...should be (1 2 3)"

(define removenth-H ;this is the iterative helper function that removes the nth element of a list
  (lambda (a L NewL);input where in the list, the list, and the new storage list
    (cond
      ((null? L) NewL) ;if the list is empty, output the storage list
      ((= a 0) (removenth-H (- a 1) (cdr L) NewL));if the number in the list has been reached
      ;then recurse with a subtracted by 1, the first element removed from the list, and
      ;continue the new list
      (else (removenth-H (- a 1) (cdr L) (cons (car L) NewL))))));if the number in the
;list has not been reached, subtract one from it, remove the first element of the list, and
;add the first element of the list to the NewL
      
(define removenth;wrapper function for removenth-H
  (lambda (a L);input where in the list and what list
        (reverseList;reverse the list since it is out of order
         (removenth-H a L '());pass where in the list, the list, and an empty list to the helper
         '())
        ))
      
(removenth 0 '(a b c) ); "...should be (b c)"
(removenth 1 '(a b c) ); "...should be (a c)"
(removenth 2 '(a b c) ); "...should be (a b)"

