base_prompt(){
	echo -n "%{$fg[$1]%}$2%{$reset_color%}"
}

bold_prompt(){
	echo -n "%{$fg_bold[$1]%}$2%{$reset_color%}"
}

user_prompt(){
	if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		bold_prompt cyan " %n@%m "
	fi
}

dir_prompt(){
	bold_prompt blue " %~ "
}

git_prompt(){
	if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then

		local status_color="green"
		local branch_icon=" "
		local branch=$(git branch --show-current)$' '
		local repository_status

		local git_status=$(git status -s 2> /dev/null)
		if [[ -n "$git_status" ]]; then
			status_color="yellow"
		fi

		local ahead_icon=$(base_prompt cyan '󱦴')
		local behind_icon=$(base_prompt blue '󱦶')

		local ahead=$(git log --oneline @{upstream}.. 2>/dev/null)
		local behind=$(git log --oneline ..@{upstream} 2>/dev/null)
		if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then
			repository_status=$behind_icon$ahead_icon
		elif [[ -n "$ahead" ]]; then
			repository_status=$ahead_icon
		elif [[ -n "$behind" ]]; then
			repository_status=$behind_icon
		fi

		local result=$branch_icon$branch$repository_status
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
