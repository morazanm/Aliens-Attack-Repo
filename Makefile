SHELL := /bin/bash

install:
	@raco make main.rkt
.PHONY: install

test:
	@raco test -t -j 3 Tests Drawing-Tests Predicate-Tests ProcessTick-Tests ProcessKey-Tests
.PHONY: test

docs:
	cd Docs; scribble +m ./AliensAttack.scrbl
.PHONY: docs

clean:
	rm -vf Docs/*.{html,js,png,css}
.PHONY: clean
