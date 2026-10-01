#lang racket/base

(require (only-in lang/htdp-beginner make-posn posn-y posn-x empty? first rest)
         "../Constants/Shot-Constants.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "./Tick-Moving-Functions.rkt"
         "../Predicates/Shot-Predicates.rkt"
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))


;;Shot -> Shot
;;Purpose: Moves the given shot to the right
(define/contract (move-shot-up a-shot)
  move-shot-up/c
  (cond [(eq? a-shot NO-SHOT) a-shot]
        [(= (posn-y a-shot) MIN-IMG-Y) NO-SHOT]
        [else (make-posn (posn-x a-shot) (move-up-image-y (posn-y a-shot)))]))


;; los --> los
;; Purpose: To move the given list of shots
(define (move-los a-los)
  (if (empty? a-los)
      '()
      (cons (move-shot-up (first a-los))
            (move-los  (rest a-los)))))

;; los loa --> los
;; Purpose: To remove hit and NO-SHOTs from the given los
(define (remove-shots a-los a-loa)
  (cond [(empty? a-los) a-los]
        [(or (eq? (first a-los) NO-SHOT)
             (hit-any-alien? (first a-los) a-loa))
         (remove-shots (rest a-los) a-loa)]
        [else (cons (first a-los) (remove-shots (rest a-los) a-loa))]))