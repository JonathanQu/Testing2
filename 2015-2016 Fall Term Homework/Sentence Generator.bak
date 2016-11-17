;Jonathan Quang
; IntroCS1 pd7
; HW39 - Generating Sentences
; 2015-11-30

(define nouns '(Jonathan_Wong Genkina Tim Dreams))
(define verbs '(eats grades drowns swims))
(define adjectives '(unstable big small evil))
(define adverbs '(quickly slowly violently abruptly))
(define articles '(a the))


(define nth;returns nth element of a list
  (lambda (n L)
    (cond
      ((= n 0) (car L))
      (else (nth (- n 1) (cdr L))))))

(define random-element;takes a list and returns a random element based on length
  (lambda (L)
    (nth (random (length L)) L)))

(define one-of;takes a list and returns a random element
  (lambda (L)
    (random-element L)))

(define Noun (lambda () (one-of nouns)));returns one of the nouns from the nouns list 
(define Verb (lambda () (one-of verbs))) ;returns a verb from the verbs list
(define Adjective (lambda () (one-of adjectives))) ;this + the next three lines follow the above logic
(define Adverb (lambda () (one-of adverbs))) 
(define Article (lambda () (one-of articles))) 

(define noun-phrase (lambda () ;returns 0-1 articles, 0 or more adjectives, and a noun in a list
(append (Article?) (Adjective*) (list (Noun))))) 

(define verb-phrase (lambda () ;returns a verb, 0-1 noun phrases, and 0-1 adverbs in a list 
(append (list (Verb)) (noun-phrase?) (Adverb?)))) 

(define sentence (lambda () ;returns a sentence with one noun and verb phrase
(append (noun-phrase) (verb-phrase)))) 

(define Article? (lambda ();50% chance between 0-1 articles
   (if (= 1 (random 2)) (list (Article)) '()))) 


(define Adverb? (lambda ();50% chance between 0-1 adverbs
                   (if (= 1 (random 2)) (list (Adverb)) '())))


(define Adjective* (lambda ();50% chance between 0 or 1 more adjective with rescursion
                     (if (= 1 (random 2))
                         (append (list (Adjective)) (Adjective*))
                         '())))


(define noun-phrase? (lambda ();50% chance between 0-1 noun phrases
                       (if (= 1 (random 2))
                           (noun-phrase)
                           '()
                           )))


(sentence)