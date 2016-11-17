;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |True or False..who knows|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW11 -- True or False..who knows?/Boolean functions/ Creating Boolean functions that work off of boolean primitives given in class
; 2000-10-07   

;XOR is a logic function that checks if the two booleans that checks
;if only one boolean is true
(define XOR
    (lambda (Boolean1 Boolean2) 
        (and (or Boolean1 Boolean2) (not (and Boolean1 Boolean2)))))
        
(XOR true true) ;should be false
(XOR true false) ;should be true
(XOR false true) ;should be true
(XOR false false) ;should be false

;bic is a logic function that checks if the
;two boolean inputs are the same, it is logical equivalent
;to the negation of XOR
(define bic
    (lambda (Boolean1 Boolean2)
        (not (XOR Boolean1 Boolean2))))
        
(bic true true) ;should be true
(bic true false) ;should be false
(bic false true) ;should be false
(bic false false) ;should be true

;XOR3 is a function that takes three bolean inputs and
;returns true if only one input is true
(define XOR3
    (lambda (Boolean1 Boolean2 Boolean3)
        (or (and Boolean1 (not Boolean2) (not Boolean3))
            (and (not Boolean1) Boolean2 (not Boolean3))
            (and (not Boolean1) (not Boolean2) Boolean3))))
            
(XOR3 true true true) ;should be false
(XOR3 true true false) ;should be false
(XOR3 true false false) ;should be true

;More tests are neccessary because there are more possibilities
;such as (TFT), (FTT), (FFT)