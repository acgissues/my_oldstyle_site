MD      = markdown
MDFLAGS =
ORDER   = include/header.html - include/footer.html

.SUFFIXES: .html .md

.md.html:
	${MD} ${MDFLAGS} <$< | cat ${ORDER} >$@

all:
	ls -1 raw/**/*.md | sed 's/.md$$/.html/' | xargs make
	mv raw/**/*.html .
