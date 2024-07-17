base_prompt(){
	echo -n "%{$fg[$1]%}$2%{$reset_color%}"
}

bold_prompt(){
	echo -n "%{$fg_bold[$1]%}$2%{$reset_color%}"
}

user_prompt(){
	if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		bold_prompt cyan " %n "
	fi
}

dir_prompt(){
	bold_prompt blue " %c "
}

git_prompt(){
	if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
		local status_color="white"
		local branch_icon=" "
		local branch=$(git branch --show-current)$' '

		local result=$branch_icon$branch
		bold_prompt $status_color $result
	fi
}

finish_prompt(){
	NEWLINE=$'\n󱦰 '
	base_prompt white $NEWLINE
}

build_prompt() {
	user_prompt
	dir_prompt
	git_prompt
	finish_prompt
}

PROMPT='$(build_prompt)'
