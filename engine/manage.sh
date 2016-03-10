#!/bin/sh

BASEDIR=$(pwd)
INPUTDIR=${BASEDIR}/content
OUTPUTDIR=${BASEDIR}/output
CONFFILE=${BASEDIR}/pelicanconf.py
PELICANOPTS=""


usage() {

    echo 'Usage:                                                                    '
    echo '   ./manage html                           (re)generate the web site          '
    echo '   ./manage clean                          remove the generated files         '
    echo '   ./manage serve                          serve site at http://localhost:8000'
    # echo '   ./manage regenerate                     regenerate files upon modification '
    # echo '   manage github                         upload the web site via gh-pages   '
    # echo '                                                                          '
}

html() {

    pelican ${INPUTDIR} -o ${OUTPUTDIR} -s ${CONFFILE} ${PELICANOPTS}
}


clean() {

    [ ! -d ${OUTPUTDIR} ] || rm -rf ${OUTPUTDIR}
}

serve() {

    cd ${OUTPUTDIR} && python -m pelican.server 8000
}

# regenerate() {
#     pelican -r ${INPUTDIR} -o ${OUTPUTDIR} -s ${CONFFILE} ${PELICANOPTS}
# }

$@