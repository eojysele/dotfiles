PROMPT='%{$fg_bold[cyan]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[white]%}  % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="  "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} 󰀁"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} "
