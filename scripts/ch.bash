#!/bin/env bash
selected=`cat ~/dot-file/scripts/sheet/lang ~/dot-file/scripts/sheet/com | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux split-window bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux split-window bash -c "curl -s cht.sh/$selected~$query | less"
fi
