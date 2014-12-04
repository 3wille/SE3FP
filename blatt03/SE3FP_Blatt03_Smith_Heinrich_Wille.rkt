#lang racket

;;;Aufgabe 1
;;1.1

; Wir definieren eine Liste bestehend aus Tupeln,
; die jeweils einen Zeichen auf einen Schluessel abbildet

(define buchstabiertafel 
  '((#\A "Alpha")
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
    (#\. "Stop")
    (#\ " ")))

;;1.2
; Codiert einen gegebenen Buchstaben auf den entsprechenden Schluessel aus der Buchstabiertafel.
(define (getKey Buchstabe)
  (cadr(assoc (UpCaseChar Buchstabe) buchstabiertafel)))

;;1.3
; Gibt einen gegebenen Buchstaben als UpCase zurueck.
; Buchstaben die bereits upcase sind, werden so gelassen
(define (UpCaseChar Buchstabe)
  (let* ([integ (char->integer Buchstabe)])
    (integer->char 
     (if 
       (>= integ 97) (- integ 32) integ))))
; das selbe wie oben, nur das die eingebaute Racket Funktion benutzt wird.
(define (UpCaseCharEasy Buchstabe)
  (char-upcase Buchstabe))

;;1.4
(define (Buchstabieren String)
  (asdf (string->list String))) 
   
   
(define (asdf liste)
  (if (not (null? liste)) 
      '()
      (append 
       (getKey 
        (car liste)) 
       (asdf 
        (cdr liste))
       )))