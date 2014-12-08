#lang racket

#| kopfstück: Die Funktion ist linear rekursiv, weil die Funktionsdefinition in jeder Fallunterscheidung auf 
 der rechten Seite der definierenden Gleichung selbst nur einmal  verwendet wird. Denmach ist die Funktion
 auch nicht baumrekursiv (erfordert Mehrfacherverwendung der Funktionsdef. in der selben Fallunterscheidung). Es handelt
 sich um direkte Rekursion, da sich bei indirekter Rekursion zwei Funktionsdefintionen gegenseitig aufrufen 
(siehe odd-even-Bsp Skript). Die Funktion ist nicht endrekursiv, weil das Ergebnis noch mit einem anderen 
 Term verknüpft werden muss (außerdem auch kein Akku). Es ist auch keine geschachtelte Rekursion, da die Funktion
 selbst nicht als Argument bei der rekursiven Verwendung benutzt wird.

 endstück: Die Funktion ist linear rekursiv, weil die Funktionsdefinition in jeder Fallunterscheidung auf 
 der rechten Seite der definierenden Gleichung selbst nur einmal  verwendet wird. Denmach ist die Funktion
 auch nicht baumrekursiv (erfordert Mehrfacherverwendung der Funktionsdef. in der selben Fallunterscheidung).
 Es handelt sich um direkte Rekursion, da sich bei indirekter Rekursion zwei Funktionsdefintionen gegenseitig
 aufrufen (siehe odd-even-Bsp Skript). Es ist auch keine geschachtelte Rekursion, da die Funktion
 selbst nicht als Argument bei der rekursiven Verwendung benutzt wird. Die Funktion ist endrekursiv, weil das Ergebnis
 nicht mit einem anderen Term verknüpft werden muss (außerdem Akku vorhanden).

 merge: Funktion ist baumrekursiv also im Umkehrschluss nicht linear rekursiv, weil in der Fallunterscheidung die 
 Definitionsfunktion mehrfach verwendet wird. Es handelt sich um direkte Rekursion, da sich bei indirekter Rekursion
 zwei Funktionsdefintionen gegenseitig aufrufen (siehe odd-even-Bsp Skript). Es ist auch keine geschachtelte Rekursion,
 da die Funktion selbst nicht als Argument bei der rekursiven Verwendung benutzt wird. Die Funktion ist nicht endrekursiv,
 weil das Ergebnis noch mit einem anderen Term verknüpft werden muss (außerdem auch kein Akku).

 merge-sort: Funktion ist baumrekursiv also im Umkehrschluss nicht linear rekursiv, weil in der Fallunterscheidung die 
 Definitionsfunktion mehrfach verwendet wird. Es handelt sich um direkte Rekursion, da sich bei indirekter Rekursion 
 zwei Funktionsdefintionen gegenseitig aufrufen und das, obwohl merge-sort merge aufruft, weil merge nicht merge-sort aufruft.
 Es ist auch keine geschachtelte Rekursion, da die Funktion selbst nicht als Argument bei der rekursiven Verwendung benutzt wird.
 Die Funktion wird lediglich merge als Argument übergeben. Die Funktion ist nicht endrekursiv, weil das Ergebnis durch den Aufruf
 von merge noch mit einem anderen Term verknüpft werden muss.
|# 

(require 2htdp/image)
;lang/pos nötig für die Positionen der einzelnen Teile des Bildes. 
(require lang/posn)

;ZEichnet einen Baum mit einem Stern auf der Spitze sowie mehrere Koch-Schneeflocken. Baum besteht aus Dreiecken und einem Viereck, Stern aus einem star-polygon. Da die Farbe der Flocken nicht intensiv genug war, 
;haben wir mehrere Flocken übereinander gemalt.        
(define (Bild) 
  (place-images/align
   (list (star-polygon 40 5 2 "solid" "gold")
         (triangle 50 "solid" "darkgreen")
         (triangle 70 "solid" "darkgreen")
         (triangle 90 "solid" "darkgreen")
         (triangle 100 "solid" "darkgreen")
         (rectangle 20 60 "solid" "brown")
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
         flocke
          flocke
         flocke)
   (list (make-posn 100 40)
         (make-posn 100 78)
         (make-posn 100 100)
         (make-posn 100 130)
         (make-posn 100 160)
         (make-posn 100 200)
         (make-posn 50 100)
         (make-posn 50 80)
         (make-posn 150 50)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 50 100)
         (make-posn 50 80)
         (make-posn 150 50)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 150 100)
         (make-posn 50 100)
         (make-posn 50 80)
         (make-posn 50 100)
         (make-posn 50 80)
         )
   "center" "top"
   (rectangle 300 300 "solid" "white"))
  )



;Hilfsfunktion, um die Flocken zu malen
(define (koch-kurve n)
    (cond
      [(zero? n) (square 0.04 "solid" "black")]
      [else
       (local [(define smaller (koch-kurve (- n 1)))]
         (beside/align "bottom"
                       smaller
                       (rotate 60 smaller)
                       (rotate -60 smaller)
                       smaller))]))
;Funktion, um mit der Hilfsfunktion die Flocken zusammenzusetzen
(define flocke
  (above
   (beside
    (rotate 60 (koch-kurve 5))
    (rotate -60 (koch-kurve 5)))
   (flip-vertical (koch-kurve 5))))

;Aufruf der Funktion Bild, die das Bild malt
(Bild)

