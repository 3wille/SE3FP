#lang racket
(require se3-bib/macos-module)
;;;(say "Hello World!" "Victoria")

;; Aufgabe 1.1
;; Liste aus Paaren von char -> string
;; Wir wählen eine Liste von Paaren, weil wir mit assoc das erste Paar finden können, dessen erstes Element
;; gleich dem Schlüssel ist. Wir können also mit Hilfe eines Schlüssel das korrespondierende Element erhalten.
;; Solche Listen von Paaren (auch Assoiziationslisten genannt) entsprechen eigentlich einer Hashmap, 
;; die wir bereits in SEII kennengelernt haben.
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
;; Eine Funktion, die Buchstaben mittels der Buchstabiertabelle auf ihre Schlüssel abbildet
(define (char->code c)
  (cdr (assoc c Buchstabiertafel)))

;; Aufgabe 1.3
;; Eine Funktion, die Kleinbuchstaben auf die entsprechenden Großbuchstaben abbildet und 
;; alle anderen Zeichen auf sich selbst.
(define (char->CoDe c)
  (char->code
   (if (char<=? #\a c #\z)
       (integer->char (- (char->integer c) 32))
       c)))

;; Aufgabe 1.4
;; Eine Funktion, die einen Text in Form eines Strings als Eingabe erhält und auf eine Liste der
;; Buchstabierschlüssel als Strings abbildet
(define (spellout text)
  (spellout-list-of-char (string->list text))
  )

(define (spellout-list-of-char cl)
  (if (= (length cl) 1)
      (char->CoDe (car cl))
      (append (char->CoDe (car cl))(spellout-list-of-char (cdr cl))))
      )
 

  
(spellout "abc")

(spellout "Racket")
