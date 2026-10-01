#lang scribble/manual

@(require (for-label APS-Aliens-Attack 2htdp/image 2htdp/universe
                     (only-in lang/htdp-beginner make-posn posn?)
                     (only-in racket sub1 * boolean? listof list cons any/c number?) 
                     (only-in typed/racket/base U Listof Boolean List)))

@title{Aliens Attack}
@author[(author+email "Marco T. Morazán" "morazanm@shu.edu")]
@defmodule[APS-Aliens-Attack]
This teachpack provides constants and functions for the development of the Aliens Attack Video game as
described in the textbook @italic{Animated Problem Solving}.

@table-of-contents[]

@section{Data Definitions}
@defidform[MAX-CI-WIDTH]{The maximum width of a character image is @bold{30} pixels.}

@defidform[MAX-CI-HEIGHT]{The maximum height of a character image is @bold{30} pixels.}

@defidform[MAX-CHARS-HORIZONTAL]{The maximum amount of character images that fit horizontally is @bold{20}.}

@defidform[MAX-CHARS-VERTICAL]{The maximum amount of character images that fit vertically is @bold{15}.}

@defidform[ci]{
A @italic{ci} is a character image whose dimensions are at most @racket[MAX-CI-WIDTH] x @racket[MAX-CI-HEIGHT] pixels.}

@defidform[image-x]{
An @italic{image-x} is an integer in [@racket[0]..(@racket[sub1] @racket[MAX-CHARS-HORIZONTAL])].}

@defidform[max-image-x]{
The @italic{max-image-x} is (@racket[sub1] @racket[MAX-CHARS-HORIZONTAL]).}

@defidform[min-image-x]{
The @italic{min-image-x} is @racket[0].}

@defidform[image-y]{
An @italic{image-y} is an integer in [@racket[0]..(@racket[sub1] @racket[MAX-CHARS-VERTICAL])].}

@defidform[max-image-y]{
The @italic{max-image-y} is (@racket[sub1] @racket[MAX-CHARS-VERTICAL]).}

@defidform[min-image-y]{
The @italic{min-image-y} is @racket[0].}

@defidform[scene-width]{
The @italic{scene's width} is @racket[(* MAX-CHARS-HORIZONTAL MAX-CI-WIDTH)].}

@defidform[scene-height]{
The @italic{scene's height} is @racket[(* MAX-CHARS-VERTICAL MAX-CI-HEIGHT)].}

@defidform[scene]{
A @italic{scene} is a @racket[scene-width] x @racket[scene-height] image.}

@defidform[rocket]{
A @italic{rocket} is an @racket[image-x].}

@defidform[alien]{
An @italic{alien} is a @racket[posn]: @racket[(make-posn image-x image-y)].}


@defidform[shot]{
A @italic{shot} is either:
@(linebreak)
1. @racket[NO-SHOT]
@(linebreak)
2. A @racket[posn]: @racket[(make-posn image-x image-y)]}

@defidform[key]{
A @italic{key} is either:
@(linebreak)
1. @racket{right}
@(linebreak)
2. @racket{left}
@(linebreak)
3. @racket{ }
@(linebreak)
4. Not @racket{right}, @racket{left}, or @racket{ }.}

@defidform[direction]{
A @italic{direction} (@italic{dir}) is either:
@(linebreak)
1. @racket['right]
@(linebreak)
2. @racket['left]
@(linebreak)
3. @racket['down]}

@section{Constants}
@defidform[ALIEN-IMG]{
The default black alien image.}
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/alien-img}

@defidform[ALIEN-IMG2]{
The default orange alien image.}
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/alien-img2}

@defidform[SHOT-IMG]{
The default orange shot image.}
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/shot-img}

@defidform[SHOT-IMG2]{
The default blue shot image.}
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/shot-img2}

@defidform[ROCKET-IMG]{
The default green and red rocket image.}
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/rocket-img}

@defidform[ROCKET-IMG2]{
The default orange and brown rocket image.}
@(linebreak)
@image[#:suffixes @list[".png"]]{scribImgs/rocket-img2}

@defidform[E-SCENE]{
An empty pink @racket[scene].}

@defidform[E-SCENE2]{
An empty black @racket[scene].}


@defidform[NO-SHOT]{
The symbol representing no shot in the game is @racket['NO-SHOT].}

@defidform[TICK-RATE]{
The default tick rate is @racket[1/4].}

@section{Draw-World Functions}

@defproc[(draw-ci [ci ci?] [img-x image-x?] [img-y image-y?] [scene scene?]) scene?]{
Places @italic{ci} in @italic{scene} at position (@italic{img-x}, @italic{img-y}).}

@defproc[(draw-rocket [rocket rocket?] [scene scene?]) scene?]{
Draws @racket[ROCKET-IMG] in @italic{scene} at position @italic{rocket}.}

@defproc[(draw-rocket-img [rocket-img ci?] [rocket rocket?] [scene scene?]) scene?]{
Draws @italic{rocket-img} in @italic{scene} at position @italic{rocket}.}

@defproc[(draw-alien [alien alien?] [scene scene?]) scene?]{
Draws @racket[ALIEN-IMG] in @italic{scene} at the position of @italic{alien}.}

@defproc[(draw-alien-img [alien-img ci?] [alien alien?] [scene scene?]) scene?]{
Draws @italic{alien-img} in @italic{scene} at the position of @italic{alien}.}

@defproc[(draw-shot [shot shot?] [scene scene?]) scene?]{
Draws @racket[SHOT-IMG] in @italic{scene} at the position of @italic{shot}.}

@defproc[(draw-shot-img [shot-img ci?] [shot shot?] [scene scene?]) scene?]{
Draws @italic{shot-img} in @italic{scene} at the position of @italic{shot}.}
         
@section{Process-Key Functions}

@defproc[(move-rckt-right [rocket rocket?]) rocket?]{
Moves @italic{rocket} to the right.}

@defproc[(move-rckt-left [rocket rocket?]) rocket?]{
Moves @italic{rocket} to the left.}

@defproc[(make-shot [shot shot?] [rocket rocket?]) shot?]{
If @italic{shot} is a @racket[NO-SHOT], return @racket[NO-SHOT]. Otherwise, creates a @racket[posn] at position @italic{rocket}.}

@section{Process-Tick Functions}

@defproc[(move-right-image-x [img-x<max image-x?]) image-x?]{
Moves the @italic{img-x<max} to the right.}

@defproc[(move-left-image-x [img-x>min image-x?]) image-x?]{
Moves the @italic{img-x>min} to the left.}

@defproc[(move-down-image-y [img-y<max image-y?]) image-y?]{
Moves the @italic{img-y<max} down.}

@defproc[(move-up-image-y [img-y>min image-y?]) image-y?]{
Moves the @italic{img-y>min} up.}

@defproc[(move-alien-right [alien alien?]) alien?]{
Moves @italic{alien} to the right.}

@defproc[(move-alien-left [alien alien?]) alien?]{
Moves @italic{alien} to the left.}

@defproc[(move-alien-down [alien alien?]) alien?]{
Moves @italic{alien} down.}

@defproc[(move-shot-up [shot shot?]) shot]{
Moves @italic{shot} up.}

@defproc[(new-dir-after-down [alien alien?]) dir?]{
Computes the @racket[direction] of @italic{alien} when the previous @racket[direction] is @racket['down].}

@defproc[(new-dir-after-left [alien alien?]) dir?]{
Computes the @racket[direction] of @italic{alien} when the previous @racket[direction] is @racket['left].}

@defproc[(new-dir-after-right [alien alien?]) dir?]{
Computes the @racket[direction] of @italic{alien} when the previous @racket[direction] is @racket['right].}


@section{Predicates}

@defproc[(image-x? [num number?]) boolean?]{
Returns @racket[#true] if @italic{num} is an @racket[image-x], otherwise @racket[#false].}

@defproc[(image-y? [num number?]) boolean?]{
Returns @racket[#true] if @italic{num} is an @racket[image-y], otherwise @racket[#false].}

@defproc[(ci? [img image?]) boolean?]{
Returns @racket[#true] if @italic{img} is a @racket[ci], otherwise @racket[#false].}

@defproc[(rocket? [x any/c]) boolean?]{
 Returns @racket[#true] if @italic{x} is a @racket[rocket], otherwise @racket[#false].}

@defproc[(alien? [x any/c]) boolean?]{
 Returns @racket[#true] if @italic{x} is an @racket[alien], otherwise @racket[#false].}

@defproc[(shot? [x any/c]) boolean?]{
 Returns @racket[#true] if @italic{x} is a @racket[shot], otherwise @racket[#false].}

@defproc[(dir? [x any/c]) boolean?]{
 Returns @racket[#true] if @italic{x} is a @racket[dir], otherwise @racket[#false].}

@defproc[(alien-at-right-edge? [alien alien?]) boolean?]{
Returns @racket[#true] if @italic{alien} is at the right edge, otherwise @racket[#false].}

@defproc[(alien-at-left-edge? [alien alien?]) boolean?]{
Returns @racket[#true] if @italic{alien} is at the left edge, otherwise @racket[#false].}

@defproc[(alien-reached-earth? [alien alien?]) boolean?]{
Returns @racket[#true] if @italic{alien} has reached Earth, otherwise @racket[#false].}

@defproc[(hit? [shot shot?] [alien alien?]) boolean?]{
Returns @racket[#true] if @italic{shot} has hit @italic{alien}, otherwise @racket[#false].}
