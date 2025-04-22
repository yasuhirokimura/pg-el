EMACS=	emacs
INSTALL=install -m 644 -p
MKDIR=	mkdir -p
RM=	rm -f

ELCS=	pg.elc \
	pg-bm25.elc \
	pg-geometry.elc \
	pg-gis.elc \
	pg-lo.elc
ELISPDIR!=	${EMACS} -Q --batch --eval "(princ (expand-file-name \"../../site-lisp/pg\" data-directory))"

.SUFFIXES: .el .elc

.el.elc:
	${EMACS} -Q -batch -L . -f batch-byte-compile $<

all: ${ELCS}

install: ${ELCS}
	${MKDIR} ${ELISPDIR}
	${INSTALL} *.el* ${ELISPDIR}

clean:
	${RM} ${ELCS}
