#lang swindle
( require swindle/setf
          swindle/misc )

;Aufg1
;; 1.1
(defclass* literatur ()
  (schluessel :accessor schl
              :initarg :schluessel)
  (autor :accessor aut
         :initarg :autor)
  (jahr :accessor ja
        :initarg :jahr)
  (titel :accessor ti
         :initarg :titel)
  :printer #t
  )

(defclass* buch (literatur)
  (verlag :accessor ver
          :initarg :verlag)
  (verlagsort :accessor ort
              :initarg :verlagsort)
  (reihe :accessor rei
         :initarg :reihe)
  (snreihe :accessor sn
           :initarg :snreihe)
  )
(defclass* sammel (buch)
  (herausgeber :accessor her
               :initarg :herausgeber)
  (seite :accessor s
         :initarg :seite))
(defclass* zeitsartikel (literatur)
  (name :accessor nam
        :initarg :name)
  (bandnummer :accessor banu
              :initarg :bandnummer)
  (heftnummer :accessor henu
              :initarg :heftnummer)
  (monat :accessor mo))

(define nessie 
  (make buch 
        :schluessel 1
        :autor "Nessie"
        :jahr "1790"
        :titel "Mein Leben in Loch Ness: Verfolgt als Ungeheuer"
        :verlag "Minority-Verlag"
        :verlagsort "Inverness"
        :reihe "Die besondere Biographie"
        :snreihe "2"
        ))

;; 1.2
(defgeneric* cite ((li literatur)))

(defmethod cite ((b buch))
  (string-append (aut b) " (" (ja b) "). " (ti b) ", Band " (sn b) " der Reihe: " (rei b) ". " (ver b) ", " (ort b) "."))

;; Aufgabe 2
;;; 2.1
;;;; 2.1.1

(defclass* fahrzeug ()
  (name :accessor na
        :initarg :name)
  (medium :reader me)
  (maxgesch :accessor mg
            :initarg :maxgesch)
  (zuladung :accessor zl
            :initarg :zuladung)
  (verbrauch :accessor verbr
             :initarg :verbrauch)
  (passagiere :accessor pas
              :initarg :passagiere)
  :reader #t
  )

(defclass* land (fahrzeug)
  (medium :initvalue "land"))
(defclass* schiene (land)
  (medium :initvalue "schiene"))
(defclass* strasse (land)
  (medium :initvalue "strasse"))
(defclass* wasser (fahrzeug)
  (medium :initvalue "wasser"))
(defclass* luft (fahrzeug)
  (medium :initvalue "luft"))
(defclass* amphibien (land wasser))
(defclass* luphibien (luft strasse wasser))
(defclass* zweiwege (strasse schiene))
(defclass* zeitzug (schiene luft))