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
    # echo '   manage regenerate                     regenerate files upon modification '
    # echo '   manage publish                        generate using production settings '
    # echo '   manage serve [PORT=8000]              serve site at http://localhost:8000'
    # echo '   manage serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80    '
    # echo '   manage devserver [PORT=8000]          start/restart develop_server.sh    '
    # echo '   manage stopserver                     stop local server                  '
    # echo '   manage ssh_upload                     upload the web site via SSH        '
    # echo '   manage rsync_upload                   upload the web site via rsync+ssh  '
    # echo '   manage dropbox_upload                 upload the web site via Dropbox    '
    # echo '   manage ftp_upload                     upload the web site via FTP        '
    # echo '   manage s3_upload                      upload the web site via S3         '
    # echo '   manage cf_upload                      upload the web site via Cloud Files'
    # echo '   manage github                         upload the web site via gh-pages   '
    # echo '                                                                          '
    # echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
    # echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
    echo '                                                                          '
}

html() {

    pelican ${INPUTDIR} -o ${OUTPUTDIR} -s ${CONFFILE} ${PELICANOPTS}
}


clean() {

    [ ! -d ${OUTPUTDIR} ] || rm -rf ${OUTPUTDIR}
}



$@