#lang racket/base
(require racket/contract
         2htdp/image
         rackunit
         "../../Predicates/Image-Predicates.rkt"
         "../../Predicates/Shot-Predicates.rkt"
         "../../Predicates/Alien-Predicates.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Image-Constants.rkt"
         (only-in "../../Constants/Shot-Constants.rkt" NO-SHOT)
         "../../Drawing/Scene-Drawing-Functions.rkt"
         "../../Drawing/Rocket-Drawing-Functions.rkt"
         "../../Drawing/Alien-Drawing-Functions.rkt"
         "../../Drawing/Shot-Drawing-Functions.rkt"
         "../../ProcessKey/Rocket-Moving-Functions.rkt"
         "../../ProcessKey/Shot-Creating-Functions.rkt"
         "../../Contracts/Contracts.rkt"
         "../../ProcessTick/Tick-Moving-Functions.rkt"
         "../../ProcessTick/New-Direction-Functions.rkt"
         "../../ProcessTick/Shot-Moving-Functions.rkt"
         "../../ProcessTick/Alien-Moving-Functions.rkt"
         (only-in lang/htdp-beginner posn-x posn-y posn? make-posn)
         )



(define/contract (test-func-for-is-ci/c x)
  (-> is-ci/c any/c)
  x)

(check-equal? (test-func-for-is-ci/c (circle 10 'solid 'red)) (circle 10 'solid 'red))
;(check-equal? (test-func-for-is-ci/c (circle 50 'solid 'red)) (circle 50 'solid 'red))
;(check-equal? (test-func-for-is-ci/c (square 40 'solid 'blue)) (square 40 'solid 'blue))
(check-equal? (test-func-for-is-ci/c (square 22 'solid 'blue)) (square 22 'solid 'blue))

(define/contract (test-func-for-is-img/c x)
  (-> (is-img/c "test-func-is-img/x") any/c)
  x)

(check-equal? (test-func-for-is-img/c (circle 10 'solid 'red)) (circle 10 'solid 'red))
(check-equal? (test-func-for-is-img/c (square 22 'solid 'blue)) (square 22 'solid 'blue))
(check-exn exn:fail? (λ () (test-func-for-is-img/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-img/c "owl")))
(check-exn exn:fail? (λ () (test-func-for-is-img/c #false)))
(check-exn exn:fail? (λ () (test-func-for-is-img/c 78)))
        

(define/contract (test-func-for-is-result-img/c x)
  (-> (is-result-img/c "test-func-result-img") any/c)
  x)

(check-equal? (test-func-for-is-result-img/c (circle 5 'solid 'green)) (circle 5 'solid 'green))
(check-equal? (test-func-for-is-result-img/c (square 1 'solid 'yellow)) (square 1 'solid 'yellow))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c "green")))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-result-img/c 33)))
        

(define/contract (test-func-for-is-img-y/c x)
  (-> (is-img-y/c "test-func-for-img-y") any/c)
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
        

(define/contract (test-func-for-is-img-x/c x)
  (-> (is-img-x/c "test-func-img-x") any/c)
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
        
(define/contract (test-func-for-is-pix-y/c x)
  (-> (is-pix-y/c "test-func-pix-y") any/c)
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

(define/contract (test-func-for-is-pix-x/c x)
  (-> (is-pix-x/c "test-func-pix-x") any/c)
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

(check-exn exn:fail? (λ () (draw-ci (circle 10 'solid 'red) 2 6 4)))
(check-exn exn:fail? (λ () (draw-ci (square 22 'solid 'blue) 1 's (empty-scene 30 30))))
(check-exn exn:fail? (λ () (draw-ci (circle 10 'solid 'red) "string" 14 (empty-scene 30 12))))
(check-exn exn:fail? (λ () (draw-ci "eclectus" 22 7 (empty-scene 11 87))))
(check-exn exn:fail? (λ () (draw-ci 'hello "there" 1 'a)))
(check-exn exn:fail? (λ () (draw-ci (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (draw-ci -1)))


(check-equal? (ci? (circle 10 'solid 'red)) #t)
(check-equal? (ci? (circle 50 'solid 'red)) #f)
(check-exn exn:fail? (λ () (ci? "shape")))
(check-equal? (ci? (square 11 'solid 'blue)) #t)
(check-exn exn:fail? (λ () (ci? 'hello)))
(check-exn exn:fail? (λ () (ci? "duck")))
(check-exn exn:fail? (λ () (ci? #true)))
(check-exn exn:fail? (λ () (ci? 22)))

(check-exn exn:fail? (λ () (move-rckt-right (circle 10 'solid 'red))))
(check-exn exn:fail? (λ () (move-rckt-right (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (move-rckt-right 'hello)))
(check-exn exn:fail? (λ () (move-rckt-right "duck")))
(check-exn exn:fail? (λ () (move-rckt-right #true)))
(check-exn exn:fail? (λ () (move-rckt-right 33)))
(check-exn exn:fail? (λ () (move-rckt-right -1)))
(check-equal? (move-rckt-right 19) 19)
(check-equal? (move-rckt-right 18) 19)
(check-equal? (move-rckt-right 10) 11)
(check-equal? (move-rckt-right 14) 15)
(check-equal? (move-rckt-right 6) 7)

(check-exn exn:fail? (λ () (move-rckt-left (circle 10 'solid 'red))))
(check-exn exn:fail? (λ () (move-rckt-left (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (move-rckt-left 'hello)))
(check-exn exn:fail? (λ () (move-rckt-left "duck")))
(check-exn exn:fail? (λ () (move-rckt-left #true)))
(check-exn exn:fail? (λ () (move-rckt-left 22)))
(check-exn exn:fail? (λ () (move-rckt-left -1)))
(check-equal? (move-rckt-left 0) 0)
(check-equal? (move-rckt-left 18) 17)
(check-equal? (move-rckt-left 10) 9)
(check-equal? (move-rckt-left 14) 13)
(check-equal? (move-rckt-left 6) 5)


(check-exn exn:fail? (λ () (draw-rocket (circle 10 'solid 'red) 1)))
(check-exn exn:fail? (λ () (draw-rocket (square 22 'solid 'blue) 67)))
(check-exn exn:fail? (λ () (draw-rocket 'hello "world")))
(check-exn exn:fail? (λ () (draw-rocket "shoebill")))
(check-exn exn:fail? (λ () (draw-rocket #false 21)))
(check-exn exn:fail? (λ () (draw-rocket 22 (empty-scene 20 20))))
;(check-exn exn:fail? (λ () (draw-rocket -1 (empty-scene 123 456))))

(check-exn exn:fail? (λ () (draw-rocket-img (circle 10 'solid 'red) 1 'hi)))
(check-exn exn:fail? (λ () (draw-rocket-img (square 22 'solid 'blue) 67 "sunconure")))
(check-exn exn:fail? (λ () (draw-rocket-img 'hello "world" 12)))
(check-exn exn:fail? (λ () (draw-rocket-img "shoebill" "macaw" "parrolet")))
(check-exn exn:fail? (λ () (draw-rocket-img #false 21 (rectangle 10 15 'outline 'pink))))
(check-exn exn:fail? (λ () (draw-rocket-img 22 (empty-scene 20 20))))
(check-exn exn:fail? (λ () (draw-rocket-img -1 (empty-scene 123 456))))



(define/contract (test-func-for-is-scene/c x)
  (-> (is-scene/c "test-func-is-scene") any/c)
  x)

(check-exn exn:fail? (λ () (test-func-for-is-scene/c (circle 10 'solid 'red))))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c "duck")))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c 22)))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c -1)))
(check-equal? (test-func-for-is-scene/c (empty-scene 600 450)) (empty-scene 600 450))
(check-exn exn:fail? (λ () (test-func-for-is-scene/c (empty-scene 450 600))))
(check-equal? (test-func-for-is-scene/c (empty-scene 600 450 'blue)) (empty-scene 600 450 'blue)) 


(define/contract (test-func-for-is-dir/c x)
  (-> (is-dir/c "test-func-is-dir") any/c)
  x)

(check-exn exn:fail? (λ () (test-func-for-is-dir/c (circle 10 'solid 'red))))
(check-exn exn:fail? (λ () (test-func-for-is-dir/c (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (test-func-for-is-dir/c 'hello)))
(check-exn exn:fail? (λ () (test-func-for-is-dir/c "duck")))
(check-exn exn:fail? (λ () (test-func-for-is-dir/c #true)))
(check-exn exn:fail? (λ () (test-func-for-is-dir/c 22)))
(check-exn exn:fail? (λ () (test-func-for-is-dir/c -1)))
(check-equal? (test-func-for-is-dir/c 'right) 'right)
(check-exn exn:fail? (λ () (test-func-for-is-dir/c (empty-scene 450 600))))
(check-equal? (test-func-for-is-dir/c 'left) 'left) 
(check-equal? (test-func-for-is-dir/c 'down) 'down)





;;draw-alien
(check-exn exn:fail? (λ () (draw-alien (circle 10 'solid 'red) (empty-scene 600 450))))
(check-exn exn:fail? (λ () (draw-alien (square 22 'solid 'blue) (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien 'hello (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien "duck" (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien #true (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien 22 (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien -1 (empty-scene 450 600))))

(check-exn exn:fail? (λ () (draw-alien (empty-scene 600 450) (make-posn 1 2))))


;; draw-alien-img
(check-exn exn:fail? (λ () (draw-alien-img (circle 10 'solid 'red) 1 (empty-scene 600 450))))
(check-exn exn:fail? (λ () (draw-alien-img (square 22 'solid 'blue) (make-posn 1 1) (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien-img 'hello "d" (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien-img 1 "duck" (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien-img #true 's (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-alien-img 22 (empty-scene 450 600) "d")))
(check-exn exn:fail? (λ () (draw-alien-img (make-posn 2 2) (empty-scene 600 600))))

(check-exn exn:fail? (λ () (draw-alien-img (empty-scene 600 450) (make-posn 1 2))))


;; move-right-image-x/c
(check-exn exn:fail? (λ () (move-right-image-x 400)))
(check-exn exn:fail? (λ () (move-right-image-x (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (move-right-image-x 'hello )))
(check-exn exn:fail? (λ () (move-right-image-x "1")))
(check-exn exn:fail? (λ () (move-right-image-x #true)))
(check-exn exn:fail? (λ () (move-right-image-x 22)))
(check-exn exn:fail? (λ () (move-right-image-x 19)))
(check-equal? (move-right-image-x 2) 3)
(check-exn exn:fail? (λ () (move-right-image-x -1)))
(check-equal? (move-right-image-x 10) 11) 
(check-equal? (move-right-image-x 5) 6)
(check-equal? (move-right-image-x 18) 19)





;; move-left-image-x/c
(check-exn exn:fail? (λ () (move-left-image-x 400)))
(check-exn exn:fail? (λ () (move-left-image-x (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (move-left-image-x 'hello)))
(check-exn exn:fail? (λ () (move-left-image-x 1 "duck")))
(check-exn exn:fail? (λ () (move-left-image-x #true 's (empty-scene 450 600))))
(check-exn exn:fail? (λ () (move-left-image-x 22)))
(check-exn exn:fail? (λ () (move-right-image-x 19)))
(check-equal? (move-left-image-x 2) 1)
(check-exn exn:fail? (λ () (move-right-image-x -1)))
(check-equal? (move-left-image-x 10) 9) 
(check-equal? (move-left-image-x 5) 4)


;; move-down-image-y/c
(check-exn exn:fail? (λ () (move-down-image-y 400)))
(check-exn exn:fail? (λ () (move-down-image-y (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (move-down-image-y 'hello)))
(check-exn exn:fail? (λ () (move-down-image-y 1 "duck")))
(check-exn exn:fail? (λ () (move-down-image-y #true)))
(check-exn exn:fail? (λ () (move-down-image-y 22)))
(check-exn exn:fail? (λ () (move-down-image-y 19)))
(check-equal? (move-down-image-y 2) 3)
(check-exn exn:fail? (λ () (move-down-image-y -1)))
(check-equal? (move-down-image-y 10) 11) 
(check-equal? (move-down-image-y 5) 6)



;; move-up-image-y/c
(check-exn exn:fail? (λ () (move-up-image-y 400)))
(check-exn exn:fail? (λ () (move-up-image-y (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (move-up-image-y 'hello)))
(check-exn exn:fail? (λ () (move-up-image-y 1 "duck")))
(check-exn exn:fail? (λ () (move-up-image-y #true)))
(check-exn exn:fail? (λ () (move-up-image-y 22)))
(check-exn exn:fail? (λ () (move-up-image-y 19)))
(check-equal? (move-up-image-y 2) 1)
(check-exn exn:fail? (λ () (move-up-image-y -1)))
(check-equal? (move-up-image-y 10) 9) 
(check-equal? (move-up-image-y 5) 4)


;; new-dir-after-down/c
(check-exn exn:fail? (λ () (new-dir-after-down (make-posn 2 200))))
(check-exn exn:fail? (λ () (new-dir-after-down (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (new-dir-after-down 'hello)))
(check-exn exn:fail? (λ () (new-dir-after-down 1 "duck")))
(check-exn exn:fail? (λ () (new-dir-after-down #true)))
(check-exn exn:fail? (λ () (new-dir-after-down 22)))
(check-exn exn:fail? (λ () (new-dir-after-down 19)))
(check-equal? (new-dir-after-down (make-posn 19 2)) 'left)
(check-equal? (new-dir-after-down (make-posn 0 2)) 'right)




;; new-dir-after-left/c
(check-exn exn:fail? (λ () (new-dir-after-left (make-posn 2 200))))
(check-exn exn:fail? (λ () (new-dir-after-left (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (new-dir-after-left 'hello)))
(check-exn exn:fail? (λ () (new-dir-after-left 1 "duck")))
(check-exn exn:fail? (λ () (new-dir-after-left #true)))
(check-exn exn:fail? (λ () (new-dir-after-left 22)))
(check-exn exn:fail? (λ () (new-dir-after-left 19)))
(check-equal? (new-dir-after-left (make-posn 19 2)) 'left)
(check-equal? (new-dir-after-left (make-posn 0 2)) 'down)


;; new-dir-after-right/c
(check-exn exn:fail? (λ () (new-dir-after-right (make-posn 2 200))))
(check-exn exn:fail? (λ () (new-dir-after-right (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (new-dir-after-right 'hello)))
(check-exn exn:fail? (λ () (new-dir-after-right 1 "duck")))
(check-exn exn:fail? (λ () (new-dir-after-right #true)))
(check-exn exn:fail? (λ () (new-dir-after-right 22)))
(check-exn exn:fail? (λ () (new-dir-after-right 19)))
(check-equal? (new-dir-after-right (make-posn 19 2)) 'down)
(check-equal? (new-dir-after-right (make-posn 0 2)) 'right)


;; alien-at-right-edge?/c
(check-exn exn:fail? (λ () (alien-at-right-edge? (make-posn 2 200))))
(check-exn exn:fail? (λ () (alien-at-right-edge? (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (alien-at-right-edge? 'hello)))
(check-exn exn:fail? (λ () (alien-at-right-edge? 1 "duck")))
(check-exn exn:fail? (λ () (alien-at-right-edge? #true)))
(check-exn exn:fail? (λ () (alien-at-right-edge? 22)))
(check-exn exn:fail? (λ () (alien-at-right-edge? 19)))
(check-equal? (alien-at-right-edge? (make-posn 19 2)) #true)
(check-equal? (alien-at-right-edge? (make-posn 0 2)) #false)


;; alien-at-left-edge?/c
(check-exn exn:fail? (λ () (alien-at-left-edge? (make-posn 2 200))))
(check-exn exn:fail? (λ () (alien-at-left-edge? (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (alien-at-left-edge? 'hello)))
(check-exn exn:fail? (λ () (alien-at-left-edge? 1 "duck")))
(check-exn exn:fail? (λ () (alien-at-left-edge? #true)))
(check-exn exn:fail? (λ () (alien-at-left-edge? 22)))
(check-exn exn:fail? (λ () (alien-at-left-edge? 19)))
(check-equal? (alien-at-left-edge? (make-posn 19 2)) #false)
(check-equal? (alien-at-left-edge? (make-posn 0 2)) #true)


;; alien-reached-earth?/c
(check-exn exn:fail? (λ () (alien-reached-earth? (make-posn 2 200))))
(check-exn exn:fail? (λ () (alien-reached-earth? (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (alien-reached-earth? 'hello)))
(check-exn exn:fail? (λ () (alien-reached-earth? 1 "duck")))
(check-exn exn:fail? (λ () (alien-reached-earth? #true)))
(check-exn exn:fail? (λ () (alien-reached-earth? 22)))
(check-exn exn:fail? (λ () (alien-reached-earth? 19)))
(check-equal? (alien-reached-earth? (make-posn 19 14)) #true)
(check-equal? (alien-reached-earth? (make-posn 0 2)) #false)


;;draw-shot/c
(check-exn exn:fail? (λ () (draw-shot (circle 10 'solid 'red) (empty-scene 600 450))))
(check-exn exn:fail? (λ () (draw-shot (square 22 'solid 'blue) (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot 'hello (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot "duck" (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot #true (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot 22 (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot -1 (empty-scene 450 600))))

(check-exn exn:fail? (λ () (draw-shot (empty-scene 600 450) (make-posn 1 2))))


;;draw-shot-img/c

(check-exn exn:fail? (λ () (draw-shot-img (circle 10 'solid 'red) (empty-scene 600 450))))
(check-exn exn:fail? (λ () (draw-shot-img (square 22 'solid 'blue) (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot-img 'hello (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot-img "duck" (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot-img #true (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot-img 22 (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-shot-img -1 (empty-scene 450 600))))

(check-exn exn:fail? (λ () (draw-shot-img (empty-scene 600 450) (make-posn 1 2))))

;;make-shot/c
(check-exn exn:fail? (λ () (process-shooting 400)))
(check-exn exn:fail? (λ () (process-shooting (square 22 'solid 'blue))))
(check-exn exn:fail? (λ () (process-shooting 'hello)))
(check-exn exn:fail? (λ () (process-shooting "duck")))
(check-exn exn:fail? (λ () (process-shooting #true 's (empty-scene 450 600))))
(check-exn exn:fail? (λ () (process-shooting NO-SHOT 22)))
(check-equal? (process-shooting 10) (make-posn 10 14))
(check-exn exn:fail? (λ () (process-shooting -1)))
(check-equal? (process-shooting 2) (make-posn 2 14)) 
(check-equal? (process-shooting 5) (make-posn 5 14))


;; move-los
(check-exn exn:fail? (λ () (move-los #t)))
(check-exn exn:fail? (λ () (move-los 'no-shot)))
(check-exn exn:fail? (λ () (move-los "s")))
(check-exn exn:fail? (λ () (move-los (make-posn 1 1))))
(check-exn exn:fail? (λ () (move-los 1)))
(check-exn exn:fail? (λ () (move-los (list 1 2))))
(check-equal? (move-los (list (make-posn 5 13) (make-posn 2 1 ))) (list (make-posn 5 12) (make-posn 2 0 )))
(check-equal? (move-los '()) '())
(check-equal? (move-los (list (make-posn 9 9) (make-posn 1 7) (make-posn 4 9) (make-posn 3 2 )))
              (list (make-posn 9 8) (make-posn 1 6) (make-posn 4 8) (make-posn 3 1 )))


;; remove-shots
(check-exn exn:fail? (λ () (remove-shots (make-posn 1 2) (make-posn 1 2))))
(check-exn exn:fail? (λ () (remove-shots 'no-shot (list  1 2))))
(check-exn exn:fail? (λ () (remove-shots "s" (list  (make-posn 2 4)))))
(check-exn exn:fail? (λ () (remove-shots (list (make-posn 8 3) (make-posn 4 2))  (list  1 2))))
(check-equal? (remove-shots (list (make-posn 4 2) (make-posn 3 6)) (list (make-posn 4 2))) (list (make-posn 3 6)))
(check-equal? (remove-shots (list (make-posn 5 2) (make-posn 3 6)) (list (make-posn 1 1) (make-posn 4 2))) (list (make-posn 5 2) (make-posn 3 6)))


;; move-alien
(check-exn exn:fail? (λ () (move-alien (make-posn 1 200) 'right)))
(check-exn exn:fail? (λ () (move-alien 'no-shot (list  1 2))))
(check-exn exn:fail? (λ () (move-alien "s" 'left)))
(check-exn exn:fail? (λ () (move-alien (list (make-posn 8 3) (make-posn 4 2))  'down)))
(check-equal? (move-alien (make-posn 4 2) 'right) (make-posn 5 2))
(check-equal? (move-alien (make-posn 5 2) 'left) (make-posn 4 2))
(check-equal? (move-alien (make-posn 5 2) 'down) (make-posn 5 3))

;; move-loa
(check-exn exn:fail? (λ () (move-loa (list (make-posn 1 2) (make-posn 1 200)) 'right)))
(check-exn exn:fail? (λ () (move-loa (list (make-posn 1 2) 1) 'right)))
(check-exn exn:fail? (λ () (move-loa 'no-shot (list  1 2))))
(check-exn exn:fail? (λ () (move-loa "s" 'left)))
(check-exn exn:fail? (λ () (move-loa (list (list (make-posn 8 3) (make-posn 4 2)))  'down)))
(check-equal? (move-loa (list (make-posn 4 2) (make-posn 2 5)) 'right) (list (make-posn 5 2) (make-posn 3 5)))
(check-equal? (move-loa '() 'left) '())
(check-equal? (move-loa (list (make-posn 9 8) (make-posn 5 2)) 'down) (list (make-posn 9 9) (make-posn 5 3)))


;; remove-hit-aliens
(check-exn exn:fail? (λ () (remove-hit-aliens (make-posn 1 2) (make-posn 1 2))))
(check-exn exn:fail? (λ () (remove-hit-aliens 'no-shot (list  1 2))))
(check-exn exn:fail? (λ () (remove-hit-aliens "s" (list  (make-posn 2 4)))))
(check-exn exn:fail? (λ () (remove-hit-aliens (list (make-posn 8 3) (make-posn 4 2))  (list  1 2))))
(check-equal? (remove-hit-aliens (list (make-posn 4 2) (make-posn 3 6)) (list (make-posn 4 2))) (list (make-posn 3 6)))
(check-equal? (remove-hit-aliens (list (make-posn 5 2) (make-posn 3 6)) (list (make-posn 1 1) (make-posn 4 2)))
              (list (make-posn 5 2) (make-posn 3 6)))


;; hit-by-any-shot?
(check-exn exn:fail? (λ () (hit-by-any-shot? (make-posn 1 2) (make-posn 1 2))))
(check-exn exn:fail? (λ () (hit-by-any-shot? 'no-shot (list  1 2))))
(check-exn exn:fail? (λ () (hit-by-any-shot? "s" (list  (make-posn 2 4)))))
(check-exn exn:fail? (λ () (hit-by-any-shot? (list (make-posn 8 3) (make-posn 4 2))  (list  1 2))))
(check-equal? (hit-by-any-shot? (make-posn 4 2) (list (make-posn 4 2))) #t)
(check-equal? (hit-by-any-shot? (make-posn 5 2) (list (make-posn 1 1) (make-posn 4 2))) #f)



;; hit-any-alien?
(check-exn exn:fail? (λ () (hit-any-alien? (make-posn 1 2) (make-posn 1 2))))
(check-exn exn:fail? (λ () (hit-any-alien? 'no-shot (list  1 2))))
(check-exn exn:fail? (λ () (hit-any-alien? "s" (list  (make-posn 2 4)))))
(check-exn exn:fail? (λ () (hit-any-alien? (list (make-posn 8 3) (make-posn 4 2))  (list  1 2))))
(check-equal? (hit-any-alien? (make-posn 4 2) (list (make-posn 4 2))) #t)
(check-equal? (hit-any-alien? (make-posn 5 2) (list (make-posn 1 1) (make-posn 4 2))) #f)



;; any-alien-at-right-edge?
(check-exn exn:fail? (λ () (any-alien-at-right-edge? (list (make-posn 1 2) (make-posn 1 200)))))
(check-exn exn:fail? (λ () (any-alien-at-right-edge? (list (make-posn 1 2) 1))))
(check-exn exn:fail? (λ () (any-alien-at-right-edge? 'no-shot)))
(check-exn exn:fail? (λ () (any-alien-at-right-edge? "s")))
(check-exn exn:fail? (λ () (any-alien-at-right-edge? (list (list (make-posn 8 3) (make-posn 4 2))))))
(check-equal? (any-alien-at-right-edge? (list (make-posn 19 2) (make-posn 2 5))) #t)
(check-equal? (any-alien-at-right-edge? '()) #f)
(check-equal? (any-alien-at-right-edge? (list (make-posn 9 8) (make-posn 5 2))) #f)

;; any-alien-at-left-edge?
(check-exn exn:fail? (λ () (any-alien-at-left-edge? (list (make-posn 1 2) (make-posn 1 200)))))
(check-exn exn:fail? (λ () (any-alien-at-left-edge? (list (make-posn 1 2) 1))))
(check-exn exn:fail? (λ () (any-alien-at-left-edge? 'no-shot)))
(check-exn exn:fail? (λ () (any-alien-at-left-edge? "s")))
(check-exn exn:fail? (λ () (any-alien-at-left-edge? (list (list (make-posn 8 3) (make-posn 4 2))))))
(check-equal? (any-alien-at-left-edge? (list (make-posn 0 2) (make-posn 2 5))) #t)
(check-equal? (any-alien-at-left-edge? '()) #f)
(check-equal? (any-alien-at-left-edge? (list (make-posn 9 8) (make-posn 5 2))) #f)



;; any-alien-reached-earth?
(check-exn exn:fail? (λ () (any-alien-reached-earth? (list (make-posn 1 2) (make-posn 1 200)))))
(check-exn exn:fail? (λ () (any-alien-reached-earth? (list (make-posn 1 2) 1))))
(check-exn exn:fail? (λ () (any-alien-reached-earth? 'no-shot)))
(check-exn exn:fail? (λ () (any-alien-reached-earth? "s")))
(check-exn exn:fail? (λ () (any-alien-reached-earth? (list (list (make-posn 8 3) (make-posn 4 2))))))
(check-equal? (any-alien-reached-earth? (list (make-posn 0 14) (make-posn 2 5))) #t)
(check-equal? (any-alien-reached-earth? '()) #f)
(check-equal? (any-alien-reached-earth? (list (make-posn 9 8) (make-posn 5 2))) #f)

;;any-aliens-alive?
(check-exn exn:fail? (λ () (any-aliens-alive? (list (make-posn 1 2) (make-posn 1 200)))))
(check-exn exn:fail? (λ () (any-aliens-alive? (list (make-posn 1 2) 1))))
(check-exn exn:fail? (λ () (any-aliens-alive? 'no-shot)))
(check-exn exn:fail? (λ () (any-aliens-alive? "s")))
(check-exn exn:fail? (λ () (any-aliens-alive? (list (list (make-posn 8 3) (make-posn 4 2))))))
(check-equal? (any-aliens-alive? '()) #f)
(check-equal? (any-aliens-alive? (list (make-posn 9 8) (make-posn 5 2))) #t)

;;draw-los
(check-exn exn:fail? (λ () (draw-los (circle 10 'solid 'red) (empty-scene 600 450))))
(check-exn exn:fail? (λ () (draw-los (square 22 'solid 'blue) (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-los 'hello (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-los "duck" (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-los #true (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-los 22 (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-los -1 (empty-scene 450 600))))
(check-exn exn:fail? (λ () (draw-los (empty-scene 600 450) (list (make-posn 1 2)))))
