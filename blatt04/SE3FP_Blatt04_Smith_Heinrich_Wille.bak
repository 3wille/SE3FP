#lang racket

;;;Aufgabe 1


;;;Aufgabe 3
( define ( hoch3 x ) (* x x x ) )

( hoch3 ( * 3 (+ 1 ( hoch3 2 ) ) ) )

;;Innere
;(hoch3 ( * 3 (+ 1 ( * 2 2 2 ) ) ) )
;(hoch3 ( * 3 (+ 1 8 ) ) )
;(hoch3 ( * 3 9 ) )
;(hoch3 21 )
;(* 27 27 27)
;19683

;;Äußere
;(hoch3 ( * 3 (+ 1 ( hoch3 2 ) ) ) )
;(* ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* ( * 3 (+ 1 ( * 2 2 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* ( * 3 (+ 1 8 ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* ( * 3 9 ) ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 ( * 3 (+ 1 ( hoch3 2 ) ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 ( * 3 (+ 1 8 ) ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 ( * 3 9 ) ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 27 ( * 3 (+ 1 ( hoch3 2 ) ) ))
;(* 27 27 ( * 3 (+ 1 ( * 2 2 2 ) ) ))
;(* 27 27 ( * 3 (+ 1 8 ) ))
;(* 27 27 ( * 3 9 ))
;(* 27 27 27)
;(19683)

;Reduktionsstrategie:
;Funktionen:
;innere Reduktion
;Spezialformen:
;äußere Reduktion

( define ( new−if condition? then−clause else−clause )
   ( cond ( condition? then−clause )
          ( else else−clause ) ) )

( define ( faculty product counter max−count )
   ( new−if (> counter max−count )
            product
            ( faculty (* counter product )
                      (+ counter 1 )
                      max−count ) ) )
;Das Programm läuft in eine Endlosschleife.
;Die äußere Reduktion ist hier nötig, damit zuerst die If Funktion aufgelöst wird, bevor die darin enthaltenen Blöcke ausgeführt werden.
;In dem Beispiel wird versucht zuerst den Else-Zweig zu evaluieren. Dies führt zu der Endlosschleife, da nie die Abbruchbedingung ausgeführt wird.
