#lang scribble/manual

@(require (for-label 2htdp/image 2htdp/universe racket (only-in typed/racket/base U Listof Boolean List)))

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


@section{Draw-World Functions}

@section{Process-Key Functions}

@section{Process-Tick Functions}

@section{Predicates}

@defproc[(ci? [ci image?]) boolean?]
Determines if the given image is a ci