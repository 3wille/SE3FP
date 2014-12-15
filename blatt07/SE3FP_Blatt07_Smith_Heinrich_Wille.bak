#lang racket

(define (range interval count)
  (let* ([dif (- (cdr interval) (car interval))]
         [step (/ dif count)])
    (rangerek (car interval) count step)))

(define (rangerek low count step)
  (cond [(> count 0)
         (append (list low) 
                 (rangerek (+ low step) (- count 1) step))]
        [else '()]))

(define (endrange interval count)
  (endrangerek count (/ (- (cdr interval) (car interval)) count) (car interval) '()))

(define (endrangerek count step low output)
  (if (= count 0)
      (reverse output)
      (endrangerek (- count 1) step (+ low 2) (cons low output))))

(define (highrange interval count)
  (build-list count 
              (lambda (x) 
                      (+ (car interval) 
                         (* x (/ (- (cdr interval) 
                                    (car interval)) 
                                 count
                                 ))))))

;;test
(range '(0 . 10) 5)
(endrange '(0 . 10) 5)
(highrange '(0 . 10) 5)
