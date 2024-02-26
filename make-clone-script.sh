#!/bin/bash
#
# creates a clone command for each git repository in the base folder

base_repository_directory=$HOME/repos
current_dir=`pwd`

for dir in ${base_repository_directory}/*
do

    dir=${dir%*/}      # remove the trailing "/"
    if [ -d "${dir}/.git" ]; then
        cd ${dir}
        directory_name=${dir##*/}
        get_url=`git remote get-url origin`
        clone_command="git clone ${get_url} ${directory_name}"
        echo $clone_command
    fi
done

cd ${current_dir}
