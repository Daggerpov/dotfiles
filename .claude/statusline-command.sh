#!/bin/sh
# Claude Code statusLine command
# Mirrors key elements from the Powerlevel10k prompt configuration

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
if [ -n "$cwd" ]; then
  home="$HOME"
  case "$cwd" in
    "$home"*) cwd="~${cwd#$home}" ;;
  esac
fi

# Git branch (mirrors vcs segment)
git_info=""
if [ -n "$cwd" ]; then
  full_cwd=$(echo "$cwd" | sed "s|^~|$HOME|")
  branch=$(git -C "$full_cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$full_cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_info=" \033[33m($branch)\033[0m"
  fi
fi

# user@host (mirrors context segment)
user_host="$(whoami)@$(hostname -s)"

# Context usage indicator
ctx_info=""
if [ -n "$used_pct" ]; then
  used_int=$(printf '%.0f' "$used_pct")
  if [ "$used_int" -ge 80 ]; then
    ctx_info=" \033[31mctx:${used_int}%\033[0m"
  elif [ "$used_int" -ge 50 ]; then
    ctx_info=" \033[33mctx:${used_int}%\033[0m"
  else
    ctx_info=" \033[32mctx:${used_int}%\033[0m"
  fi
fi

# Model info
model_info=""
if [ -n "$model" ]; then
  model_info=" \033[36m[$model]\033[0m"
fi

printf "\033[34m%s\033[0m \033[32m%s\033[0m%s%s%s" \
  "$user_host" \
  "$cwd" \
  "$git_info" \
  "$model_info" \
  "$ctx_info"
