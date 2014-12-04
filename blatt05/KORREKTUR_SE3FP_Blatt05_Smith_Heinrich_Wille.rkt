#lang racket
(require racket/trace)
(require 2htdp/image)
(require se3-bib/butterfly-module-2013)

;KOMMENTAR: 19 / 36 Punkte

; Kommentar von uns:
;; Zeichnen funktioniert nicht. KOMMENTAR: Ich habs mal gefixt (siehe unten)
;; Entschuldige das Codewirrwarr. KOMMENTAR: Passt schon :)
;; Im Rückschluss wäre Map bedeutend besser gewesen, ist uns nur leider zuspät eingefallen

;;; Aufgabe 1
;KOMMENTAR: 9 Pkt Begründung fehlt
; Wir teilen die Aufgabe in folgende Teilprobleme auf:
;; 1) Für jedes dominante Gen der Eltern ein zufälliges rezessives finden
;; 2) Von beiden Eltern je eines der beiden Gene für beliebig viele Kinder zufällig bestimmen
;; 3) Von diesen das Dominante wählen
;; 4) Die Familie anzeigen

; Wir schreiben eine Funktion 'Familie', welche die gegebenen Gene der Eltern in einer Liste zusammenfasst.
; Mit dieser Liste erzeugen wir in 'getRezessiv' zufällige, aber den Dominanzregeln entsprechende rezessive Gene.
; Alle gene übergeben wir einer Funktion 'Kind', die rekursiv Listen aus Genen erzeugt.
; Für diese Gene wählen wir das dominante Gen aus einem pro Elternteil zufällig ausgewähltem Gen.
; Wir lassen Eltern und Kinder zeichnen.


;KOMMENTAR: 10 Pkt
;KOMMENTAR: So schlimm sieht es doch gar nicht aus
(define farbe '(blue yellow red))
(define muster '(stripes dots star))
(define fuehler '(curved straight curly))
(define fluegel '(hexagon rhomb ellipse))

; Finde ein zufaelliges rezessives Gen fuer ein gegebenes dominantes Gen und fuer ein gegebenes Merkmal
; Gibt beide Gene als Paar aus
(define (getRezessiv merkmal dominantes)
  (let ([moeglich (member dominantes merkmal)])
    (cons dominantes (list-ref moeglich (random (length moeglich))))))

; Test getRezessiv
#|
(getRezessiv farbe 'blue)
(getRezessiv farbe 'blue)
(getRezessiv farbe 'blue)
(getRezessiv farbe 'blue)
(getRezessiv muster 'dots)
(getRezessiv muster 'dots)
(getRezessiv muster 'dots)
(getRezessiv muster 'dots)
|#
; Findet bei zwei Genen aus einem Merkmal das dominante Gen
(define (chooseDominant gen1 gen2)
  (let 
      ([merkmal 
        (cond 
          [(not (not (member gen1 farbe))) farbe]
          [(not (not (member gen1 muster))) muster]
          [(not (not (member gen1 fuehler))) fuehler]
          [(not (not (member gen1 fluegel))) fluegel])])
    (cond [(> (length(member gen1 merkmal)) 
              (length(member gen2 merkmal)))
           gen1]
          [gen2])))

;;Test
#|
(chooseDominant 'red 'yellow)
(chooseDominant 'blue 'yellow)
(chooseDominant 'red 'red)
(chooseDominant 'red 'blue)
|#
;wählt aus einem Genpaar zufällig eines aus
(define (randomGen paar)
  (car (shuffle (list (car paar) (cdr paar)))))
  ;(list-ref paar (random 2)))

;baut sich eine Liste aus Kindern rekursiv auf
;jedes Kind ist eine Liste an Genen
; parameter liste ist eine liste mit den dominanten und rezessiven genen der Eltern
;; so sortiert, dass ein Gen paar der Mutter vor dem Genpaar des selben Merkmales des Vaters steht
(define (kind liste anzahl)
  (cond [(> anzahl 0)
           (cons (chooseGens liste)
                 (kind liste (- anzahl 1)))]
        ['()]))


;baut ein Kind aus der Liste der Elterngene 
(define (chooseGens liste)
  (cond [(not (null? liste)) 
         (cons
          (chooseDominant (randomGen (car liste)) 
                          (randomGen (cadr liste)))
          (chooseGens (cddr liste)))]
        ['()]));falls liste leer
(define (zeichenhilfe liste)
  (apply show-butterfly liste))
(trace zeichenhilfe)

(define (zeichne liste)
  (cond [(not(empty? liste) )
         (apply show-butterfly liste)]))
;(trace zeichne)
;show-butterfly

(define (familie mus_m mus_v far_m far_v fue_m fue_v flu_m flu_v anzahl)
  (let* ([rezessivliste (list (getRezessiv farbe far_m) 
                              (getRezessiv farbe far_v)
                              (getRezessiv muster mus_m)
                              (getRezessiv muster mus_v) 
                              (getRezessiv fuehler fue_m)
                              (getRezessiv fuehler fue_v)
                              (getRezessiv fluegel flu_m)
                              (getRezessiv fluegel flu_v))]
         [eltern (list (list mus_m 
                             far_m
                             fue_m
                             flu_m)
                       (list mus_v
                             far_v
                             fue_v
                             flu_m))]) ;flu_v
    (map zeichne (append eltern (kind rezessivliste anzahl)) ;KOMMENTAR: hier hat am Anfang das map gefehlt
   )))

;KOMMENTAR: Sooo es läuft jetzt ;)
;KOMMENTAR: Allerdings werden die Elternschmetterlinge schwarz angezeigt. Das liegt daran, dass
;KOMMENTAR: ihr die Reihenfolge vertauscht habt (seht euch das mit (trace zeichne) an)
;Test
;(familie 'stripes 'dots 'blue 'yellow 'curved 'straight 'hexagon 'rhomb 4)
;(familie 'dots 'stripes 'red 'blue 'curly 'straight 'ellipse 'hexagon 6)
