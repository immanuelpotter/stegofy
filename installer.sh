#!/bin/bash
create_dir(){
    if [[ ! -d /usr/local/bin ]] ; then
        mkdir /usr/local/bin
        echo "Dir /usr/local/bin created."
        sleep 1
    else
        echo "/usr/local/bin exists."
        sleep 1
    fi
}

update_path(){
    grep_path=$(echo $PATH | grep /usr/local/bin)
    if [[ -z $grep_path ]] ; then
        export PATH=$PATH:/usr/local/bin
        echo "Path updated."
        sleep 1
    else
        echo "/usr/local/bin already on path."
        sleep 1
    fi
}

copy_file(){
    cp stegofy /usr/local/bin
    sleep 1
    echo "Stegofy has been copied from here to your /usr/local/bin directory."
}

main(){
    create_dir
    update_path
    copy_file
}

main
