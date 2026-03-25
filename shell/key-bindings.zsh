function __ohmk_save__() {
  local command
  command="${BUFFER}"
  ohmk -i "$command"
  BUFFER=""
  CURSOR=0x7fffffff
  zle reset-prompt
}

function __ohmk_search__() {
  local query res
  query="${BUFFER}"

  # Use file descriptor to allow stdout passthrough while capturing stderr
  exec 3>&1
  res=$(ohmk -s "$query" 2>&1 1>&3)
  exec 3>&-

  BUFFER="${res}"
  CURSOR=0x7fffffff
  zle reset-prompt
}

zle -N __ohmk_save__
zle -N __ohmk_search__

bindkey '^B' __ohmk_save__
bindkey '^G' __ohmk_search__
