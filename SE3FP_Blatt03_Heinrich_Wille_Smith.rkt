#lang racket
(require se3-bib/flaggen-module)

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
;; Suche nach der ersten Übereinstimmung mit dem ersten Element der Paare
;; Eine Funktion, die Buchstaben mittels der Buchstabiertabelle auf ihre Schlüssel abbildet
(define (char->code c)
  (cdr (assoc c Buchstabiertafel)))

;; Aufgabe 1.3
;; ASCII Rechnen... über den Integerumweg
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

;; Aufruf der rekursiven Hilfsfunktion string->list
(define (spellout text)
  (spellout-list-of-char (string->list text))
  )

;; Aufbau einer neuen Liste aus den substituierten Elementen
(define (spellout-list-of-char cl)
  (if (= (length cl) 1)
      (char->CoDe (car cl))
      (append (char->CoDe (car cl))(spellout-list-of-char (cdr cl))))
      )
 

; Test  
(spellout "abc")

(spellout "Racket")

;; Aufgabe 2.1
;; Liste aus Paaren von char -> string
(define Flaggentafel
  '( (#\A A)
     (#\B B)
     (#\C C)
     (#\D D)
     (#\E E)
     (#\F F)
     (#\G G)
     (#\H H)
     (#\I I)
     (#\J J)
     (#\K K)
     (#\L L)
     (#\M M)
     (#\N N)
     (#\O O)
     (#\P P)
     (#\Q Q)
     (#\R R)
     (#\S S)
     (#\T T)
     (#\U U)
     (#\V V)
     (#\W W)
     (#\X X)
     (#\Y Y)
     (#\Z Z)
     (#\0 Z0)
     (#\1 Z1)
     (#\2 Z2)
     (#\3 Z3)
     (#\4 Z4)
     (#\5 Z5)
     (#\6 Z6)
     (#\7 Z7)
     (#\8 Z8)
     (#\9 Z9)))

;; Aufgabe 4.2
;; Suche nach der ersten Übereinstimmung mit dem ersten Element der Paare
(define (char->flagge c)
  (cdr (assoc c Flaggentafel)))
;;; (eval (car (char->flagge #\A)))

;; Aufgabe 4.3
;; Aufruf der rekursiven Hilfsfunktion
(define (flagout text)
  (flagout-list-of-char (string->list text))
  )

; Aufbau einer neuen Liste aus den substituierten Elementen
(define (flagout-list-of-char cl)
  (if (<= (length cl) 1)
      (char->flagge (car cl))
      (list (char->flagge (car cl)) 
             (flagout-list-of-char (cdr cl))))
      )

; Test  
(flagout "RACKET")
