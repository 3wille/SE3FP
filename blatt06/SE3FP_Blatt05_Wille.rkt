#lang racket
(require racket/trace)
(require 2htdp/image)


(define (baum verblAnzahl breite farbe)
  (cond [(> verblAnzahl 0)
         (overlay/align/offset 'center
                               'top
                               (triangle breite "solid" farbe)
                               0
                               (cond [(= 1 verblAnzahl) (/ breite 2)]
                                     [else  (sqrt breite)])
                               (baum (- verblAnzahl 1) (+ breite 10) farbe))]
        [else (rectangle (/ breite 4) 
                         (* breite 0.5)
                         "solid" 
                         "brown")]))
(trace baum)
(baum 20 11 "green")
#|
(define (geschmueckterBaum Breite Hoehe anzahlKugeln)
  (overlay/offset (baum Breite Hoehe "green")
                  (/ Breite )
  |#                
                  
                  