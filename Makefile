TYPST = typst

check:
	./scripts/list.sh | ./scripts/check.sh

setup:
	./scripts/list.sh | ./scripts/install.sh

compile:
	$(TYPST) compile --root=. --font-path=fonts main.typ main.pdf

watch:
	$(TYPST) watch --root=. --font-path=fonts main.typ main.pdf

clean:
	rm -rf *.pdf
