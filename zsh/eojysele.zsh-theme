autoload -U colors && colors

base_prompt(){
	echo -n "%{$fg[$1]%}$2%{$reset_color%} "
}

bold_prompt(){
	echo -n "%{$fg_bold[$1]%}$2%{$reset_color%} "
}

user_prompt(){
	if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		bold_prompt cyan " %n@%m"
	fi
}

dir_prompt(){
	bold_prompt blue " %~"
}

git_prompt(){
	local result git_branch status_color git_branch_icon
	if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
		#default values
		status_color="green"
		git_branch_icon=" "
		git_branch=$(git branch --show-current)

		if [[ "$(git status -s 2> /dev/null)" != "" ]]; then
			status_color="yellow"
		fi

		ahead=$(git log --oneline @{upstream}.. 2>/dev/null)
		behind=$(git log --oneline ..@{upstream} 2>/dev/null)
		if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then
			git_branch_icon=$'󱞾󱞤 '
		elif [[ -n "$ahead" ]]; then
			git_branch_icon=$'󱞾 '
		elif [[ -n "$behind" ]]; then
			git_branch_icon=$'󱞤 '
		fi

		result=$git_branch_icon$git_branch
		bold_prompt $status_color $result
	fi
}

finish_prompt(){
	NEWLINE=$'\n󱞪'
	base_prompt white $NEWLINE
}

build_prompt() {
	user_prompt
	dir_prompt
	git_prompt
	finish_prompt
}

setopt PROMPT_SUBST
PROMPT='$(build_prompt)'
