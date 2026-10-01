#lang racket/base

(require (only-in lang/htdp-beginner posn-x posn-y make-posn first rest empty?)
         "./Tick-Moving-Functions.rkt"
         "../Predicates/Shot-Predicates.rkt")

(provide (all-defined-out))


;;Alien -> Alien
;;Purpose: Moves the given alien to the right
(define (move-alien-right an-alien)
  (make-posn (move-right-image-x (posn-x an-alien)) (posn-y an-alien)))


;;Alien -> Alien
;;Purpose: Moves the given alien to the left
(define (move-alien-left an-alien)
  (make-posn (move-left-image-x (posn-x an-alien)) (posn-y an-alien)))


;;Alien -> Alien
;;Purpose: Moves the given alien to the down
(define (move-alien-down an-alien)
  (make-posn (posn-x an-alien) (move-down-image-y (posn-y an-alien))))

;; alien dir --> alien
;; Purpose: Move given alien in given direction
(define (move-alien an-alien a-dir)
  (cond [(eq? a-dir 'right) (move-alien-right an-alien)]
        [(eq? a-dir 'left) (move-alien-left an-alien)]
        [else (move-alien-down an-alien)]))


;; loa dir --> loa
;; Purpose: To move the given loa in the given dir
(define (move-loa a-loa dir)
  (if (empty? a-loa)
      '()
      (cons (move-alien (first a-loa) dir)
            (move-loa (rest a-loa) dir))))

;; loa los --> loa
;; Purpose: To remove the aliens from the given loa hit by any shot in the given los
(define (remove-hit-aliens a-loa a-los)
  (cond [(empty? a-loa) '()]
        [(hit-by-any-shot? (first a-loa) a-los)
         (remove-hit-aliens (rest a-loa) a-los)]
        [else (cons (first a-loa)
                    (remove-hit-aliens (rest a-loa) a-los))]))