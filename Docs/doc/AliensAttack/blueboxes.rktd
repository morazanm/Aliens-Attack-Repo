1245
((3) 0 () 1 ((q lib "APS-Aliens-Attack/main.rkt")) () (h ! (equal) ((c form c (c (? . 0) q ROCKET-IMG2)) q (257 . 2)) ((c def c (c (? . 0) q ci?)) q (920 . 3)) ((c def c (c (? . 0) q move-rckt-right)) q (769 . 3)) ((c form c (c (? . 0) q IMAGE-HEIGHT)) q (19 . 2)) ((c form c (c (? . 0) q ci)) q (93 . 2)) ((c def c (c (? . 0) q draw-rocket-img)) q (561 . 7)) ((c form c (c (? . 0) q rocket)) q (146 . 2)) ((c form c (c (? . 0) q key)) q (160 . 2)) ((c def c (c (? . 0) q move-rckt-left)) q (845 . 3)) ((c form c (c (? . 0) q IMAGE-WIDTH)) q (0 . 2)) ((c form c (c (? . 0) q SHOT-IMG2)) q (222 . 2)) ((c form c (c (? . 0) q ROCKET-IMG)) q (239 . 2)) ((c form c (c (? . 0) q ALIEN-IMG)) q (171 . 2)) ((c form c (c (? . 0) q image-x)) q (103 . 2)) ((c def c (c (? . 0) q draw-rocket)) q (458 . 4)) ((c form c (c (? . 0) q E-SCENE2)) q (291 . 2)) ((c form c (c (? . 0) q MAX-CHARS-HORIZONTAL)) q (39 . 2)) ((c form c (c (? . 0) q E-SCENE)) q (276 . 2)) ((c def c (c (? . 0) q draw-ci)) q (307 . 6)) ((c form c (c (? . 0) q ALIEN-IMG2)) q (188 . 2)) ((c form c (c (? . 0) q SHOT-IMG)) q (206 . 2)) ((c form c (c (? . 0) q image-y)) q (118 . 2)) ((c form c (c (? . 0) q MAX-CHARS-VERTICAL)) q (67 . 2)) ((c form c (c (? . 0) q scene)) q (133 . 2))))
syntax
IMAGE-WIDTH
syntax
IMAGE-HEIGHT
syntax
MAX-CHARS-HORIZONTAL
syntax
MAX-CHARS-VERTICAL
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
E-SCENE
syntax
E-SCENE2
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
