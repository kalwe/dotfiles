# bash functions

# cd and ls in one
cl() {
  local dir="$1"
  local dir="${dir:=$HOME}"
  if [[ -d "$dir" ]]; then
    cd "$dir" >/dev/null; ls
  else
    echo "bash: cl: $dir: Directory not found"
  fi
}

# return beautifier $?
exitstatus() {
  if [[ $? == 0 ]]; then
    echo -e "\033[032m;)\e[0m"
  else
    echo -e "\033[031mx(\e[0m"
  fi
}

# simple calculator
calc() {
    echo "scale=3;$@" | bc -l
}

# return git branch if folder .git exist
gbranch() {
  if [ -d .git ]; then
    parse_git_branch
  else
    echo "Git: repository not initialized. Use command: git init."
  fi
}

# return git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

