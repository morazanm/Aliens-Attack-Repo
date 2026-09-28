1247
((3) 0 () 1 ((q lib "APS-Aliens-Attack/main.rkt")) () (h ! (equal) ((c form c (c (? . 0) q MAX-CI-WIDTH)) q (0 . 2)) ((c form c (c (? . 0) q ROCKET-IMG2)) q (259 . 2)) ((c def c (c (? . 0) q ci?)) q (820 . 3)) ((c def c (c (? . 0) q move-rckt-right)) q (677 . 3)) ((c form c (c (? . 0) q ci)) q (95 . 2)) ((c def c (c (? . 0) q draw-rocket-img)) q (543 . 5)) ((c form c (c (? . 0) q rocket)) q (148 . 2)) ((c form c (c (? . 0) q key)) q (162 . 2)) ((c def c (c (? . 0) q move-rckt-left)) q (749 . 3)) ((c form c (c (? . 0) q SHOT-IMG2)) q (224 . 2)) ((c form c (c (? . 0) q ROCKET-IMG)) q (241 . 2)) ((c form c (c (? . 0) q ALIEN-IMG)) q (173 . 2)) ((c form c (c (? . 0) q image-x)) q (105 . 2)) ((c def c (c (? . 0) q draw-rocket)) q (448 . 4)) ((c form c (c (? . 0) q E-SCENE2)) q (293 . 2)) ((c form c (c (? . 0) q MAX-CHARS-HORIZONTAL)) q (41 . 2)) ((c form c (c (? . 0) q E-SCENE)) q (278 . 2)) ((c def c (c (? . 0) q draw-ci)) q (309 . 6)) ((c form c (c (? . 0) q ALIEN-IMG2)) q (190 . 2)) ((c form c (c (? . 0) q SHOT-IMG)) q (208 . 2)) ((c form c (c (? . 0) q image-y)) q (120 . 2)) ((c form c (c (? . 0) q MAX-CHARS-VERTICAL)) q (69 . 2)) ((c form c (c (? . 0) q MAX-CI-HEIGHT)) q (20 . 2)) ((c form c (c (? . 0) q scene)) q (135 . 2))))
syntax
MAX-CI-WIDTH
syntax
MAX-CI-HEIGHT
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
(draw-ci ci img-x img-y scene) -> scene?
  ci : ci?
  img-x : image-x?
  img-y : image-y?
  scene : scene?
procedure
(draw-rocket rocket scene) -> scene?
  rocket : rocket?
  scene : scene?
procedure
(draw-rocket-img rocket-img rocket scene) -> scene?
  rocket-img : ci?
  rocket : rocket?
  scene : scene?
procedure
(move-rckt-right rocket) -> rocket?
  rocket : rocket?
procedure
(move-rckt-left rocket) -> rocket?
  rocket : rocket?
procedure
(ci? img) -> boolean?
  img : image?
