pkg update ;pkg upgrade
pkg update -y && pkg upgrade -y
# تثبيت الأدوات الأساسية
pkg install -y git curl wget  nushell  proot-distro unzip neovim
nu
ls
nu
vi $PREFIX/etc/apt/sources.list.d
deb [trusted=yes] https://termux.carapace.sh termux extras  
pkg install tar
rm -rf ~/.local/share/nvim/tree-sitter*
vi
exit 
v
vi
curl -L https://github.com/t184256/nix-in-termux/raw/master/nix-in-termux -o nix-in-termux
chmod +x nix-in-termux
./nix-in-termux 
./nix-in-termux nix run nixpkgs.bashInteractive
./nix-in-termux 
rm -rf ~/.nix
nu
./innix.sh 
mkdir -m 0755 $HOME/.nix
vi .bashrc 
./innix.sh 
mkdir -m 0755 /nix && chown u0_a188 /data/data/com.termux/nix
s
ls
./nix-in-termux 
rm -rf /data/data/com.termux/files/usr/tmp/nix-binary-tarball-unpack.*
rm -rf $HOME/.nix
exit 
pkill -9 **
cs
cd
z
zoxide 
carapace -h
source <(carapace _carapace bash)
pkill -9 **
export FZF_COMPLETION_TRIGGER='~~'
pkill -9 ~~
pkill -9 ~~e
export ~~
export **
ps | fzf
ps | fzf| pkill -9
pkill -9 $( ps | fzf)
exit 
deb [trusted=yes] https://termux.carapace.sh termux extras  
rust
exit 
ps
v
vi
exit 
source .bashrc
fzf
pkill **
exit 
echo FZF_COMPLETION_TRIGGER
echo $FZF_COMPLETION_TRIGGER
ls
./n.sh
chmod +x n.sh 
./n.sh
echo $FZF_COMPLETION_TRIGGER
pkill -9 **
pkill -9 ~~
bat n.sh 
echo $@
builtin cd -- /data/data/com.termux/files/home/.cargo
bat n.sh 
bat ~/n.sh 
z
zi
zoxide 
zoxide init
zoxide init bash
zoxide init bash | bat
zoxide init bash | bat --language bash
# shellcheck shell=bash
# =============================================================================
#
# Utility functions for zoxide.
#
# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {     \builtin pwd -L; }
# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    \builtin cd -- "$@"; }
# =============================================================================
#
# Hook configuration for zoxide.
#
# Hook to add new entries to the database.
__zoxide_oldpwd="$(__zoxide_pwd)"
function __zoxide_hook() {     \builtin local -r retval="$?";     \builtin local pwd_tmp;     pwd_tmp="$(__zoxide_pwd)";     if [[ ${__zoxide_oldpwd} != "${pwd_tmp}" ]]; then         __zoxide_oldpwd="${pwd_tmp}";         \command zoxide add -- "${__zoxide_oldpwd}";     fi;     return "${retval}"; }
# Initialize hook.
if [[ ${PROMPT_COMMAND:=} != *'__zoxide_hook'* ]]; then     PROMPT_COMMAND="__zoxide_hook;${PROMPT_COMMAND#;}"; fi
# Report common issues.
function __zoxide_doctor() {     [[ ${_ZO_DOCTOR:-1} -eq 0 ]] && return 0
    [[ ${PROMPT_COMMAND[@]:-} == *'__zoxide_hook'* ]] && return 0
    [[ ${__vsc_original_prompt_command[@]:-} == *'__zoxide_hook'* ]] && return 0;      _ZO_DOCTOR=0;     \builtin printf '%s\n'         'zoxide: detected a possible configuration issue.'         'Please ensure that zoxide is initialized right at the end of your shell configuration file (usually ~/.bashrc).'         ''         'If the issue persists, consider filing an issue at:'         'https://github.com/ajeetdsouza/zoxide/issues'         ''         'Disable this message by setting _ZO_DOCTOR=0.'         '' >&2; }
# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#
__zoxide_z_prefix='z#'
# Jump to a directory using only keywords.
function __zoxide_z() {     __zoxide_doctor; 
    if [[ $# -eq 0 ]]; then         __zoxide_cd ~;     elif [[ $# -eq 1 && $1 == '-' ]]; then         __zoxide_cd "${OLDPWD}";     elif [[ $# -eq 1 && -d $1 ]]; then         __zoxide_cd "$1";     elif [[ $# -eq 2 && $1 == '--' ]]; then         __zoxide_cd "$2";     elif [[ ${@: -1} == "${__zoxide_z_prefix}"?* ]]; then
        \builtin local result="${@: -1}";         __zoxide_cd "${result:${#__zoxide_z_prefix}}";     else         \builtin local result
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&             __zoxide_cd "${result}";     fi; }
# Jump to a directory using interactive search.
function __zoxide_zi() {     __zoxide_doctor;     \builtin local result;     result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"; }
# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#
\builtin unalias z &>/dev/null || \builtin true
function z() {     __zoxide_z "$@"; }
\builtin unalias zi &>/dev/null || \builtin true
function zi() {     __zoxide_zi "$@"; }
# Load completions.
# - Bash 4.4+ is required to use `@Q`.
# - Completions require line editing. Since Bash supports only two modes of
#   line editing (`vim` and `emacs`), we check if either them is enabled.
# - Completions don't work on `dumb` terminals.
if [[ ${BASH_VERSINFO[0]:-0} -eq 4 && ${BASH_VERSINFO[1]:-0} -ge 4 || ${BASH_VERSINFO[0]:-0} -ge 5 ]] &&     [[ :"${SHELLOPTS}": =~ :(vi|emacs): && ${TERM} != 'dumb' ]]; then     function __zoxide_z_complete_helper() {         READLINE_LINE="z ${__zoxide_result@Q}";         READLINE_POINT=${#READLINE_LINE};         bind '"\e[0n": accept-line';         \builtin printf '\e[5n' >/dev/tty;     };      function __zoxide_z_complete() {
        [[ ${#COMP_WORDS[@]} -eq $((COMP_CWORD + 1)) ]] || return; 
        if [[ ${#COMP_WORDS[@]} -eq 2 ]]; then             \builtin mapfile -t COMPREPLY < <(
                \builtin compgen -A directory -- "${COMP_WORDS[-1]}" || \builtin true
            )
        elif [[ -z ${COMP_WORDS[-1]} ]]; then
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- "${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-2}")" && {
                COMPREPLY=("${__zoxide_z_prefix}${__zoxide_result}/"); 
                bind -x '"\e[0n": __zoxide_z_complete_helper';                 \builtin printf '\e[5n' >/dev/tty;             };         fi;     };      \builtin complete -F __zoxide_z_complete -o filenames -- z;     \builtin complete -r zi &>/dev/null || \builtin true; fi
# =============================================================================
#
# To initialize zoxide, add this to your shell configuration file (usually ~/.bashrc):
#
# eval "$(zoxide init bash)"
z 
zi 
l
exit 
ls
cd /cache
exit 
b
zypper
apt-get -y install podman
exit 
