#lang racket


(define (sm2km sm)
  (* sm 1.852))
(define (grad2bogen grad)
  (*(/(* 2 pi) 360) grad))
(define (bogen2grad bogen)
  (*(/ 360 (* 2 pi)) bogen))