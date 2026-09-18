#lang scribble/manual

@(require (for-label "../Constants/Image-Constants.rkt"
                     APS-Aliens-Attack 2htdp/image 2htdp/universe racket (only-in typed/racket/base U Listof Boolean List)))

@title{Aliens Attack}
@author[(author+email "Marco T. Morazán" "morazanm@shu.edu")]
@defmodule[APS-Aliens-Attack]
This teachpack provides constants and functions for the development of the Aliens Attack Video game as
described in the textbook @italic{Animated Problem Solving}.

@table-of-contents[]

@section{Data Definitions}
@defidform[IMAGE-WIDTH]{The maximum width of the image is @bold{30} pixels.}

@defidform[IMAGE-HEIGHT]{The maximum height of the image is @bold{30} pixels.}

@defidform[MAX-CHARS-HORIZONTAL]{The maximum amount of character images that fit horizontally is @bold{20}.}

@defidform[MAX-CHARS-VERTICAL]{The maximum amount of character images that fit vertically is @bold{15}.}

@defidform[ci]{
A @italic{ci} is a character image has dimensions which are at most @racket[IMAGE-WIDTH] x @racket[IMAGE-HEIGHT] pixels.}

@defidform[image-x]{
An @italic{image-x} is an integer in [@racket[0]..(@racket[sub1] @racket[MAX-CHARS-HORIZONTAL])].}

@defidform[image-y]{
An @italic{image-y} is an integer in [@racket[0]..(@racket[sub1] @racket[MAX-CHARS-VERTICAL])].}

@defidform[scene]
A @italic{scene} is a (@racket[MAX-CHARS-HORIZONTAL] @racket[*] @racket[IMAGE-WIDTH]) x (@racket[MAX-CHARS-VERTICAL] @racket[*] @racket[IMAGE-HEIGHT]) image.

@defidform[rocket]
A @italic{rocket} is an @racket[image-x].

@defidform[key]
A @italic{key} is either:
@(linebreak)
1. @racket{right}
@(linebreak)
2. @racket{left}
@(linebreak)
3. @racket{ }
@(linebreak)
4. Not @racket{right}, @racket{left}, or @racket{ }.

@section{Constants}
@defidform[ALIEN-IMG]
The default black alien image.
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/alien-img}

@defidform[ALIEN-IMG2]
The default orange alien image.
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/alien-img2}

@defidform[SHOT-IMG]
The default orange shot image.
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/shot-img}

@defidform[SHOT-IMG2]
The default blue shot image.
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/shot-img2}

@defidform[ROCKET-IMG]
The default green and red rocket image.
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/rocket-img}

@defidform[ROCKET-IMG2]
The default orange and brown rocket image.
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/rocket-img2}

@defidform[E-SCENE]
An empty pink scene.

@defidform[E-SCENE2]
An empty black scene.

@section{Draw-World Functions}

@defproc[(draw-ci [ci ci?] [img-x image-x?] [img-y image-y?] [scene scene?]) scene?]{
Places @italic{ci} in @italic{scene} at position (@italic{img-x}, @italic{img-y}).}

@defproc[(draw-rocket [rocket rocket?] [scene scene?]) scene?]{
Draws the default green and red rocket in @italic{scene} at position @italic{rocket}.}

@defproc[(draw-rocket-img [rocket-img ci?] [rocket rocket?] [scene scene?]) scene?]{
Draws @italic{rocket-img} in @italic{scene} at position @italic{rocket}.}
         
@section{Process-Key Functions}

@defproc[(move-rckt-right [rocket rocket?]) rocket?]{
Moves @italic{rocket} to the right.}

@defproc[(move-rckt-left [rocket rocket?]) rocket?]{
Moves @italic{rocket} to the left.}

@section{Process-Tick Functions}

@section{Predicates}

@defproc[(ci? [img image?]) boolean?]{
Returns @racket[#true] if @italic{img} is a @racket[ci], otherwise @racket[#false].}