#lang racket/base

(require racket/contract
         2htdp/image
         (only-in lang/htdp-beginner posn-x posn-y posn?)
         rackunit
         ;"../Predicates/Image-Predicates.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "../Constants/Shot-Constants.rkt"
         "../Constants/Image-Constants.rkt"
         ;"../Drawing/Scene-Drawing-Functions.rkt"
         ;"../Drawing/Rocket-Drawing-Functions.rkt"
         ;"../ProcessKey/Rocket-Moving-Functions.rkt"
         )

(provide scene?
         image-x?
         image-y?
         shot?
         rocket?
         alien?
         dir?
 

         draw-ci/c
         ci?/c
         move-rckt-right/c
         move-rckt-left/c
         draw-rocket/c
         draw-rocket-img/c

         is-ci/c
         is-img/c
         is-result-img/c
         is-img-y/c
         is-img-x/c
         is-pix-y/c
         is-pix-x/c

         draw-alien/c
         draw-alien-img/c
         move-right-image-x/c
         move-left-image-x/c
         move-down-image-y/c
         new-dir-after-down/c
         new-dir-after-left/c
         new-dir-after-right/c
         alien-at-right-edge?/c
         alien-at-left-edge?/c
         alien-reached-earth?/c

         is-alien/c
         is-scene/c
         is-dir/c

         move-up-image-y/c
         draw-shot/c
         draw-shot-img/c
         make-shot/c
         hit?/c
         move-shot-up/c
         move-alien-left/c
         move-alien-right/c
         move-alien-down/c

         move-los/c
         remove-shots/c
         move-alien/c
         move-loa/c
         remove-hit-aliens/c
         hit-by-any-shot?/c
         hit-any-alien?/c
         any-alien-at-right-edge?/c
         any-alien-at-left-edge?/c
         any-alien-reached-earth?/c
         any-aliens-alive?/c
         draw-los/c
         draw-los-img/c
         draw-loa/c
         draw-loa-img/c)


;; formatting functions 
(define (format-error blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a" message)]
        [(posn? value) (format "~a: ~v" message value)]
        [(list? value) (format "~a: ~v" message value)]
        [else (format "~a: ~a" message value)]))



(define (format-error-display-list-items-los blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a" message)]
        [(posn? value) (format "~a: ~v" message value)]
        [(list? value) (let [(bad-vals (filter (λ (x) (not (shot? x))) value))]
                         (cond [(= 1 (length bad-vals)) (format "~a ~v that contains an element that is not a shot: ~v" message value (car bad-vals))]
                               [(= 2 (length bad-vals)) (format "~a ~v that contains the following elements that are not shots: ~a" message value (string-append (format "~v " (car bad-vals))
                                                                                                                                                  (format "and ~v" (car (cdr bad-vals)))))]
                               [else (format "~a ~v that contains the following elements that are not shots: ~a" message value (string-of-list-elem bad-vals))]))] 
[else (format "~a: ~a" message value)]))

(define (format-error-display-list-items-loa blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a" message)]
        [(posn? value) (format "~a: ~v" message value)]
        [(list? value) (let [(bad-vals (filter (λ (x) (not (alien? x))) value))]
                         (cond [(= 1 (length bad-vals)) (format "~a ~v that contains an element that is not an alien: ~v" message value (car bad-vals))]
                               [(= 2 (length bad-vals)) (format "~a ~v that contains the following elements that are not aliens: ~a" message value (string-append (format "~v " (car bad-vals))
                                                                                                                                                  (format "and ~v" (car (cdr bad-vals)))))]
                               [else (format "~a ~v that contains the following elements that are not aliens: ~a" message value (string-of-list-elem bad-vals))]))] 
[else (format "~a: ~a" message value)]))

(define (string-of-list-elem val)
  (define (helper-for-string-of-list-elem val accum)
    (cond [(null? val) val]
          [(= 1 (length val)) (string-append accum (format "and ~v" (car val)))]
          [else (helper-for-string-of-list-elem (cdr val) (string-append accum (format "~v, " (car val))))]))
  (helper-for-string-of-list-elem val ""))
  
      

(define (format-error-for-image-w&h blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(posn? value) (format "~a: ~v" message value)]
        [(list? value) (format "~a: ~v" message value)]
        [(image? value) (format "~a of width ~a and height ~a" message (image-width value) (image-height value))]
        [else (format "~a: ~a" message value)]))

(define (format-error-results blame value message)
  (cond [(string? value) (format "~s" message)]
        [(posn? value) (format "~a: ~v" message value)]
        [(list? value) (format "~a: ~v" message value)]
        [(image? value) (format "~a" message)]
        [else (format "~a" message)]))


(define (type-arg-formatter func-name arg-name arg-type)
  (cond [(image? arg-type) (format "~a: expects ~a as input, given image" func-name arg-name)]
        [else (format "~a: expects ~a as input, given" func-name arg-name)]))



;;;;;Predicates

(define (scene? x)
  (and (image? x)
       (= (image-width x) E-SCENE-W)
       (= (image-height x) E-SCENE-H)))

;; number -> Boolean
;;Purpose: Determines if X is an image-x
(define (image-x? x)
  (and (number? x)
       (<= 0 x (sub1 MAX-CHARS-HORIZONTAL))))

;; number -> Boolean
;;Purpose: Determines if X is an image-y
(define (image-y? x)
  (and (number? x)
       (<= 0 x (sub1 MAX-CHARS-VERTICAL))))

;;<X> X -> Boolean
;;Purpose: Determines if x is a dir
(define (dir? x)
  (or (eq? 'right x)
      (eq? 'left x)
      (eq? 'down x)))

;;<X> X -> Boolean
;;Purpose: Determines if X is a rocket
(define (rocket? val)
  (and (number? val)
       (image-x? val)))

;; <X> X -> Boolean
;;Purpose: Determines if X is an shot
(define (shot? val)
  (or (eq? NO-SHOT val)
      (and (posn? val)
           (image-x? (posn-x val))
           (image-y? (posn-y val)))))

;; <X> X -> boolean
;; purpose: determines if the given value is an alien
(define (alien? x)
  (and (posn? x)
       (image-x? (posn-x x))
       (image-y? (posn-y x))))

;; image -> boolean
;; purpose: determines if the given image is a ci
(define (ci? val)
  (and (<= (image-width val)  MAX-CI-WIDTH)
       (<= (image-height val) MAX-CI-HEIGHT)))


;; CONTRACTS

;;contract
;;Purpose: Determines if the input is a ci
(define (is-ci/c func-name)
  (make-flat-contract
   #:name 'is-ci?
   #:projection (λ (blame)
                  (λ (val)
                    (or (ci? val)
                        ((λ ()
                           (current-blame-format format-error-for-image-w&h)
                           (raise-blame-error
                            blame
                            val
                            (type-arg-formatter func-name "a ci" val)))))))))


;; contract
;; Purpose: Determine if the input is an image
(define (is-img/c func-name)
  (make-flat-contract
   #:name 'is-img?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "an image" val)))))))))



;; contract
;; purpose: determine if the result is an image
(define (is-result-img/c func-name)
  (make-flat-contract
   #:name 'is-img?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image? val)
                        ((λ ()
                           (current-blame-format format-error-results)
                           (raise-blame-error
                            blame val
                            (format "~a should return image, instead returned ~a. please contact developers" func-name val)))))))))


;; contract
;; purpose: determine if the input is an integer between 0 and (sub1 MAX-CHARS-VERTICAL)
(define (is-img-y/c func-name)
  (make-flat-contract
   #:name 'is-img-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image-y? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "an integer between 0 and (sub1 MAX-CHARS-VERTICAL)" val)))))))))



;; contract
;; purpose: determine if the input is an integer between 0 and (sub1 MAX-CHARS-HORIZONTAL)
(define (is-img-x/c func-name)
  (make-flat-contract
   #:name 'is-img-x?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image-x? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "an integer between 0 and (sub1 MAX-CHARS-HORIZONTAL)" val)))))))))



(define within-max-chars-hori*img-w-1/c (integer-in 0 (sub1 (* MAX-CI-WIDTH MAX-CHARS-HORIZONTAL))))
(define within-max-chars-vert*img-w-1/c (integer-in 0 (sub1 (* MAX-CI-HEIGHT MAX-CHARS-VERTICAL))))

;; contract
;; purpose: determine if the input is an image-x
(define (is-pix-y/c func-name)
  (make-flat-contract
   #:name 'is-pix-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-vert*img-w-1/c val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "expecting an integer in [0..(MAX-CHARS-VERTICAL * IMAGE-WIDTH)-1]" val)))))))))



;; contract
;; purpose: determine if the input is an image-x
(define (is-pix-x/c func-name)
  (make-flat-contract
   #:name 'is-pix-x?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-hori*img-w-1/c val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "expected an integer in [0..(MAX-CHARS-HORIZONTAL * IMAGE-HEIGHT)-1]" val)))))))))



;;contract
;;Purpose: Determines if the input is a ci
(define (is-img&ci/c func-name)
  (make-flat-contract
   #:name 'is-img&ci?
   #:projection (λ (blame)
                  (λ (val)
                    (or (and (image? val)
                             (ci? val))
                        ((λ ()
                           (current-blame-format format-error-for-image-w&h)
                           (raise-blame-error
                            blame
                            val
                            (type-arg-formatter func-name "a ci" val)))))))))


;;contract
;;Purpose: Determine if the input is an rocket
(define (is-rocket/c func-name)
  (make-flat-contract
   #:name 'is-rocket/c
   #:projection (λ (blame)
                  (λ (val)
                    (or (and (number? val)
                             (rocket? val))
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame
                            val
                            (type-arg-formatter func-name "a rocket" val)))
                         )))))) #|specify the issue if it fails, i.e. if its a number but not a rocket what should you tell the student|#

;; contract
;; Purpose: Determine if the input is an alien
(define (is-alien/c func-name)
  (make-flat-contract
   #:name 'is-alien?
   #:projection (λ (blame)
                  (λ (val)
                    (or (alien? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "an alien" val)))))))))

;; contract
;; Purpose: Determine if the input is an alien or list of alien
(define (is-alien-OR-loa/c func-name)
  (make-flat-contract
   #:name 'is-alienOR-loa?
   #:projection (λ (blame)
                  (λ (val)
                    (or (or ((listof alien?) val)
                            (alien? val))
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "an alien or (listof alien)" val)))))))))


;; contract
;; Purpose: Determine if the input is a list of alien
(define (is-loa/c func-name)
  (make-flat-contract
   #:name 'is-loa?
   #:projection (λ (blame)
                  (λ (val)
                    (or ((listof alien?) val)
                        ((λ ()
                           (current-blame-format format-error-display-list-items-loa)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "a (listof alien)" val)))))))))



;; contract
;; Purpose: Determine if the input is a scene
(define (is-scene/c func-name)
  (make-flat-contract
   #:name 'is-scene?
   #:projection (λ (blame)
                  (λ (val)
                    (or (scene? val)
                        ((λ ()
                           (current-blame-format format-error-for-image-w&h)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "a scene" val)))))))))



;; contract
;; Purpose: Determine if the input is a dir
(define (is-dir/c func-name)
  (make-flat-contract
   #:name 'is-dir?
   #:projection (λ (blame)
                  (λ (val)
                    (or (dir? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "a dir" val)))))))))

;; contract
;; Purpose: Determine if the input is a shot
(define (is-shot/c func-name)
  (make-flat-contract
   #:name 'is-shot?
   #:projection (λ (blame)
                  (λ (val)
                    (or (shot? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "a shot" val)))))))))



;; contract
;; Purpose: Determine if the input is a list of shot
(define (is-los/c func-name)
  (make-flat-contract
   #:name 'is-los?
   #:projection (λ (blame)
                  (λ (val)
                    (or ((listof shot?) val)
                        ((λ ()
                           (current-blame-format format-error-display-list-items-los)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "a (listof shot)" val)
                            ))))))))



;;;; FUNCTION CONTRACTS

(define draw-ci/c (-> (is-img&ci/c "draw-ci") (is-img-x/c "draw-ci") (is-img-y/c "draw-ci") (is-scene/c "draw-ci") (is-result-img/c "draw-ci")))

(define ci?/c (-> (is-img/c "ci?") boolean?))

(define move-rckt-right/c (-> (is-img-x/c "move-rckt-right") (is-img-x/c "move-rckt-right")))

(define move-rckt-left/c (-> (is-img-x/c "move-rckt-left") (is-img-x/c "move-rckt-left")))

(define draw-rocket/c (-> (is-img-x/c "draw-rocket") (is-scene/c "draw-rocket") (is-result-img/c "draw-rocket")))

(define draw-rocket-img/c (-> (is-ci/c "draw-rocket-img") (is-img-x/c "draw-rocket-img") (is-scene/c "draw-rocket-img") (is-result-img/c "draw-rocket-img")))



(define draw-alien/c (-> (is-alien/c "draw-alien") (is-scene/c "draw-alien") (is-result-img/c "draw-alien")))

(define draw-alien-img/c (-> (is-img&ci/c "draw-alien-img") (is-alien/c "draw-alien-img") (is-scene/c "draw-alien-img") (is-result-img/c "draw-alien-img")))

(define move-right-image-x/c (-> (is-img-x/c "move-right-image-x") (is-img-x/c "move-right-image-x")))

(define move-left-image-x/c (-> (is-img-x/c "move-left-image-x") (is-img-x/c "move-left-image-x")))

(define move-down-image-y/c (-> (is-img-y/c "move-down-image-y") (is-img-y/c "move-down-image-y")))

(define new-dir-after-down/c (-> (is-alien-OR-loa/c "new-dir-after-down") (is-dir/c "new-dir-after-down")))

(define new-dir-after-left/c (-> (is-alien-OR-loa/c "new-dir-after-left") (is-dir/c "new-dir-after-left")))

(define new-dir-after-right/c (-> (is-alien-OR-loa/c "new-dir-after-right") (is-dir/c "new-dir-after-right")))

(define alien-at-right-edge?/c (-> (is-alien/c "alien-at-right-edge?") boolean?))

(define alien-at-left-edge?/c (-> (is-alien/c "alien-at-left-edge?") boolean?))

(define alien-reached-earth?/c (-> (is-alien/c "alien-reached-earth?") boolean?))


(define move-up-image-y/c (-> (is-img-y/c "move-up-image-y") (is-img-y/c "move-up-image-y")))

(define draw-shot/c (-> (is-shot/c "draw-shot") (is-scene/c "draw-shot") (is-result-img/c "draw-shot")))

(define draw-shot-img/c (-> (is-img&ci/c "draw-shot-img") (is-shot/c "draw-shot") (is-scene/c "draw-shot") (is-result-img/c "draw-shot")))

;(define make-shot/c (-> (is-shot/c "make-shot") (is-rocket/c "make-shot") (is-shot/c "make-shot")))

(define make-shot/c (-> (is-shot/c "process-shooting") (is-rocket/c "process-shooting") (is-shot/c "process-shooting")))

(define hit?/c (-> (is-shot/c "hit?") (is-alien/c "hit?") boolean?))

(define move-shot-up/c (-> (is-shot/c "move-shot-up") (is-shot/c "move-shot-up")))

(define move-alien-left/c (-> (is-alien/c "move-alien-left") (is-alien/c "move-alien-left")))

(define move-alien-right/c (-> (is-alien/c "move-alien-right") (is-alien/c "move-alien-right")))

(define move-alien-down/c (-> (is-alien/c "move-alien-down") (is-alien/c "move-alien-down")))



(define move-los/c (-> (is-los/c "move-los") (is-los/c "move-los")))

(define remove-shots/c (-> (is-los/c "remove-shots") (is-loa/c "remove-shots") (is-los/c "remove-shots")))

(define move-alien/c (-> (is-alien/c "move-alien") (is-dir/c "move-alien") (is-alien/c "move-alien")))

(define move-loa/c (-> (is-loa/c "move-loa") (is-dir/c "move-loa") (is-loa/c "move-loa")))

(define remove-hit-aliens/c (-> (is-loa/c "remove-hit-aliens") (is-los/c "remove-hit-aliens") (is-loa/c "remove-hit-aliens")))

(define hit-by-any-shot?/c (-> (is-alien/c "hit-by-any-shot?") (is-los/c "hit-by-any-shot?") boolean?))

(define hit-any-alien?/c (-> (is-shot/c "hit-any-alien?") (is-loa/c "hit-any-alien?") boolean?))

(define any-alien-at-right-edge?/c (-> (is-loa/c "any-alien-at-right-edge?") boolean?))

(define any-alien-at-left-edge?/c (-> (is-loa/c "any-alien-at-left-edge?") boolean?))

(define any-alien-reached-earth?/c (-> (is-loa/c "any-alien-reached-earth?") boolean?)) 

(define any-aliens-alive?/c (-> (is-loa/c "any-aliens-alive?") boolean?))

(define draw-los/c (-> (is-los/c "draw-los") (is-scene/c "draw-los") (is-scene/c "draw-los")))

(define draw-los-img/c (-> (is-ci/c "draw-los-img") (is-los/c "draw-losimg") (is-scene/c "draw-los-img") (is-scene/c "draw-los-img")))

(define draw-loa/c (-> (is-loa/c "draw-loa") (is-scene/c "draw-loa") (is-scene/c "draw-loa")))

(define draw-loa-img/c (-> (is-ci/c "draw-loa-img") (is-loa/c "draw-loa-img") (is-scene/c "draw-loa-img") (is-scene/c "draw-loa-img")))








