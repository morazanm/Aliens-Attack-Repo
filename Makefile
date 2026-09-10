SHELL := /bin/bash

install:
	@raco make main.rkt
.PHONY: install

docs:
	cd Docs; scribble +m ./AliensAttack.scrbl
.PHONY: docs

clean:
	rm -vf Docs/*.{html,js,png,css}
.PHONY: clean
