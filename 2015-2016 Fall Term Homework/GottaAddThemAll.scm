;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname GottaAddThemAll) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW20 -- Gotta add them all/More Recursive functions/Get more practice with recursive functions with harder problems
; 2015-10-23  


;I prefer sumPtoQ2 because it accounts for p being greater than q
;without calling upon the max primitive computation and elegantly switches
;p and q if p is greater.

;sumPtoQ2 is more robust because it accounts for p being greater than q
;just by switching the two inputs

;sumOdd differs from pervious recursive procedures because it skips over 
;integers and has to account for the last integer not being part of the set
;of integers you need

;numDigits returns the number of digits in the number given, assumes it is positive
(define numDigits 
  (lambda (n)
    (cond
      ((< n 10) 1) ;ends recursion when there is one digit left and adds one to account for the loop ending
      (else ( + 1 (numDigits (/ n 10)))))));adds 1 if there are at least 2 digits left,
;then calls upon itself again, with the number divided by 10 to move one digit to the decimal place

(numDigits 4);1
(numDigits 168);3
(numDigits 2341235087);10

;sumOdd returns the sum of odd integers up to n, assuming n is a positive integer
(define sumOdd
  (lambda (n)
    (cond
      ((< n 1) 0);if n is less than 1, end the loop by returning 0 since there are no more odd numbers
      ((= (remainder n 2) 0) (+ 0 (sumOdd (- n 1))));if n is even, add 0 b/c that number is even, then call upon the function with a number
      ;one less
      (else (+ n (sumOdd (- n 1)))))));when n is odd, add n to the function called again to one less n.

(sumOdd 0);0
(sumOdd 1);1
(sumOdd 2);1
(sumOdd 3);4
(sumOdd 9);25
(sumOdd 10);25

;removeRightDigit is a helper function for sumOddDigits that removes the ones place
(define removeRightDigit
  (lambda (n)
    (- (/ n 10) (/ (remainder n 10) 10))))

(removeRightDigit 15);1
(removeRightDigit 21);2
(removeRightDigit 64136);6413

;sumOddDigits returns the sum of all odd digits in a number
(define sumOddDigits
  (lambda (n)
    (cond
      ((< n 1) 0);if n is less than one, end the loop and return 0
      ((= (remainder n 2) 1) (+ (remainder n 10) (sumOddDigits (removeRightDigit n))));if the number is odd, add the ones place,
      ;to the result of sumOddDigits of the number with the ones place removed
      (else (sumOddDigits (removeRightDigit n))))));when n is even, the right digit will be removed and the function will be called again

(sumOddDigits 0) ; 0
(sumOddDigits 4) ; 0
(sumOddDigits 3) ; 3
(sumOddDigits 1984) ; 10
(sumOddDigits 492067) ; 16
