#lang racket/base

(require racket/contract
         2htdp/image
         (only-in lang/htdp-beginner posn-x posn-y posn?)
         rackunit
         ;"../Predicates/Image-Predicates.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "../Constants/Image-Constants.rkt"
         ;"../Drawing/Scene-Drawing-Functions.rkt"
         ;"../Drawing/Rocket-Drawing-Functions.rkt"
         ;"../ProcessKey/Rocket-Moving-Functions.rkt"
         )

(provide draw-ci/c
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
         alien-at-right-edge/c
         alien-at-left-edge/c
         alien-reached-earth/c

         is-alien/c
         is-scene/c
         is-dir/c)


;; formatting functions 
(define (format-error blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a" message)]
        [else (format "~a: ~a" message value)]))

(define (format-error-for-ci blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a of width ~a and height ~a" message (image-width value) (image-height value))]
        [else (format "~a: ~a" message value)]))

(define (format-error-results blame value message)
  (cond [(string? value) (format "~s" message)]
        [(image? value) (format "~a" message)]
        [else (format "~a" message)]))


(define (type-arg-formatter func-name arg-name arg-type)
  (if (image? arg-type)
      (format "~a: expects ~a as input, given image" func-name arg-name)
      (format "~a: expects ~a as input, given" func-name arg-name)))


;; CONTRACTS

;;contract
;;Purpose: Determines if the input is a ci
(define (is-ci/c func-name)
  (make-flat-contract
   #:name 'is-ci?
   #:projection (λ (blame)
                  (λ (val)
                    (or (and (<= (image-width val)  MAX-CI-WIDTH)
                             (<= (image-height val) MAX-CI-HEIGHT))
                        ((λ ()
                           (current-blame-format format-error-for-ci)
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



(define within-max-chars-hori/c (integer-in 0 (sub1 MAX-CHARS-HORIZONTAL)))
(define within-max-chars-vert/c (integer-in 0 (sub1 MAX-CHARS-VERTICAL)))

;; contract
;; purpose: determine if the input is an integer between 0 and (sub1 MAX-CHARS-VERTICAL)
(define (is-img-y/c func-name)
  (make-flat-contract
   #:name 'is-img-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-vert/c val)
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
                    (or (within-max-chars-hori/c val)
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
                             (<= (image-width val)  MAX-CI-WIDTH)
                             (<= (image-height val) MAX-CI-HEIGHT))
                        ((λ ()
                           (current-blame-format format-error-for-ci)
                           (raise-blame-error
                            blame
                            val
                            (type-arg-formatter func-name "a ci" val)))))))))


;; contract
;; Purpose: Determine if the input is an alien
(define (is-alien/c func-name)
  (make-flat-contract
   #:name 'is-alien?
   #:projection (λ (blame)
                  (λ (val)
                    (or (and (posn? val)
                             (within-max-chars-hori/c (posn-x val))
                             (within-max-chars-vert/c (posn-y val)))
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "an alien" val)))))))))


;; contract
;; Purpose: Determine if the input is a scene
(define (is-scene/c func-name)
  (make-flat-contract
   #:name 'is-scene?
   #:projection (λ (blame)
                  (λ (val)
                    (or (and (image? val)
                             (= (* MAX-CHARS-HORIZONTAL MAX-CI-WIDTH) (image-width val))
                             (= (* MAX-CHARS-VERTICAL MAX-CI-HEIGHT) (image-height val)))
                        ((λ ()
                           (current-blame-format format-error)
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
                    (or (or (eq? 'right val)
                            (eq? 'left val)
                            (eq? 'down val))
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter func-name "a dir" val)))))))))



;;;; FUNCTION CONTRACTS

(define draw-ci/c (-> (is-img&ci/c "draw-ci") (is-img-x/c "draw-ci") (is-img-y/c "draw-ci") (is-scene/c "draw-ci") (is-result-img/c "draw-ci")))

(define ci?/c (-> (is-img/c "ci?") boolean?))

(define move-rckt-right/c (-> (is-img-x/c "move-rckt-right") (is-img-x/c "move-rckt-right")))

(define move-rckt-left/c (-> (is-img-x/c "move-rckt-left") (is-img-x/c "move-rckt-left")))

(define draw-rocket/c (-> (is-img-x/c "draw-rocket") (is-scene/c "draw-rocket") (is-result-img/c "draw-rocket")))

(define draw-rocket-img/c (-> (is-ci/c "draw-rocket-img") (is-img-x/c "draw-rocket-img") (is-scene/c "draw-rocket-img") (is-result-img/c "draw-rocket-img")))



(define draw-alien/c (-> (is-alien/c "draw-alien") (is-result-img/c "draw-alien")))

(define draw-alien-img/c (-> (is-alien/c "draw-alien") (is-scene/c "draw-alien") (is-result-img/c "draw-alien")))

(define move-right-image-x/c (-> (is-img-x/c "move-right-image-x") (is-img-x/c "move-right-image-x")))

(define move-left-image-x/c (-> (is-img-x/c "move-left-image-x") (is-img-x/c "move-left-image-x")))

(define move-down-image-y/c (-> (is-img-y/c "move-down-image-y") (is-img-y/c "move-down-image-y")))

(define new-dir-after-down/c (-> (is-alien/c "new-dir-after-down") (is-dir/c "new-dir-after-down")))

(define new-dir-after-left/c (-> (is-alien/c "new-dir-after-left") (is-dir/c "new-dir-after-left")))

(define new-dir-after-right/c (-> (is-alien/c "new-dir-after-right") (is-dir/c "new-dir-after-right")))

(define alien-at-right-edge/c (-> (is-alien/c "alien-at-right-edge?") boolean?))

(define alien-at-left-edge/c (-> (is-alien/c "alien-at-left-edge?") boolean?))

(define alien-reached-earth/c (-> (is-alien/c "alien-reached-earth?") boolean?))
 