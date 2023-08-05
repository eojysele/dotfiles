prompt_segment() {
  echo -n "%{$fg_bold[$1]%}"
  echo -n $2
}

# End the prompt, closing any open segments
prompt_end() {
  echo -n "%{%k%}"
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment cyan "%(!.%{%F{yellow}%}.)%n@%m:"
  fi
}

prompt_dir() {
  prompt_segment blue '%~'
}

prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$''
  }
  local ref dirty mode repo_path

   if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    ref="$(git describe --exact-match --tags HEAD 2> /dev/null)" || \
    ref="$(git rev-parse --short HEAD 2> /dev/null)" 
    if [[ -n $dirty ]]; then
      prompt_segment yellow
    else
      prompt_segment green
    fi

    local ahead behind
    ahead=$(git log --oneline @{upstream}.. 2>/dev/null)
    behind=$(git log --oneline ..@{upstream} 2>/dev/null)
    if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then
      PL_BRANCH_CHAR=$'󱞾󱞤'
    elif [[ -n "$ahead" ]]; then
      PL_BRANCH_CHAR=$'󱞾'
    elif [[ -n "$behind" ]]; then
      PL_BRANCH_CHAR=$'󱞤'
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    echo -n " (${${ref:gs/%/%%}/refs\/heads\//$PL_BRANCH_CHAR }${mode})"
  fi
}

build_prompt() {
  RETVAL=$?
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
