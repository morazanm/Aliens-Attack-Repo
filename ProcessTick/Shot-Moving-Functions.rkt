#lang racket/base

(require (only-in lang/htdp-beginner make-posn posn-y posn-x empty? first rest)
         "../Constants/Shot-Constants.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "./Tick-Moving-Functions.rkt"
         "../Predicates/Shot-Predicates.rkt"
         "../Contracts/Contracts.rkt"
         (only-in racket/list filter-not)
         racket/contract/region)

(provide (all-defined-out))


(define (move-shot-up a-shot)
   move-shot-up/c
  (displayln "The function, move-shot-up, is deprecated, please use move-shot instead.")
  (cond [(eq? a-shot NO-SHOT) a-shot]
        [(= (posn-y a-shot) MIN-IMG-Y) NO-SHOT]
        [else (make-posn (posn-x a-shot) (move-up-image-y (posn-y a-shot)))]))

;;Shot -> Shot
;;Purpose: Moves the given shot to the right
(define/contract (move-shot a-shot)
  move-shot/c
  (cond [(eq? a-shot NO-SHOT) a-shot]
        [(= (posn-y a-shot) MIN-IMG-Y) NO-SHOT]
        [else (make-posn (posn-x a-shot) (move-up-image-y (posn-y a-shot)))]))


;; los --> los
;; Purpose: To move the given list of shots
(define/contract (move-los a-los)
  move-los/c
  (map move-shot a-los))

;; los loa --> los
;; Purpose: To remove hit and NO-SHOTs from the given los
(define/contract (remove-shots a-los a-loa)
  remove-shots/c
  (filter-not (λ (shot) (or (eq? shot NO-SHOT)
                        (hit-any-alien? shot a-loa)))
          a-los))