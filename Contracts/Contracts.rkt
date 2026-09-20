#lang racket/base

(require racket/contract
         2htdp/image
         rackunit
         "../Predicates/Image-Predicates.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "../Constants/Image-Constants.rkt"
         "../Drawing/Scene-Drawing-Functions.rkt"
         "../Drawing/Rocket-Drawing-Functions.rkt")


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


(define/contract (test-func-for-is-ci/c x)
  (-> is-ci/c any/c)
  x)

(check-equal? (test-func-for-is-ci/c (circle 10 'solid 'red)) (circle 10 'solid 'red))
(check-exn exn:fail? (λ () (test-func-for-is-ci/c (circle 50 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-ci/c (square 40 'solid 'blue))))
(check-equal? (test-func-for-is-ci/c (square 22 'solid 'blue)) (square 22 'solid 'blue))
(check-exn exn:fail? (λ () (test-func-for-is-ci/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-ci/c "duck")))
(check-exn exn:fail? (λ () (test-func-for-is-ci/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-ci/c 22)))
              

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


(define/contract (test-func-for-is-img/c x)
  (-> is-img/c any/c)
  x)

(check-equal? (test-func-for-is-img/c (circle 10 'solid 'red)) (circle 10 'solid 'red))
(check-equal? (test-func-for-is-img/c (square 22 'solid 'blue)) (square 22 'solid 'blue))
(check-exn exn:fail? (λ () (test-func-for-is-img/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-img/c "owl")))
(check-exn exn:fail? (λ () (test-func-for-is-img/c #false)))
(check-exn exn:fail? (λ () (test-func-for-is-img/c 78)))
        


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

(define/contract (test-func-for-is-result-img/c x)
  (-> is-result-img/c any/c)
  x)

(check-equal? (test-func-for-is-result-img/c (circle 5 'solid 'green)) (circle 5 'solid 'green))
(check-equal? (test-func-for-is-result-img/c (square 1 'solid 'yellow)) (square 1 'solid 'yellow))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c "green")))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c 33)))
        




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

(define/contract (test-func-for-is-img-y/c x)
  (-> is-img-y/c any/c)
  x)

(check-exn exn:fail? (λ () (test-func-for-is-img-y/c (circle 88 'solid 'red))))
(check-exn exn:fail? (λ () (test-func-for-is-img-y/c (square 36 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-img-y/c 'hola)))
(check-exn exn:fail? (λ () (test-func-for-is-img-y/c "key")))
(check-exn exn:fail? (λ () (test-func-for-is-img-y/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-img-y/c 78)))
(check-exn exn:fail? (λ () (test-func-for-is-img-y/c -1)))
(check-equal? (test-func-for-is-img-y/c 10) 10)
(check-equal? (test-func-for-is-img-y/c 14) 14)
(check-equal? (test-func-for-is-img-y/c 6) 6)
        



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

(define/contract (test-func-for-is-img-x/c x)
  (-> is-img-x/c any/c)
  x)

(check-exn exn:fail? (λ () (test-func-for-is-img-x/c (circle 10 'solid 'red))))
(check-exn exn:fail? (λ () (test-func-for-is-img-x/c (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-img-x/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-img-x/c "duck")))
(check-exn exn:fail? (λ () (test-func-for-is-img-x/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-img-x/c 22)))
(check-exn exn:fail? (λ () (test-func-for-is-img-x/c -1)))
(check-equal? (test-func-for-is-img-x/c 19) 19)
(check-equal? (test-func-for-is-img-x/c 10) 10)
(check-equal? (test-func-for-is-img-x/c 14) 14)
(check-equal? (test-func-for-is-img-x/c 6) 6)
        


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
                            (type-arg-formatter "expecting an integer in [0..(MAX-CHARS-VERTICAL * IMAGE-WIDTH)-1]" val)))))))))

(define/contract (test-func-for-is-pix-y/c x)
  (-> is-pix-y/c any/c)
  x)

(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c (circle 257 'solid 'red))))
(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c (square 84 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c "penguin")))
(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c #false)))
(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c 450)))
(check-exn exn:fail? (λ () (test-func-for-is-pix-y/c -1)))
(check-equal? (test-func-for-is-pix-y/c 449) 449)
(check-equal? (test-func-for-is-pix-y/c 19) 19)
(check-equal? (test-func-for-is-pix-y/c 10) 10)
(check-equal? (test-func-for-is-pix-y/c 14) 14)
(check-equal? (test-func-for-is-pix-y/c 6) 6)

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
                            (type-arg-formatter "expected an integer in [0..(MAX-CHARS-HORIZONTAL * IMAGE-HEIGHT)-1]" val)))))))))


(define/contract (test-func-for-is-pix-x/c x)
  (-> is-pix-x/c any/c)
  x)

(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c (circle 10 'solid 'red))))
(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c "truck")))
(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c 600)))
(check-exn exn:fail? (λ () (test-func-for-is-pix-x/c -1)))
(check-equal? (test-func-for-is-pix-x/c 599) 599)
(check-equal? (test-func-for-is-pix-x/c 19) 19)
(check-equal? (test-func-for-is-pix-x/c 10) 10)
(check-equal? (test-func-for-is-pix-x/c 14) 14)
(check-equal? (test-func-for-is-pix-x/c 6) 6)



;; FUNCTION CONTRACTS


(define draw-ci/c (-> is-ci/c is-img-x/c is-img-y/c is-img/c is-result-img/c))
(define ci?/c (-> is-ci/c boolean?))
(define move-rckt-right/c (-> is-img-x/c is-img-x/c))
(define move-rckt-left/c (-> is-img-x/c is-img-x/c))
(define draw-rocket/c (-> is-img-x/c is-img/c is-result-img/c))
(define draw-rocket-img/c (-> is-ci/c is-img-x/c is-img/c is-result-img/c))



;(define some/c (-> is-result-img/c any/c))

#;(define/contract (belh ix)
    some/c
    (+ (* ix IMAGE-WIDTH) (/ IMAGE-WIDTH 2)))



