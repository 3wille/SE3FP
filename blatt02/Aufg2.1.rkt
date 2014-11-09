#lang racket

(define(fak x)
  (if(= x 0)
     1
     (* (fak (sub1 x)) x)))