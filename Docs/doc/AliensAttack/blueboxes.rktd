1150
((3) 0 () 1 ((q lib "APS-Aliens-Attack/main.rkt")) () (h ! (equal) ((c form c (c (? . 0) q ROCKET-IMG2)) q (179 . 2)) ((c def c (c (? . 0) q ci?)) q (889 . 3)) ((c def c (c (? . 0) q move-rckt-right)) q (738 . 3)) ((c form c (c (? . 0) q IMAGE-HEIGHT)) q (19 . 2)) ((c form c (c (? . 0) q ci)) q (198 . 2)) ((c def c (c (? . 0) q draw-rocket-img)) q (530 . 7)) ((c form c (c (? . 0) q rocket)) q (251 . 2)) ((c form c (c (? . 0) q key)) q (265 . 2)) ((c def c (c (? . 0) q move-rckt-left)) q (814 . 3)) ((c form c (c (? . 0) q IMAGE-WIDTH)) q (0 . 2)) ((c form c (c (? . 0) q ROCKET-IMG)) q (161 . 2)) ((c form c (c (? . 0) q SHOT-IMG2)) q (144 . 2)) ((c form c (c (? . 0) q ALIEN-IMG)) q (93 . 2)) ((c form c (c (? . 0) q image-x)) q (208 . 2)) ((c def c (c (? . 0) q draw-rocket)) q (427 . 4)) ((c form c (c (? . 0) q MAX-CHARS-HORIZONTAL)) q (39 . 2)) ((c form c (c (? . 0) q SHOT-IMG)) q (128 . 2)) ((c form c (c (? . 0) q ALIEN-IMG2)) q (110 . 2)) ((c def c (c (? . 0) q draw-ci)) q (276 . 6)) ((c form c (c (? . 0) q image-y)) q (223 . 2)) ((c form c (c (? . 0) q MAX-CHARS-VERTICAL)) q (67 . 2)) ((c form c (c (? . 0) q scene)) q (238 . 2))))
syntax
IMAGE-WIDTH
syntax
IMAGE-HEIGHT
syntax
MAX-CHARS-HORIZONTAL
syntax
MAX-CHARS-VERTICAL
syntax
ALIEN-IMG
syntax
ALIEN-IMG2
syntax
SHOT-IMG
syntax
SHOT-IMG2
syntax
ROCKET-IMG
syntax
ROCKET-IMG2
syntax
ci
syntax
image-x
syntax
image-y
syntax
scene
syntax
rocket
syntax
key
procedure
(draw-ci ci an-img-x an-img-y scene) -> scene?
  ci : ci?
  an-img-x : image-x?
  an-img-y : image-y?
  scene : scene?
procedure
(draw-rocket a-rocket a-scene) -> scene?
  a-rocket : rocket?
  a-scene : scene?
procedure
(draw-rocket-img a-rocket-img     
                 a-rocket         
                 a-scene)     -> scene?
  a-rocket-img : ci?
  a-rocket : rocket?
  a-scene : scene?
procedure
(move-rckt-right a-rocket) -> rocket?
  a-rocket : rocket?
procedure
(move-rckt-left a-rocket) -> rocket?
  a-rocket : rocket?
procedure
(ci? ci) -> boolean?
  ci : image?
