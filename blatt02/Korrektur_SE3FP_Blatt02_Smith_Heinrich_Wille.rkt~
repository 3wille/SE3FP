#lang racket
(require test-engine/racket-tests)

;Aufgabe 1.1
;Umrechnung von Grad ins Bogenmaß
(define (degrees->radians deg)(
                              * deg ( / pi 180)
))

;(degrees->radians 90)
;Umrechnung vom Bogenmaß zu Grad
(define (radians->degrees rad)(
                              * rad ( / 180 pi )
))

;Aufgabe 1.2
;Umkehrfunktion des Cosinus
(define (my-acos alpha)(
                        - (/ pi 2) (* 2 (atan(/ alpha (+ 1 (sqrt(- 1 (* alpha alpha)))))))
                          )
;                        acos alpha
;                        atan(/ (sqrt(- 1 (* alpha alpha)))  alpha)
  )


;Aufgabe 1.3
;Umrechnung von Nautischen Meilen zu Kilometern
(define (nm->km nm)
  (* nm 1.852))

;Aufgabe 2.1
; Distanz zwischen A und B mit Parametern
; Start-Breitengrad Start-Längengrad Ziel-Breitengrad Ziel-Längengrad
(define (distanzAB ab al bb bl)
  (nm->km (* 60 (radians->degrees  
                 (dG ab al bb bl)                              
                 )
             )
          )
  )

; Hilfsfunktion zur Berechnung des Winkels dG
; Parameter in Grad
(define (dG ab al bb bl)
  (my-acos
   (+ (* (sin (degrees->radians ab))
         (sin (degrees->radians bb))
         )
      (* (cos (degrees->radians ab))
         (cos (degrees->radians bb))
         (cos (degrees->radians 
               (- bl al)))
         )
      )
   )
  )

;Aufgabe 2.2
; Richtung des Kurses zwischen A und B mit Parametern
; Start-Breitengrad Start-Längengrad Ziel-Breitengrad Ziel-Längengrad
(define (Anfangskurs Aφ Aλ Bφ Bλ)
  (correctedcourse Aλ Bλ 
                   (radians->degrees 
                    (my-acos
                     (/ (- (sin (degrees->radians Bφ))
                           (* (cos (dG Aφ Aλ Bφ Bλ))
                             (sin (degrees->radians Aφ)))
                           ) 
                        (* (cos (degrees->radians Aφ))
                           (sin (dG Aφ Aλ Bφ Bλ)))
                        )
                     )
                    )
                   )
  )

; Hilfsfunktion1 für 2.2
(define (goingEast? Aλ Bλ) 
  (cond[(<= Aλ Bλ) #t]
       [else #f]
       )
  )
;Hilfsfunktion für 2.2
(define (correctedcourse Aλ Bλ alpha)
  (cond[(goingEast? Aλ Bλ) alpha]
       [else (- 360 alpha)]
       )
  )

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

;; TESTS
(define epsilon 0.1)

;Aufgabe 1.1
(check-within (degrees->radians 90) 1.5707963267948966 epsilon)
(check-within (degrees->radians 180) pi epsilon)
(check-within (degrees->radians 0) 0 epsilon)
(check-within (degrees->radians 540) (* pi 3) epsilon)

(check-within (radians->degrees pi) 180 epsilon)
(check-within (radians->degrees 0) 0 epsilon)
(check-within (radians->degrees (* pi 2)) 360 epsilon)
(check-within (radians->degrees (* pi 3)) 540 epsilon)

;Aufgabe 1.2
(check-within (my-acos -1) pi epsilon)
(check-within (my-acos 0)  (/ pi 2) epsilon)
(check-within (my-acos +1)  0 epsilon)

;Aufgabe 1.3
(check-within (nm->km 1) 1.852 epsilon)
(check-within (nm->km 2) 3.704 epsilon)

;Aufgabe 2.1
; http://distancecalculator.globefeed.com/World_Distance_Calculator.asp
(define epsilon2 10)
;Oslo nach Hong Kong
; http://distancecalculator.globefeed.com/World_Distance_Result.asp?fromplace=Oslo%20%28Oslo,Norway%29&toplace=Hong%20Kong%20%28,Hong%20Kong%29&fromlat=59.93&tolat=22.20&fromlng=10.75&tolng=114.10
; 8594.79 kilometers (km) (Abfrage gemäß Aufgabe angepasse)
(check-within (distanzAB 59.93 10.75 22.20 114.10) 8594.79 epsilon2)
;San Francisco nach Honolulu
; distancecalculator.globefeed.com/World_Distance_Result.asp?fromplace=San Francisco (California,San Francisco County,US)&toplace=Honolulu (Hawaii,Honolulu County,US)&fromlat=37.75&tolat=21.32&fromlng=-122.45&tolng=-157.83
; 3847.10 km
(check-within (distanzAB 37.75 -122.45 21.32 -157.83) 3847.10 10)
;Osterinsel nach Lima
; distancecalculator.globefeed.com/World_Distance_Result.asp?fromplace=Hanga Roa (Valparaiso,Chile)&toplace=Lima (Lima,Peru)&fromlat=-27.10&tolat=-12.10&fromlng=-109.40&tolng=-77.05
; 3759.98
(check-within (distanzAB -27.10 -109.40 -12.10 -77.05) 3759.98 10)

; Aufgabe 2.2 (Zusatz)
;
;Oslo nach Hong Kong
(check-within (Anfangskurs 59.93 10.75 22.20 114.10) 67.44 epsilon2)
;San Francisco nach Honolulu
(check-within (Anfangskurs 37.75 -122.45 21.32 -157.83) 251.78 epsilon2)
;Osterinsel nach Lima
(check-within (Anfangskurs -27.10 -109.40 -12.10 -77.05) 70.07 epsilon2)

; going east? Oslo HongKong
(check-expect (goingEast? 10.75 114.10) #t)
; going west? HongKong Honolulu
(check-expect (goingEast? 114.10 -157.83) #f)
; correction going east
(check-expect (correctedcourse 10.75 114.10 30) 30)
; correction going west
(check-expect (correctedcourse 114.10 -157.83 30) 330)

; Aufgabe 2.3
(check-expect (grad->himmelsrichtung 90) "E")
(check-expect (grad->himmelsrichtung 270) "W")

( check-within (himmelsrichtung->grad "S") 180 epsilon)
( check-within (himmelsrichtung->grad "SSW") 202.5 epsilon)

; GO! :)
(test)