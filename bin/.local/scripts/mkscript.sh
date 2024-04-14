#!/bin/bash

# A bash script that creates a new script file with the given name and opens it in the default text editor.

get_script_name() {
    read -p "Enter a file name: " script_name
}

open_file() {
    cd $HOME/dotfiles/bin/.local/scripts/
    if [ -f $script_name.sh ]; then
        echo "File already exists!"
        exit 1
    fi
    touch $script_name.sh

    echo "#!/bin/bash" >> $script_name.sh
    echo " " >> $script_name.sh
    echo "# A bash script that" >> $script_name.sh

    nvim $script_name.sh -c :NoNeckPain
}

get_script_name
open_file

