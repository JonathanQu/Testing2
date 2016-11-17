;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Make a Fibonacci friend|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Jonathan Quang
; IntroCS1 pd7
; HW24 -- Make a Fibonacci Friend!/Iterative Functions/Use Recursion and Iteration to match a numebr to its fibonacci number
; 2015-31-14 


;recursively matches a number to its term in the Fibonacci sequence
(define fibNaive
  (lambda (n)
    (if (< n 2)
        n;returns n if the term number is less than 2, which means this would only ever output 0 and 1
        (+ (fibNaive (- n 1)) (fibNaive (- n 2))))))
;the above line works off the principle that every single term of the
;fibonacci sequence can be expressed by the sum of the two terms lower than it
;which gones on and on until it equals 0 or 1.

(fibNaive 3);2
(fibNaive 5);5
(fibNaive 7);13

(define fibHelper
  (lambda (StorageSum1 StorageSum2 StartNum EndNum)
    (cond
      ((> StartNum EndNum) StorageSum2);outputs the most recent num now that we have finished counting
      ((= StartNum 1) (fibHelper 0 1 2 EndNum))
      (else (fibHelper StorageSum2;moves the recent num into the second most recent
                        (+ StorageSum1 StorageSum2);makes the most recent num the sum of the numbers
                        (+ 1 StartNum);increase the stepper
                        EndNum)))))

(define fib ;this is the wrapper function for fibHelper
  (lambda (n)
    (fibHelper 0 0 0 n)));fibHelper should be given 0s ecept for the endnum input

(fib 3);2
(fib 5);5
(fib 7);13