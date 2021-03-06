#!/bin/sh

R_HOME=/usr/lib/R

R_SHARE_DIR=/usr/share/R/share
export R_SHARE_DIR
R_INCLUDE_DIR=/usr/share/R/include
export R_INCLUDE_DIR
R_DOC_DIR=/usr/share/R/doc
export R_DOC_DIR

JRI_LD_PATH=${R_HOME}/lib:${R_HOME}/bin:
if test -z "$LD_LIBRARY_PATH"; then
  LD_LIBRARY_PATH=$JRI_LD_PATH
else
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JRI_LD_PATH
fi
JAVA=/usr/bin/java

: ${CLASSPATH=.:lib:src}

export R_HOME
export LD_LIBRARY_PATH

#if [ -z "$1" ]; then
#    echo ""
#    echo " Usage: run <class> [...]"
#    echo ""
#    echo " For example: ./run rtest"
#    echo " Set CLASSPATH variable if other than .:examples is desired"
#    echo ""
#else
javac -cp .:lib/JRI.jar  src/ModelExecutor.java

${JAVA} -Djava.library.path=.:lib: -cp ${CLASSPATH}:lib/JRI.jar ModelExecutor
#fi