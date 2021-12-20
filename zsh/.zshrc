PATH=$PATH:$HOME/.local/bin/

autoload -U colors && colors

# Set prompts
PROMPT='[%F{green}sigma%F{yellow}@%F{blue}GNU+🐧%F{white}] %F{blue}%~ %F{white}↠ '

bindkey -v             # vi key bindings
bindkey ' ' magic-space  # also do history expansion on space

# Provide pathmunge for /etc/profile.d scripts
pathmunge()
{
    if ! echo $PATH | /bin/grep -qE "(^|:)$1($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH=$PATH:$1
        else
            PATH=$1:$PATH
        fi
    fi
}

_src_etc_profile_d()
{
    #  Make the *.sh things happier, and have possible ~/.zshenv options like
    # NOMATCH ignored.
    emulate -L ksh


    # from bashrc, with zsh fixes
    if [[ ! -o login ]]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
            if [ -r "$i" ]; then
                . $i
            fi
        done
        unset i
    fi
}
_src_etc_profile_d

unset -f pathmunge _src_etc_profile_d

