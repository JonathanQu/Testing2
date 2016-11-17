;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Calendar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jonathan Quang
; IntroCS1 pd7
; HW16 -- <Calendar/Using Remainder and Quotient/Using Remainder and or Quotient primitives, find leap years and how many days are in a month>
; 2015-10-19

(define isLeapYr? ;LeapYr? is a function that determines if a year is leap year/century
  (lambda (year)
    (if (= (remainder year 100) 0) ;check if its a century
        (if (= (remainder year 400) 0) ;check if its divisible by 400
            true ;true if it's a leap century
            false ;false if it's a century but not a leap century
         )
         (if (= (remainder year 4) 0) ;check if the year is divisible by 4 if its not a century
            true ;it's a leap year
            false ;it's not a leap yar
          )
      )))

(isLeapYr? 2000);true
(isLeapYr? 2004) ;true
(isLeapYr? 2008) ;true
(isLeapYr? 2009) ;false
(isLeapYr? 2100) ;false
(isLeapYr? 2104) ;true
(isLeapYr? 2200) ;false
(isLeapYr? 2300) ;false
(isLeapYr? 2400);true
(isLeapYr? 1984); true
(isLeapYr? 1900);false

(define daysInMonth ;daysInMonth returns the number of days in a given month of a given year
  (lambda (month year)
    (cond ;start first conditional
      ((<= month 6) (cond ;from before and including July, this conditional applies
                    ((= (remainder month 2) 1) 31 ) ;odd number months have 31 days
                    ((and (= (remainder month 2) 0) (not (= month 2))) 30) ;even number months have 30 days except feburary
                    ((isLeapYr? year) 29);if its feburary, check if its a leap year
                    (else 28)
                    ));end of second conditional
      ;below is what applies after July
      ((= (remainder month 2) 1) 30);if after July and odd, there are 30 days
      (else 31) ;the only other possibility here are even months after July, which have 31 days
   )
 ))

(daysInMonth 1 2010) ;31
(daysInMonth 2 2011) ;28
(daysInMonth 2 2000) ;29
(daysInMonth 4 2011) ;30
(daysInMonth 8 2012) ;31
(daysInMonth 12 9001) ;31
(daysInMonth 11 9002) ;30
(daysInMonth 6 1984) ;30