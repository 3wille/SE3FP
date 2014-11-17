#lang racket
(require se3-bib/macos-module)
;;;(say "Hello World!" "Victoria")

;; Aufgabe 1.1
;; Liste aus Paaren von char -> string
(define Buchstabiertafel
  '( (#\A "Alfa")
     (#\B "Bravo")
     (#\C "Charlie")
     (#\D "Delta")
     (#\E "Echo")
     (#\F "Foxtrott")
     (#\G "Golf")
     (#\H "Hotel")
     (#\I "India")
     (#\J "Juliett")
     (#\K "Kilo")
     (#\L "Lima")
     (#\M "Mike")
     (#\N "November")
     (#\O "Oscar")
     (#\P "Papa")
     (#\Q "Quebec")
     (#\R "Romeo")
     (#\S "Sierra")
     (#\T "Tango")
     (#\U "Uniform")
     (#\V "Viktor")
     (#\W "Whiskey")
     (#\X "X-ray")
     (#\Y "Yankee")
     (#\Z "Zulu")
     (#\0 "Nadazero")
     (#\1 "Unaone")
     (#\2 "Bissotwo")
     (#\3 "Terrathree")
     (#\4 "Kartefour")
     (#\5 "Pantafive")
     (#\6 "Soxisix")
     (#\7 "Setteseven")
     (#\8 "Oktoeight")
     (#\9 "Novenine")
     (#\, "Decimal")
     (#\. "Stop")))

;; Aufgabe 1.2
;;
(define (char->code c)
  (cdr (assoc c Buchstabiertafel)))

;; Aufgabe 1.3
;;
(define (char->CoDe c)
  (char->code
   (if (char<=? #\a c #\z)
       (integer->char (- (char->integer c) 32))
       c)))

;; Aufgabe 1.4
;;
(define (spellout text)
  (spellout-list-of-char (string->list text))
  )

(define (spellout-list-of-char cl)
  (if (<= (length cl) 1)
      (char->CoDe (car cl))
      (spellout-list-of-char (cdr cl))
      )
  )
  
(spellout "abc")