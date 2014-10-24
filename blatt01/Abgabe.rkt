#lang racket

;Aufgabe 1.1
;Umrechnung von Grad ins Bogenmaß
(define (degrees->radians deg)(
                              * deg ( / pi 180)
))

(degrees->radians 90)
;Umrechnung vom Bogenmaß zu Grad
(define (radians->degrees rad)(
                              * rad ( / 180 pi )
))
(radians->degrees (* 2 pi))

;Aufgabe 1.2
;Umkehrfunktion des Cosinus
(define (my-acos alpha)(
             atan(/ (sqrt(- 1 (* alpha alpha)))  alpha)))
(my-acos (cos (* 2 pi)))

;Aufgabe 1.3
;Umrechnung von Nautischen Meilen zu Kilometern
(define (nm->km nm)
  (* nm 1.852))
(nm->km 1)


;Aufgabe 2.1
; Distanz zwischen A und B mit Parametern
; Start-Breitengrad Start-Längengrad Ziel-Breitengrad Ziel-Längengrad
(define (distanzAB ab al bb bl)
  (nm->km (* 60 (radians->degrees (my-acos
             (+ (* (sin (degrees->radians ab))
                   (sin (degrees->radians bb))
                   )
                (* (cos (degrees->radians ab))
                   (cos (degrees->radians bb))
                   (cos (degrees->radians 
                         (- bl al)))
                   )
                )
             ))
          ))
  )
;;Oslo nach Hong Kong
(distanzAB 59.93 10.75 22.20 114.10) ;8604.833km
;;San Francisco nach Honolulu
(distanzAB 37.75 -122.45 21.32 -157.83) ;3851.59km
;;Osterinsel nach Lima
(distanzAB -27.10 -109.40 -12.10 -77.05) ;3764.368

;Gibt für beliebige gradzahlen die entsprechende Himmerlsrichtung züruck
(define (grad->himmelsrichtung grad)
  (cond[(<= grad 11.25)"N"]
       [(<= grad 33.75)"NNE"]
       [(<= grad 56.25)"NE"]
       [(<= grad 78.75)"ENE"]
       [(<= grad 101.25)"E"]
       [(<= grad 123.75)"ESE"]
       [(<= grad 146.25)"SE"]
       [(<= grad 168.75)"SSE"]
       [(<= grad 191.25)"S"]
       [(<= grad 213.75)"SSW"]
       [(<= grad 236.25)"SW"]
       [(<= grad 258.75)"WSW"]
       [(<= grad 281.25)"W"]
       [(<= grad 303.75)"WNW"]
       [(<= grad 326.25)"NW"]
       [(<= grad 348.75)"NNW"]
       [(> grad 348.75)"N"]
       [(> grad 360)"es wird nur eine Gradangabe zwischen 0 und 360 akzeptiert"]
       [(< grad 0)"es wird nur eine Gradangabe zwischen 0 und 360 akzeptiert"]
       [else "es wird nur eine Gradangabe zwischen 0 und 360 akzeptiert"]      
       )
  )

(grad->himmelsrichtung 90)

;Gibt für eine Himmelsrichtung die mittlere Gradzahl
(define (himmelsrichtung->grad hr)
  (cond[(equal? hr "N")0]
       [(equal? hr "NNE")22.5]
       [(equal? hr "NE")45]
       [(equal? hr "ENE")47.5]
       [(equal? hr "E")90]
       [(equal? hr "ESE")112.5]
       [(equal? hr "SE")135]
       [(equal? hr "SSE")157.5]
       [(equal? hr "S")180]
       [(equal? hr "SSW")202.5]
       [(equal? hr "SW")225]
       [(equal? hr "WSW")247.5]
       [(equal? hr "W")270]
       [(equal? hr "WNW")292.5]
       [(equal? hr "NW")315]
       [(equal? hr "NWN")337.5]
       [else "Es werden nur Parameter wie N, ENE, EN... akzeptiert"]
       )
  )
(himmelsrichtung->grad "ESE")