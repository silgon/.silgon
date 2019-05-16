#!/usr/bin/env bash

# this file should set the COMPLETES variable

# find out ros base and install path
source ${BASH_PATH}/conda/conda.sh

# list directoris belwo install path
if [ $COMP_CWORD -eq 2 -a -d $CONDA_INSTALL_PATH ] ; then
    COMPLETES=$(get_directories "$CONDA_INSTALL_PATH")
    COMPREPLY=( $(compgen -W "$COMPLETES" -- ${COMP_WORDS[COMP_CWORD]}) )
elif [ $COMP_CWORD -eq 3 -a -d $CONDA_INSTALL_PATH ] ; then
    COMPLETES=$(get_directories "$CONDA_INSTALL_PATH")
    for i in $COMPLETES
        do
            if [ "$i" == "$2" ] ; then
                COMPLETES=$(get_directories "$CONDA_BASE_PATH/$2/envs")
                break;
            fi
    done
    COMPREPLY=( $(compgen -W "$COMPLETES" -- ${COMP_WORDS[COMP_CWORD]}) )
else
    COMPLETES=""
fi
