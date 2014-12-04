#lang racket
(require test-engine/racket-tests)
;KOMMENTAR: 26 / 29 Pkt

;;Aufgabe 1
;KOMMENTAR: 9 Pkt
(define miau 'Plueschi)
(define katze miau)
(define tiger 'miau)

(define (welcherNameGiltWo PersonA PersonB)
  (let ((PersonA 'Sam) 
        ( PersonC PersonA ) ) PersonC ) 
  )

(define xs1 '(0 2 3 miau katze))
(define xs2 (list miau katze))
(define xs3 (cons katze miau))

;miau
;evaluiert zu 'Plueschi, da es als dieses definiert ist

;katze
;evaluiert ebenfalls zu 'Plueschie, da es als miau definiert
;ist, welches als 'Plueschi definiert ist

;tiger
;evaluiert zu 'miau, da dieses ein Symbol ist

;(quote katze)
;gibt 'katze zurück, da beides synonyme für einander sind

;(eval tiger)
;zuerst wird tiger evaluiert, das auf miau zeigt,
;worauf dann eval angewendet wird, welches 'Plueschi zurück gibt

;(eval katze)
;gibt einen Fehler zurück, da es wie bei dem vorherigen vorgeht,
;aber 'Plueschi nicht definiert ist

;(eval 'tiger)
;evaluiert das symbol tiger, welches auf 'miau verweist

;(welcherNameGiltWo 'harry 'potter)
;gibt 'harry zurück, da let PersonC als den ersten Parameter
;der Funktion definiert, welcher bei diesem Aufruf 'harry ist

;(cdddr xs1)
;gibt die Liste '(miau katze) zurück da die cdddr den Rest der Liste nach dem dritten Element zurück gibt

;(cdr xs2)
;Gibt '(Pluschi) zurück, da cdr die Liste ohne das erste Element gibt und katze zu '(Plueschi) evaluiert

;(cdr xs3)
;Gibt ebenfalls '(Plueschi) zurück, da beide Elemente von xs3 afu 'Plueschi evaluieren

;(eval (sqrt 3))
;evaluiert die wurzel von drei, was bei ca. 1.73 liegt

;(eval '( welcherNameGiltWo 'tiger 'katze))
;gibt 'tiger zurück, da das symbol '( welcherNameGiltWo 'tiger 'katze)) durch eval ausgewertet wird

;(eval (welcherNameGiltWo 'katze 'tiger))
;wie bei dem vorherigem, nur das diesmal aus ( welcherNameGiltWo '


;; Aufgabe 2.1 Fakultät
;KOMMENAR: 2 Pkt
(define (fak x)
  (if (= x 0)
      1
      (* (fak (sub1 x)) x)))

;; Aufgabe 2.2
;KOMMENTAR: 3 Pkt
(define (potRat ratZahl potenz)
 (if(= potenz 0)
    1
    (if(odd? potenz)
       (*(potRat ratZahl (sub1 potenz)) ratZahl)
       (*(potRat ratZahl (/ potenz 2)) (potRat ratZahl (/ potenz 2))))))

;; Aufgabe 2.3 Eulerzahl
;KOMMENTAR: 6 Pkt
(define (eulersche-zahl)
  (/ (2e 1) 2))
 
(define (2e x)
  (let ([epsilon (/ 1 (potRat 10 1000))]
        [glied (/ x (fak (- x 1)))])
    (if (< glied epsilon)
        0
        (+ glied (2e (+ x 1))))))
 
(define (eulersche-zahl-leserlich)
  (* (eulersche-zahl) (potRat 10 1001)))

;; Aufgabe 2.4 PI
;KOMMENTAR: 4 Pkt
(define (my-pi)
  (* (my-4pi 0) 4))
 
(define (my-4pi x)
  (let ([epsilon (/ 1 (potRat 10 4))]
        [glied (/ 1 (+ 1 (* x 2)))]
        [signum (if (even? x)
                    +1
                    -1)])
    (if (< glied epsilon)
        0
        (+ (* signum glied) (my-4pi (+ x 1))))))

(define (my-pi-leserlich)
  (* (my-pi) (potRat 10 1001)))
; Wir deuten die Frage so, das das erreichen eines 
; spezifizierten Epsilons gemeint ist: Fakultät(n) wächst deutlich
; schneller als (2n -1).
; Sollte die Frage darauf abzielen, warum der Algorrithmus für e 
; schneller ein akurates Ergebnis erreicht... gute Frage! ;)

;; Aufgabe 3 Typprädikate
;KOMMENTAR: Keine Erläuterungen? :(
;KOMMENTAR: 2 Pkt
(define (type-of was-bin-ich)
  (cond [(boolean? was-bin-ich) "boolean"]
        [(pair? was-bin-ich) "pair"]
        [(list? was-bin-ich) "list"]
        [(symbol? was-bin-ich) "symbol"]
        [(number? was-bin-ich) "number"]
        [(char? was-bin-ich) "char"]
        [(string? was-bin-ich) "string"]
        [(vector? was-bin-ich) "vector"]
        [(procedure? was-bin-ich) "procedure"]
        [else "snafu!"]))

(type-of (* 2 3 4))
(type-of (not 42))
(type-of '(eins zwei drei))
(type-of '())
(define (id z) z)
(type-of (id sin))
(type-of (string-ref "Harry Potter und der Stein der Weisen" 3))
(type-of (lambda (x) x))
(type-of type-of)
(type-of (type-of type-of))
