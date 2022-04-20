
alias gits='git status'
alias gitc='git checkout'

GIT_BIN="${GIT_BIN:-$(which git)}"  # when GIT_BIN not declared, nor is git, so it should point to correct git bin
git() {
    if [[ "$(echo "$0 $*" | xargs)" == "git ammend" ]]; then
        ${GIT_BIN} commit --amend --no-edit
    else
        ${GIT_BIN} "$@"
    fi
}