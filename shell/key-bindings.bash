__ohmk_save__() {
	ohmk -i ${READLINE_LINE:0}
	READLINE_LINE=""
	READLINE_POINT=0x7fffffff
}

__ohmk_search__() {
	local query temp_stderr res
	query=$(echo "${READLINE_LINE:0}" | grep -v '^$')
	temp_stderr=$(mktemp /tmp/ohmk_search.XXXXXX) || { echo "Failed to create temp file"; return 1; }
	ohmk -s "$query" 2> "$temp_stderr"
	res=$(<"$temp_stderr")
	READLINE_LINE=${res}
	READLINE_POINT=0x7fffffff
	rm "$temp_stderr"
}

bind -x '"\C-b":__ohmk_save__'
bind -x '"\C-g":__ohmk_search__'
