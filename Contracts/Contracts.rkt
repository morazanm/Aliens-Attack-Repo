#lang racket/base

(require racket/contract
         2htdp/image
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
         is-pix-x/c)


;; formatting functions 
(define (format-error blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~s" message)]
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
      (begin (format "~a: expects ~a as input, given ~a" func-name arg-name "image"))
      (format "~a: expects ~a as input, given" func-name arg-name)))


;; CONTRACTS

;;contract
;;Purpose: Determines if the input is a ci
(define (is-ci/c func-name)
  (make-flat-contract
   #:name 'is-ci?
   #:projection (λ (blame)
                  (λ (val)
                    (or (and (<= (image-width val)  IMAGE-WIDTH)
                             (<= (image-height val) IMAGE-HEIGHT))
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
                            (format "draw-ci should return image, instead returned ~a. please contact developers" val)))))))))



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



(define within-max-chars-hori*img-w-1/c (integer-in 0 (sub1 (* IMAGE-WIDTH MAX-CHARS-HORIZONTAL))))
(define within-max-chars-vert*img-w-1/c (integer-in 0 (sub1 (* IMAGE-HEIGHT MAX-CHARS-VERTICAL))))

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
                             (<= (image-width val)  IMAGE-WIDTH)
                             (<= (image-height val) IMAGE-HEIGHT))
                        ((λ ()
                           (current-blame-format format-error-for-ci)
                           (raise-blame-error
                            blame
                            val
                            (type-arg-formatter func-name "a ci" val)))))))))




;; FUNCTION CONTRACTS


(define draw-ci/c (-> (is-img&ci/c "draw-ci") (is-img-x/c "draw-ci") (is-img-y/c "draw-ci") (is-img/c "draw-ci") is-result-img/c))

(define ci?/c (-> (is-img/c "ci?") boolean?))

(define move-rckt-right/c (-> (is-img-x/c "move-rckt-right") (is-img-x/c "move-rckt-right")))

(define move-rckt-left/c (-> (is-img-x/c "move-rckt-left") (is-img-x/c "move-rckt-left")))

(define draw-rocket/c (-> (is-img-x/c "draw-rocket") (is-img/c "draw-rocket") is-result-img/c))

(define draw-rocket-img/c (-> (is-ci/c "draw-rocket-img") (is-img-x/c "draw-rocket-img") (is-img/c "draw-rocket-img") is-result-img/c))

