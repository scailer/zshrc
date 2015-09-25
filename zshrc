SAVEHIST=500
HISTFILE=~/.zsh_history
export EDITOR="vim"

bindkey '\e[3~' delete-char # del
bindkey ';5D' backward-word # ctrl+left 
bindkey ';5C' forward-word #ctrl+right
bindkey "^[[7~" beginning-of-line 

autoload -U compinit promptinit && compinit && promptinit;
autoload -U colors && colors
setopt prompt_subst

git_prompt_info() { 
    if [ -d .git ]; then
        git branch | awk '/^\*/ { print(" ["$2"]") }'
    fi
}

get_git_dirty() { 
    if [ -d .git ]; then
        git diff --quiet || echo 'red'
    fi
}

get_splitter() {
    if [ -w . ];
    then
        echo 'blue'
    else
        echo 'red'
    fi
}

PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%}%c%{$fg_bold[$(get_git_dirty)]%}$(git_prompt_info)%{$fg[$(get_splitter)]%} $ %{$reset_color%}'

alias ll='ls -l --color=auto'
alias la='ls -Al'               # показать скрытые файлы
alias ls='ls -hF --color'       # выделить различные типы файлов цветом
alias lx='ls -lXB'              # сортировка по расширению
alias lk='ls -lSr'              # сортировка по размеру
alias lc='ls -lcr'              # сортировка по времени изменения
alias lu='ls -lur'              # сортировка по времени последнего обращения
alias lr='ls -lR'               # рекурсивный обход подкаталогов
alias lt='ls -ltr'              # сортировка по дате
alias lm='ls -al |more'         # вывод через 'more'

alias pp='mpc toggle'
alias ff='firefox'
alias grep='grep --color=auto'
alias nautilus='nautilus --no-desktop'
alias python='ipython'

alias dj='./env/bin/python manage.py '
alias run='./env/bin/python manage.py runserver '
alias activate='source env/bin/activate'
