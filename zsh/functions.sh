#!/bin/bash
#--------------------------#
# Custom functions for ZSH #
#--------------------------#

load_file() {
    if [[ -e "$1" ]]; then
        source "$1"       
    fi

}

install_plugin() {
    PLUGIN_NAME="$(echo $1 | awk -F / '{ print $2 }')"
    # Check to see if the folder already exists
    if [[ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]]; then
        # Source the respective plugin file
        load_file "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        # Fetch the git files
        git clone "https://github.com/$1" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        
        # Source the files
        load_file "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    fi
}
