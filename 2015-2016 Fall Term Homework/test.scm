

(define nouns '(Jonathan_Wong Genkina Tim Dreams))
(define verbs '(eats grades flys swims drowns))
(define adjectives '(unstable big small evil))
(define adverbs '(quickly slowly violently abruptly))
(define articles '(a the))


(define nth
  (lambda (n L)
    (cond
      ((= n 0) (car L))
      (else (nth (- n 1) (cdr L))))))

(define random-element
  (lambda (L)
    (nth (random (length L)) L)))

(define one-of
  (lambda (L)
    (random-element L)))

(define Noun (lambda () (one-of nouns))) 
(define Verb (lambda () (one-of verbs))) 
(define Adjective (lambda () (one-of adjectives))) 
(define Adverb (lambda () (one-of adverbs))) 
(define Article (lambda () (one-of articles))) 

(define noun-phrase (lambda () 
(append (Article?) (Adjective*) (list (Noun))))) 

(define verb-phrase (lambda () 
(append (list (Verb)) (noun-phrase?) (Adverb?)))) 

(define sentence (lambda () 
(append (noun-phrase) (verb-phrase)))) 

(define Article? (lambda ()
   (if (= 1 (random 2)) (Adjective) '()))) 


(define Adverb? (lambda ()
                   (if (= 1 (random 2)) (Adverb) '())))


(define Adjective* (lambda ()
                     (if (= 1 (random 2))
                         (list (adjective) (Adjective*))
                         ( '()))))


(define noun-phrase? (lambda ()
                       (if (=1 (random 2)) (noun-phrase) '())))

(define sentence (lambda ()
                   (append (list (Noun)) (list (Verb)))))

(sentence)

