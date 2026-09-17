#lang racket/base

(require racket/contract
         2htdp/image
         "../Predicates/Image-Predicates.rkt"
         "../Constants/E-Scene-Constants.rkt")

(define IMAGE-WIDTH 30)
(define IMAGE-HEIGHT 30)

(define (format-error blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a" message)]
        [else (format "~a: ~a" message value)]))

;;contract
;;Purpose: Determines if the input is a ci
(define is-ci/c
  (make-flat-contract
   #:name 'is-ci?
   #:projection (λ (blame)
                  (λ (val)
                    (or (ci? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame
                            val
                            "function expects a ci as input, given ~a"
                            "image"))))))))

;; contract
;; Purpose: Determine if the input is an image
(define is-img/c
  (make-flat-contract
   #:name 'is-img?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            "expects an image as input, given"))))))))

#|
 An image-x is an integer in [0..(sub1 MAX-CHARS-HORIZONTAL)]

    A image-y is an integer in [0..(sub1 MAX-CHARS-VERTICAL)]

    A scene is a (MAX-CHARS-HORIZONTAL * IMAGE-WIDTH) x (MAX-CHARS-VERTICAL * IMAGE-HEIGHT) image

    A pixel-x coordinate (pix-x-coord) is an integer in
    [0..(MAX-CHARS-HORIZONTAL * IMAGE-WIDTH)-1]

    A pixel-y coordinate (pix-y-coord) is an integer in
    [0..(MAX-CHARS-VERTICAL * IMAGE-HEIGHT)-1]
|#


;; purpose: determine if the input is an image-x 
(define (image-x? val)
  (and (integer? val)
       (positive? val)
       (<= 0 val (sub1 MAX-CHARS-HORIZONTAL))))

;; purpose: determine if the input is an image-y
(define (image-y? val)
  (and (integer? val)
       (positive? val)
       (<= 0 val (sub1 MAX-CHARS-VERTICAL))))

;; purpose: determine if the input is an pix-y
(define (pixel-y? val)
  (and (integer? val)
       (positive? val)
       (<= 0 val (sub1 (* IMAGE-HEIGHT MAX-CHARS-VERTICAL)))))

;; purpose: determine if the input is an pix-x
(define (pixel-x? val)
  (and (integer? val)
       (positive? val)
       (<= 0 val (sub1 (* IMAGE-HEIGHT MAX-CHARS-HORIZONTAL)))))





;; contract
;; purpose: determine if the input is an image-x
(define is-img-x/c
  (make-flat-contract
   #:name 'is-img-x?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image-x? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            "expects an image-x as input, given"
                            "image"))))))))

;; contract
;; purpose: determine if the input is an image-x
(define is-img-y/c
  (make-flat-contract
   #:name 'is-img-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (image-y? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            "expects an image-y as input, given"
                            "image"))))))))

;; contract
;; purpose: determine if the input is an image-x
(define is-pix-y/c
  (make-flat-contract
   #:name 'is-pix-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (pixel-y? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            "expects an pixel-y as input, given"
                            "image"))))))))


;; contract
;; purpose: determine if the input is an image-x
(define is-pix-x/c
  (make-flat-contract
   #:name 'is-pix-x?
   #:projection (λ (blame)
                  (λ (val)
                    (or (pixel-x? val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            "expects an pixel-x as input, given"
                            "image"))))))))




(define image-x->pix-x/c (-> is-img-x/c piz-x/c))
(define image-y->pix-y/c (-> is-img-y/c piz-y/c))

(define draw-ci/c (-> is-ci/c is-img-x/c is-img-y/c is-img/c))



;(define some/c (-> is-ci/c boolean?))

#;(define/contract (belh x)
  some/c
  (> 0 9))


