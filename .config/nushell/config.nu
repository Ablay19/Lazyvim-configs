# config.nu
#
# Installed by:
# version = "0.104.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.edit_mode = "vi"
# TODO: Aliases
alias v = nvim
alias s = pkg search
alias i = pkg install
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..
alias ...... = cd ../../../../..
alias l = ls --all
alias c = clear
alias ll = ls -l
alias lt = eza --tree --level=2 --long --icons --git
alias v = nvim
alias as = aerospace
zoxide init nushell | save --raw --force ~/.zoxide.nu
source ~/.zoxide.nu
$env.EDITOR = "nvim"
def up [] {pkg update ; pkg upgrade -y} # up
$env.PKG_CONFIG_PATH = ($env.PREFIX | path join 'lib/pkgconfig')
$env.PATH = ($env.PATH | split row (char esep) | prepend "/data/data/com.termux/files/home/.config/carapace/bin")

def --env get-env [name] { $env | get $name }
def --env set-env [name, value] { load-env { $name: $value } }
def --env unset-env [name] { hide-env $name }

let carapace_completer = {|spans|
  # if the current command is an alias, get it's expansion
  let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

  # overwrite
  let spans = (if $expanded_alias != null  {
    # put the first word of the expanded alias first in the span
    $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
  } else {
    $spans
  })

  carapace $spans.0 nushell ...$spans
  | from json
}

mut current = (($env | default {} config).config | default {} completions)
$current.completions = ($current.completions | default {} external)
$current.completions.external = ($current.completions.external
| default true enable
| default $carapace_completer completer)

$env.config = $current
$env.PATH = ($env.PATH | append '/data/data/com.termux/files/home/.cargo/bin')
source ~/.cache/carapace/init.nu
echo "diff "
