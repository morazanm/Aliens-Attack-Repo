#lang racket/base

(require racket/contract
         2htdp/image
         "../Predicates/Image-Predicates.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "../Constants/Image-Constants.rkt"
         "../Drawing/Scene-Drawing-Functions.rkt")


;; formatting functions 
(define (format-error blame value message)
  (cond [(string? value) (format "~a: ~s" message value)]
        [(image? value) (format "~a" message)]
        [else (format "~a: ~a" message value)]))

(define (format-error-results blame value message)
  (cond [(string? value) (format "~s" message)]
        [(image? value) (format "~a" message)]
        [else (format "~a" message)]))


(define (type-arg-formatter arg-name arg-type)
  (if (image? arg-type)
      (begin (format "expects a ~a as input, given ~s" arg-name "image"))
      (format "expects a ~a as input, given" arg-name)))


;; CONTRACTS

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
                            (type-arg-formatter "ci" val)))))))))

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
                            (type-arg-formatter "image" val)))))))))


;; contract
;; purpose: determine if the result is an image
(define is-result-img/c
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
(define is-img-y/c
  (make-flat-contract
   #:name 'is-img-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-vert/c val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter "integer between 0 and (sub1 MAX-CHARS-VERTICAL)" val)))))))))


;; contract
;; purpose: determine if the input is an integer between 0 and (sub1 MAX-CHARS-HORIZONTAL)
(define is-img-x/c
  (make-flat-contract
   #:name 'is-img-x?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-hori/c val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter "integer between 0 and (sub1 MAX-CHARS-HORIZONTAL)" val)))))))))



(define within-max-chars-hori*img-w-1/c (integer-in 0 (sub1 (* IMAGE-WIDTH MAX-CHARS-HORIZONTAL))))
(define within-max-chars-vert*img-w-1/c (integer-in 0 (sub1 (* IMAGE-HEIGHT MAX-CHARS-VERTICAL))))

;; contract
;; purpose: determine if the input is an image-x
(define is-pix-y/c
  (make-flat-contract
   #:name 'is-pix-y?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-vert*img-w-1/c val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter "expecting an integer in [0..(MAX-CHARS-HORIZONTAL * IMAGE-WIDTH)-1]" val)))))))))


;; contract
;; purpose: determine if the input is an image-x
(define is-pix-x/c
  (make-flat-contract
   #:name 'is-pix-x?
   #:projection (λ (blame)
                  (λ (val)
                    (or (within-max-chars-hori*img-w-1/c val)
                        ((λ ()
                           (current-blame-format format-error)
                           (raise-blame-error
                            blame val
                            (type-arg-formatter "expected an integer in [0..(MAX-CHARS-VERTICAL * IMAGE-HEIGHT)-1]" val)))))))))



;; FUNCTION CONTRACTS
(define draw-ci/c (-> is-ci/c is-img-x/c is-img-y/c is-img/c is-result-img/c))




;(define some/c (-> is-result-img/c any/c))

#;(define/contract (belh ix)
    some/c
    (+ (* ix IMAGE-WIDTH) (/ IMAGE-WIDTH 2)))



