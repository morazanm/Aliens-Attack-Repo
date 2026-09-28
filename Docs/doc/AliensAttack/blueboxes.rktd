2328
((3) 0 () 1 ((q lib "APS-Aliens-Attack/main.rkt")) () (h ! (equal) ((c form c (c (? . 0) q MAX-CI-WIDTH)) q (0 . 2)) ((c form c (c (? . 0) q ROCKET-IMG2)) q (404 . 2)) ((c def c (c (? . 0) q new-dir-after-right)) q (1586 . 3)) ((c form c (c (? . 0) q scene-width)) q (211 . 2)) ((c def c (c (? . 0) q draw-alien)) q (839 . 4)) ((c def c (c (? . 0) q alien-reached-earth?)) q (1859 . 3)) ((c def c (c (? . 0) q draw-rocket-img)) q (705 . 5)) ((c form c (c (? . 0) q direction)) q (301 . 2)) ((c form c (c (? . 0) q key)) q (290 . 2)) ((c def c (c (? . 0) q alien-at-right-edge?)) q (1710 . 3)) ((c def c (c (? . 0) q move-left-image-x)) q (1284 . 3)) ((c def c (c (? . 0) q move-right-image-x)) q (1201 . 3)) ((c form c (c (? . 0) q SHOT-IMG2)) q (369 . 2)) ((c form c (c (? . 0) q ROCKET-IMG)) q (386 . 2)) ((c form c (c (? . 0) q scene-height)) q (230 . 2)) ((c form c (c (? . 0) q image-x)) q (105 . 2)) ((c form c (c (? . 0) q ALIEN-IMG2)) q (335 . 2)) ((c def c (c (? . 0) q draw-ci)) q (471 . 6)) ((c form c (c (? . 0) q scene)) q (250 . 2)) ((c form c (c (? . 0) q max-image-y)) q (173 . 2)) ((c def c (c (? . 0) q draw-alien-img)) q (930 . 5)) ((c def c (c (? . 0) q ci?)) q (1656 . 3)) ((c form c (c (? . 0) q TICK-RATE)) q (454 . 2)) ((c def c (c (? . 0) q move-rckt-right)) q (1058 . 3)) ((c form c (c (? . 0) q ci)) q (95 . 2)) ((c form c (c (? . 0) q min-image-y)) q (192 . 2)) ((c form c (c (? . 0) q rocket)) q (263 . 2)) ((c def c (c (? . 0) q alien-at-left-edge?)) q (1785 . 3)) ((c def c (c (? . 0) q new-dir-after-left)) q (1517 . 3)) ((c def c (c (? . 0) q move-down-image-y)) q (1366 . 3)) ((c def c (c (? . 0) q move-rckt-left)) q (1130 . 3)) ((c form c (c (? . 0) q max-image-x)) q (120 . 2)) ((c form c (c (? . 0) q ALIEN-IMG)) q (318 . 2)) ((c def c (c (? . 0) q new-dir-after-down)) q (1448 . 3)) ((c form c (c (? . 0) q MAX-CHARS-HORIZONTAL)) q (41 . 2)) ((c form c (c (? . 0) q E-SCENE2)) q (438 . 2)) ((c def c (c (? . 0) q draw-rocket)) q (610 . 4)) ((c form c (c (? . 0) q E-SCENE)) q (423 . 2)) ((c form c (c (? . 0) q min-image-x)) q (139 . 2)) ((c form c (c (? . 0) q SHOT-IMG)) q (353 . 2)) ((c form c (c (? . 0) q alien)) q (277 . 2)) ((c form c (c (? . 0) q image-y)) q (158 . 2)) ((c form c (c (? . 0) q MAX-CHARS-VERTICAL)) q (69 . 2)) ((c form c (c (? . 0) q MAX-CI-HEIGHT)) q (20 . 2))))
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
max-image-x
syntax
min-image-x
syntax
image-y
syntax
max-image-y
syntax
min-image-y
syntax
scene-width
syntax
scene-height
syntax
scene
syntax
rocket
syntax
alien
syntax
key
syntax
direction
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
syntax
TICK-RATE
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
(draw-alien alien scene) -> scene?
  alien : alien?
  scene : scene?
procedure
(draw-alien-img alien-img alien scene) -> scene?
  alien-img : ci?
  alien : alien?
  scene : scene?
procedure
(move-rckt-right rocket) -> rocket?
  rocket : rocket?
procedure
(move-rckt-left rocket) -> rocket?
  rocket : rocket?
procedure
(move-right-image-x img-x<max) -> image-x?
  img-x<max : image-x?
procedure
(move-left-image-x img-x>min) -> image-x?
  img-x>min : image-x?
procedure
(move-down-image-y img-y<max) -> image-y?
  img-y<max : image-y?
procedure
(new-dir-after-down alien) -> dir?
  alien : alien?
procedure
(new-dir-after-left alien) -> dir?
  alien : alien?
procedure
(new-dir-after-right alien) -> dir?
  alien : alien?
procedure
(ci? img) -> boolean?
  img : image?
procedure
(alien-at-right-edge? alien) -> boolean?
  alien : alien?
procedure
(alien-at-left-edge? alien) -> boolean?
  alien : alien?
procedure
(alien-reached-earth? alien) -> boolean?
  alien : alien?
