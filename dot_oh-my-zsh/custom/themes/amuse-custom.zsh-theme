# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$FG[013]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=")"

function emoji-clock() {
  # Add 15 minutes to the current time and save the value as $minutes.
  (( minutes = $(date '+%M') + 15 ))
  (( hour = $(date '+%I') + minutes / 60 ))
  # make sure minutes and hours don't exceed 60 nor 12 respectively
  (( minutes %= 60 )); (( hour %= 12 ))

  case $hour in
     0) clock="🕛"; [ $minutes -ge 30 ] && clock="🕧";;
     1) clock="🕐"; [ $minutes -ge 30 ] && clock="🕜";;
     2) clock="🕑"; [ $minutes -ge 30 ] && clock="🕝";;
     3) clock="🕒"; [ $minutes -ge 30 ] && clock="🕞";;
     4) clock="🕓"; [ $minutes -ge 30 ] && clock="🕟";;
     5) clock="🕔"; [ $minutes -ge 30 ] && clock="🕠";;
     6) clock="🕕"; [ $minutes -ge 30 ] && clock="🕡";;
     7) clock="🕖"; [ $minutes -ge 30 ] && clock="🕢";;
     8) clock="🕗"; [ $minutes -ge 30 ] && clock="🕣";;
     9) clock="🕘"; [ $minutes -ge 30 ] && clock="🕤";;
    10) clock="🕙"; [ $minutes -ge 30 ] && clock="🕥";;
    11) clock="🕚"; [ $minutes -ge 30 ] && clock="🕦";;
     *) clock="⌛";;
  esac
  echo $clock
}

PROMPT='
$FG[121]%m:
%{$fg_bold[green]%}%~%{$reset_color%} $FG[219]$(virtualenv_prompt_info)$reset_color$(git_prompt_info) $(emoji-clock) %{$fg_bold[red]%}%*%{$reset_color%}
→ '

RPROMPT='$(ruby_prompt_info)'

