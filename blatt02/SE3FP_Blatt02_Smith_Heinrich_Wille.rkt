#lang racket

(define miau 'Plueschi )

(define katze miau )

(define tiger 'miau )

(define (welcherNameGiltWo PersonA PersonB)
  ( let ((PersonA 'Sam)
         (PersonC PersonA))
     PersonC))

(define xs1 '( 0 2 3 miau katze))

(define xs2 ( list miau katze))

(define xs3 ( cons katze miau))

;;Aufgabe 1

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
;wie bei dem vorherigem, nur das diesmal aus ( welcherNameGiltWo 'tiger 'katze) keine Symbol erzeugt wird und eval so eine Ebene tiefer evaluieren kann, welches 'Plueschi liefert

;;Aufgabe 2
