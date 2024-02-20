user_name() {
  echo "%B%{$FG[166]%}[%n]%{$reset_color%}%b"
}

current_time() {
  echo "%B%{$FG[246]%}󰥔 %*%{$reset_color%}%b"
}

directory() {
  echo "%{$FG[195]%}%0/%{$reset_color%}"
}

chevron() {
  echo $'\uf054'
}

big_arrow_ok() {
  echo "%{$FG[076]%} $(chevron) %{$reset_color%}"
}

big_arrow_ko() {
  echo "%{$FG[196]%} $(chevron) %{$reset_color%}"
}

big_arrow() {
  echo "%(?.$(big_arrow_ok).$(big_arrow_ko))"
}

PROMPT='$(current_time) $(user_name)  $(directory) $(git_prompt_info)
$(big_arrow)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}󰞑"
