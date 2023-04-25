#!/bin/bash
#--------------------#
# Setting the prompt #
#--------------------#

unset PS1

PROMPT='%(?.%F{#b8bb26}.%F{yellow}?%?)%f %B%F{#fe8019}%1~%f%b $(gitprompt) %B%F{#98971a} '
RPROMPT='%F{#8ec07c}%*'
