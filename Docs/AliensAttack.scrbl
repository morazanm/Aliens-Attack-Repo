#lang scribble/manual

@(require (for-label APS-Aliens-Attack 2htdp/image 2htdp/universe racket (only-in typed/racket/base U Listof Boolean List)))

@title{Aliens Attack}
@author[(author+email "Marco T. Morazán" "morazanm@shu.edu")]
@defmodule[APS-Aliens-Attack]
This teachpack provides constants and functions for the development of the Aliens Attack Video game as
described in the textbook @italic{Animated Problem Solving}.

@table-of-contents[]

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

@section{Data Definitions}
@defidform[ci]
A ci is a character image which is at most 30 x 30 pixels.

@defidform[image-x]
An image-x is an integer in [0..19].

@defidform[image-y]
An image-y is an integer in [0..14].

@defidform[scene]
A scene is a 600 x 450 image.

@defidform[rocket]
A rocket is an image-x.

@defidform[key]
A key is either:
@(linebreak)
1. @racket{right}
@(linebreak)
2. @racket{left}
@(linebreak)
3. not @racket{right} or @racket{left}


@section{Draw-World Functions}

@defproc[(draw-ci [ci ci?] [an-img-x image-x?] [an-img-y image-y?] [scene scene?]) scene?]{
Places the given ci in the given scene at the given image coordinates.}

@defproc[(draw-rocket [a-rocket rocket?] [a-scene scene?]) scene?]{
Draws the default green and red rocket on the given scene at the given coordinate.}

@defproc[(draw-rocket-img [a-rocket-img ci?] [a-rocket rocket?] [a-scene scene?]) scene?]{
Draws the given rocket ci on the given scene at the given coordinate.}
         
@section{Process-Key Functions}

@defproc[(move-rckt-right [a-rocket rocket?]) rocket?]{
Moves the given rocket to the right.}

@defproc[(move-rckt-left [a-rocket rocket?]) rocket?]{
Moves the given rocket to the left.}

@section{Process-Tick Functions}

@section{Predicates}

@defproc[(ci? [ci image?]) boolean?]{
Determines if the given image is a ci.}